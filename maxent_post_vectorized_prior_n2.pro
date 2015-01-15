;use # of samples as weighting
;removed exp_n as a passed in argument
;uses local prior for bin_files

; Version 3.0 - use new procedure that calculates prior probability using box grids (pdf_2d)
; the grid passed in for local prior probability should span the same area as the probability images


; Version history 
; Version 2.0 - uses the procedure combine_prob.pro

PRO maxent_post_vectorized_prior_n2, xdim, ydim, in_dir, out_dir, def_bin_file, local_pdf

	;read values from bin file.
	;format is class name, min bin val, max bin val, npoints, total plots, bin mean
	noerror = 0
	if (!error_state.code eq 0) then noerror = 1
	bin_data = read_csv(def_bin_file)
	if (!error_state.code ne 0) then print, !error_state.code, !error_state.msg
	if noerror then message, /reset
	nClass = (size(bin_data.(0)))[1]
	mBioVals = dblarr(nClass)
	pTotal = dblarr(nClass)
	for i=0, nClass-1 do begin
		mBioVals[i] = (bin_data.(5))[i]
	endfor
	bin_npoints = ulong(bin_data.(3))
	total_points = total(bin_npoints)

	n_segments = ydim   ; switch back to reading 1 line at a time so that local probability can be easily assigned

	pdf_size = size(local_pdf)
	
	;--------------------------------------------
	journal, out_dir+'/maxent_post_n2.log'
	
	in_files=strarr(nClass)
	
	for n=0, nClass-1 do begin
	;	in_files[n] = in_dir + '/' + strtrim(string(Ranges[n]),2) + '-' + strtrim(string(Ranges[n+1]),2) + '.bil'
		in_files[n]=in_dir + '/' + (bin_data.(0))[n] + '.bil'
	
		print, in_files[n]
	endfor
	
	;obtain input file size and segment information
	in_file_info = file_info(in_files[0])
	in_file_size = in_file_info.size
	n_pixels = in_file_size / n_segments / 4ULL   ;4 for floating point data type
	;divide input file into n_segments for processing

	maxent_prob = dblarr(n_pixels,nClass)
	prior_prob = dblarr(n_pixels,nClass)

	out_expect_val = fltarr(n_pixels)
	out_error_val = fltarr(n_pixels)

	tmp_flt_line = fltarr(n_pixels)
	tmp_byt_line = bytarr(n_pixels)
	
	classP = dblarr(xdim,nClass)
	PNormal = dblarr(xdim,nClass)
	stdBio = dblarr(xdim)
	meanBio = dblarr(xdim)
	
	inLuns = intarr(nClass)
	classWeights = dblarr(nClass)
	
	outLuns = intarr(2)

	;open files for reading	
	for n=0, nClass-1 do begin
		openr, 10+n, in_files[n]
		inLuns[n] = 10+n
		classWeights[n] = float(bin_npoints[n]) / float(total_points)
	endfor

	;openr, zoneLun, zone_image_file, /get_lun
	
	print, 'class weights:', classWeights
	;calculate total probabilities
	print, 'calculating total probabilities....'
	PTotal[*] = 0.
	for j=0ULL, n_segments-1 do begin
		for n=0, nClass-1 do begin
			tmpLun = inLuns[n]
			readu, tmpLun, tmp_flt_line
			index = where(tmp_Flt_Line gt 0, count)
			if (count gt 0) then pTotal[n] += total(tmp_flt_line[index])
		endfor
	endfor
	
	print, pTotal
	
	;reset file pointers
	for n=0, nClass-1 do begin
		tmpLun = inLuns[n]
		point_lun, tmpLun, 0
	endfor
	
	
	openw, 1, out_dir + '/maxent_value_n2_weight4.flt'
	outLuns[0] = 1
	openw, 2, out_dir + '/maxent_error_n2_weight4.flt'
	outLuns[1] = 2
	
	print, 'creating maps....'


	;set up local probabilities
	pdf_sum = total(local_pdf, 1)
	local_pdf_norm = double(local_pdf)
	index = where(pdf_sum gt 0, count)
	for i = 0, nClass-1 do begin
		local_pdf_norm[i,index] /= double(pdf_sum[index])
	endfor

	scale_i = ulong(xdim / pdf_size[2])
	for j=0UL, n_segments-1 do begin

		if (j mod 10 eq 0) then print, j

		maxent_prob[*] = 0
		prior_prob[*] = 0

		out_expect_val[*] = 0
		out_error_val[*] = 0

		;read maxent probabilities and normalize	
		;print, 'reading data segment...'
		for n=0, nClass-1 do begin
			tmpLun = inLuns[n]
			readu, tmpLun, tmp_flt_line
			maxent_prob[*,n] = tmp_flt_line / PTotal[n]
		endfor

		;create arrays for prior probabilities and mean values
		;print, 'creating prior arrays...'

		prob_j = ulong(float(j)/float(n_segments) * float(pdf_size[3]))
		for i=0, pdf_size[2]-1 do begin
			max_i = ((i+1)*scale_i-1) < (xdim-1)
			prior_prob[i*scale_i : max_i, *] = rebin(reform(local_pdf_norm[*,i,prob_j],1,nClass),(max_i-i*scale_i+1), nClass)
		endfor

		;readu, zoneLun, tmp_byt_line
		;for iZone=0, nZones-1 do begin
		;	tmp_index = where(tmp_byt_line eq iZone, count)
		;	if (count gt 0) then prior_prob[tmp_index,*] = rebin(reform(loc_prob(*,iZone),1,nClass),count,nClass)
		;endfor
	
		;Calculate for one line of data
		combine_prob_n2, maxent_prob, prior_prob, mBioVals, out_expect_val, out_error_val
		
		writeu, outLuns[0], out_expect_val
		writeu, outLuns[1], out_error_val
	
	endfor
	
	for n=0, (nClass-1) do begin	
		tmpLun = inLuns[n]
		free_lun, tmpLun
	endfor
	
	for n=0, 1 do begin
		tmpLun = outLuns[n]
		free_lun, tmpLun
	endfor

end

