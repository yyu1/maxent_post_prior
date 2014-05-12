;reads bin information for local bins
;used in maxent post processing


FUNCTION get_local_bins, loc_bin_dir, nclass, nzones, prefix

	prob_array = fltarr(nclass, nzones)

	loc_bin_npoints = ulonarr(nclass, nzones)
	loc_bin_total_points = ulonarr(nzones)
	for i=0, nzones-1 do begin
		cur_file = loc_bin_dir + '/' + prefix + strtrim(string(i),2) + '.csv'
		cur_bin_data = read_csv(cur_file)
		for j=0, nclass-1 do begin
			loc_bin_npoints[j,i] = ulong(cur_bin_data.(3)[j])
		endfor
		loc_bin_total_points[i] = total(loc_bin_npoints[*,i])
	endfor

	for i=0, nzones-1 do begin
		if (loc_bin_total_points[i] gt 0) then prob_array[*,i] = float(loc_bin_npoints[*,i]) / float(loc_bin_total_points[i])
	endfor

	print, loc_bin_total_points

	return, prob_array


END
