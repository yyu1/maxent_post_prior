pro call_post_nam_cl70
	xdim = 48000ULL
	ydim = 33600ULL
	topx = -13343406.2352
	topy = 8895604.1568
	pix_width = 231.65635825

	grid_width = 50000. ;50km
	min_pdf_points = 500


	train_file = '/u/yyu1/global_250m/samples/hlorey_train_v2/nam/train_hlorey_nam_v2_cl70_wbin.csv'
	in_dir = '/nobackup/yyu1/global_250m_output/nam_nosrtm/cl_70'
	bin_file = '/u/yyu1/global_250m/samples/hlorey_train_v2/nam/bin_hlorey_nam_v2_cl70.csv'

	post_prior_shell, xdim, ydim, topx, topy, pix_width, grid_width, min_pdf_points, train_file, bin_file, in_dir

end
