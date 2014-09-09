;Takes config values as input arguments and does post processing on regular and nomodis dirs

pro post_prior_shell, xdim, ydim, topx, topy, pix_width, grid_width, min_pdf_points, train_file, bin_file, in_dir

	out_dir = in_dir + '/results'

	spawn, 'mkdir ' + out_dir
	spawn, 'find ' + in_dir + ' -name "*.gz" | parallel -j 10 gunzip {}'

	;create local pdf
	grid_nx = fix(xdim * pix_width / grid_width) + 1
	grid_ny = fix(ydim * pix_width / grid_width) + 1
	train_data = read_csv(train_file)
	n_plots = n_elements(train_data.(0))
	
	def_bin_data = read_csv(bin_file)
	def_nbins = n_elements(def_bin_data.(0))
	pdf_2d, train_data.(1), train_data.(2), train_data.(4), def_nbins, grid_width, topx, grid_nx, topy, grid_ny, pdf_out, min_pdf_points
	
	maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out

	;-----------------NO MODIS-----------------
	
	in_dir = in_dir + '_nomodis'
	out_dir = in_dir + '/results'
	
	spawn, 'mkdir ' + out_dir
	spawn, 'find ' + in_dir + ' -name "*.gz" | parallel -j 10 gunzip {}'
	
	maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out
	
	;-----------------------------

end
