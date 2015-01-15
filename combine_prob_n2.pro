;combines probabilities and calculates expectation value and error value.
;Author - Yifan Yu
;Version 1.0

;n = 2 version

;parameter format
;maxent_prob : dblarr(n,m)   n - pixels, m = number of bins, probabilities should be normalized already
;
;prior: dblarr(n,m) prior probability of each bin, probability should be normalized
;
;means: flt(m) mean value of each bin
;
;expectation_val: output , fltarr(n)
;error_val: output, fltarr(n)

Pro combine_prob_n2, maxent_prob, prior, means, expectation_val, error_val

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
	tmp_p2 = tmp_p * maxent_prob

	sum_p = total(tmp_p,2)
	sum_p2 = total(tmp_p2,2)

	index2 = where(sum_p2 gt 0, count2)
	if (count2 gt 0) then expectation_val[index2] = (total((tmp_p2 * expanded_mean),2))[index2] / sum_p2[index2]

	index = where(sum_p gt 0, count)
	if (count gt 0) then error_val[index] = (total((tmp_p * abs(expanded_mean - rebin(expectation_val,n_pixels,m_bins))),2))[index] / sum_p[index]

End
