;combines probabilities and calculates expectation value and error value.
;Author - Yifan Yu
;Version 1.0

;n1 version uses n=1 for calculating expectation value as well as error

;parameter format
;maxent_prob : dblarr(n,m)   n - pixels, m = number of bins, probabilities should be normalized already
;
;prior: dblarr(n,m) prior probability of each bin, probability should be normalized
;
;means: flt(m) mean value of each bin
;
;expectation_val: output , fltarr(n)
;error_val: output, fltarr(n)

Pro combine_prob_n1, maxent_prob, prior, means, expectation_val, error_val

	;Check for dimension compatibilities
	if ((size(maxent_prob))[0] ne 2) then begin
		print, 'Error when combining probabilities, maxent_prob must be a 2-dimensional array!'
		exit
	endif

	n_pixels = (size(maxent_prob))[1]
	m_bins = (size(maxent_prob))[2]

	if ((m_bins ne (size(prior))[2]) or (m_bins ne n_elements(means))) then begin
		print, 'Error! m bins do not match in call to combine_prob!'
		print, 'm_bins', m_bins, 'prior size', n_elements(prior), 'means size', n_elements(means)
		exit
	endif

	expanded_mean = rebin(reform(means,1,m_bins),n_pixels,m_bins)

	tmp_p = maxent_prob * prior
	tmp_p3 = tmp_p * maxent_prob * maxent_prob

	sum_p = total(tmp_p,2)
	;sum_p3 = total(tmp_p3,2)

	;index3 = where(sum_p3 gt 0, count3)
	;if (count3 gt 0) then expectation_val[index3] = (total((tmp_p3 * expanded_mean),2))[index3] / sum_p3[index3]

	index = where(sum_p gt 0, count)
	if (count gt 0) then begin
		expectation_val[index] = (total((tmp_p * expanded_mean),2))[index] / sum_p[index]
		error_val[index] = (total((tmp_p * abs(expanded_mean - rebin(expectation_val,n_pixels,m_bins))),2))[index] / sum_p[index]
	endif
End
