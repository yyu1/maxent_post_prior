pro afr_post_v3

xdim = 43200ULL
ydim = 38400ULL
topx = -3335851.5588
topy = 4447802.0784
pix_width = 231.65635825

grid_width = 50000. ;100km
min_pdf_points = 5000


;train_file = '~/global_250m/samples/hlorey_train_v3/afr/train_hlorey_afr_v3_cl407090100160_wbin.csv'
;in_dir = '/nobackup/yyu1/global_250m_output/afr/cl_407090100160'
;out_dir = '/nobackup/yyu1/global_250m_output/afr/cl_407090100160/results'
;bin_file = '~/global_250m/samples/hlorey_train_v3/afr/bin_hlorey_afr_v3_cl407090100160.csv'
;
;spawn, 'mkdir ' + out_dir
;spawn, 'find ' + in_dir + ' -name "*.gz" | parallel -j 10 gunzip {}'
;
;;create local pdf
;grid_nx = fix(xdim * pix_width / grid_width) + 1
;grid_ny = fix(ydim * pix_width / grid_width) + 1
;train_data = read_csv(train_file)
;n_plots = n_elements(train_data.(0))
;
;def_bin_data = read_csv(bin_file)
;def_nbins = n_elements(def_bin_data.(0))
;pdf_2d, train_data.(1), train_data.(2), train_data.(4), def_nbins, grid_width, topx, grid_nx, topy, grid_ny, pdf_out, min_pdf_points
;
;;maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out
;maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out



;-----------------------

;in_dir = '/nobackup/yyu1/global_250m_output/afr/cl_407090100160_nomodis'
;out_dir = '/nobackup/yyu1/global_250m_output/afr/cl_407090100160_nomodis/results'
;
;spawn, 'mkdir ' + out_dir
;spawn, 'find ' + in_dir + ' -name "*.gz" | parallel -j 10 gunzip {}'
;
;;create local pdf
;grid_nx = fix(xdim * pix_width / grid_width) + 1
;grid_ny = fix(ydim * pix_width / grid_width) + 1
;train_data = read_csv(train_file)
;n_plots = n_elements(train_data.(0))
;
;def_bin_data = read_csv(bin_file)
;def_nbins = n_elements(def_bin_data.(0))
;pdf_2d, train_data.(1), train_data.(2), train_data.(4), def_nbins, grid_width, topx, grid_nx, topy, grid_ny, pdf_out, min_pdf_points
;
;maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out
;


;-----------------------------


train_file = '~/global_250m/samples/hlorey_train_v3/afr/train_hlorey_afr_v3_clmisclass_wbin.csv'
in_dir = '/nobackup/yyu1/global_250m_output/afr/cl_misclass'
out_dir = '/nobackup/yyu1/global_250m_output/afr/cl_misclass/results'
bin_file = '~/global_250m/samples/hlorey_train_v3/afr/bin_hlorey_afr_v3_misclass.csv'

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


;----------------------------------


in_dir = '/nobackup/yyu1/global_250m_output/afr/cl_misclass_nomodis'
out_dir = '/nobackup/yyu1/global_250m_output/afr/cl_misclass_nomodis/results'

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



end
