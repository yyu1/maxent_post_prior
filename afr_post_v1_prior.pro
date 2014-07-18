
xdim = 43200ULL
ydim = 38400ULL
;test_ydim = 1000ULL  ;test for 1000 lines
topx = -3335851.5588
topy = 4447802.0784
pix_width = 231.65635825

grid_width = 100000. ;100km
min_pdf_points = 10000


train_file = '~/global_250m/hlorey_train/train_hlorey_afr_v1_cl407090100_wbin.csv'
in_dir = '/nobackup/yyu1/global_250m_output/afr/cl_40_70_90_100'
out_dir = '/nobackup/yyu1/global_250m_output/afr/cl_40_70_90_100/results'
bin_file = '~/global_250m/hlorey_train/bin_hlorey_afr_v1_cl407090100.csv'

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

;maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out
maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out

print, !error_state.code

if (!error_state.code eq -104 or !error_state.code eq 0) then begin
	spawn, 'rm ' + in_dir + '/*.bil'
	message, /reset
endif
	


;-----------------------

in_dir = '/nobackup/yyu1/global_250m_output/afr/cl_40_70_90_100_nomodis'
out_dir = '/nobackup/yyu1/global_250m_output/afr/cl_40_70_90_100_nomodis/results'

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

;maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out, min_pdf_points
maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out

print, !error_state.code
if (!error_state.code eq -104 or !error_state.code eq 0) then begin
	spawn, 'rm ' + in_dir + '/*.bil'
	message, /reset
endif


;-----------------------------


train_file = '~/global_250m/hlorey_train/train_hlorey_afr_v1_misclass_wbin.csv'
in_dir = '/nobackup/yyu1/global_250m_output/afr/cl_miss'
out_dir = '/nobackup/yyu1/global_250m_output/afr/cl_miss/results'
bin_file = '~/global_250m/hlorey_train/bin_hlorey_afr_v1_misclass.csv'

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

;maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out, min_pdf_points
maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out

print, !error_state.code
if (!error_state.code eq -104 or !error_state.code eq 0) then begin
	spawn, 'rm ' + in_dir + '/*.bil'
	message, /reset
endif

;----------------------------------


in_dir = '/nobackup/yyu1/global_250m_output/afr/cl_miss_nomodis'
out_dir = '/nobackup/yyu1/global_250m_output/afr/cl_miss_nomodis/results'

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

;maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out, min_pdf_points
maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out

print, !error_state.code
if (!error_state.code eq -104 or !error_state.code eq 0) then begin
	spawn, 'rm ' + in_dir + '/*.bil'
	message, /reset
endif



end
