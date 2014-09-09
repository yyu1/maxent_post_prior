pro sea_post_v3

xdim = 57600ULL
ydim = 24000ULL
topx = 6671703.1176
topy = 4447802.0784
pix_width = 231.65635825

grid_width = 100000. ;50km
min_pdf_points = 1000  ; for cl7090100


train_file = '~/global_250m/samples/hlorey_train_v3/sea/train_hlorey_sea_v3_cl7090100_wbin.csv'
in_dir = '/nobackup/yyu1/global_250m_output/sea/cl_7090100'
out_dir = '/nobackup/yyu1/global_250m_output/sea/cl_7090100/results'
bin_file = '~/global_250m/samples/hlorey_train_v3/sea/bin_hlorey_sea_v3_cl7090100.csv'

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

;print, !error_state.code
;if (!error_state.code eq -104 or !error_state.code eq 0) then begin
;        spawn, 'rm ' + in_dir + '/*.bil'
;        message, /reset
;endif

;-----------------------

train_file = '~/global_250m/samples/hlorey_train_v3/sea/train_hlorey_sea_v3_cl7090100_wbin.csv'
in_dir = '/nobackup/yyu1/global_250m_output/sea/cl_7090100_nomodis'
out_dir = '/nobackup/yyu1/global_250m_output/sea/cl_7090100_nomodis/results'
bin_file = '~/global_250m/samples/hlorey_train_v3/sea/bin_hlorey_sea_v3_cl7090100.csv'

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

;print, !error_state.code
;if (!error_state.code eq -104 or !error_state.code eq 0) then begin
;        spawn, 'rm ' + in_dir + '/*.bil'
;        message, /reset
;endif

;-----------------------------

grid_width = 50000. ;50km
min_pdf_points = 5000

train_file = '~/global_250m/samples/hlorey_train_v3/sea/train_hlorey_sea_v3_cl40_wbin.csv'
in_dir = '/nobackup/yyu1/global_250m_output/sea/cl_40'
out_dir = '/nobackup/yyu1/global_250m_output/sea/cl_40/results'
bin_file = '~/global_250m/samples/hlorey_train_v3/sea/bin_hlorey_sea_v3_cl40.csv'

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

;print, !error_state.code
;if (!error_state.code eq -104 or !error_state.code eq 0) then begin
;        spawn, 'rm ' + in_dir + '/*.bil'
;        message, /reset
;endif
;----------------------------------


train_file = '~/global_250m/samples/hlorey_train_v3/sea/train_hlorey_sea_v3_cl40_wbin.csv'
in_dir = '/nobackup/yyu1/global_250m_output/sea/cl_40_nomodis'
out_dir = '/nobackup/yyu1/global_250m_output/sea/cl_40_nomodis/results'
bin_file = '~/global_250m/samples/hlorey_train_v3/sea/bin_hlorey_sea_v3_cl40.csv'

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

;print, !error_state.code
;if (!error_state.code eq -104 or !error_state.code eq 0) then begin
;        spawn, 'rm ' + in_dir + '/*.bil'
;        message, /reset
;endif

;-----------------------------


train_file = '~/global_250m/samples/hlorey_train_v3/sea/train_hlorey_sea_v3_clmisclass_wbin.csv'
in_dir = '/nobackup/yyu1/global_250m_output/sea/cl_misclass'
out_dir = '/nobackup/yyu1/global_250m_output/sea/cl_misclass/results'
bin_file = '~/global_250m/samples/hlorey_train_v3/sea/bin_hlorey_sea_v3_clmisclass.csv'

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

;print, !error_state.code
;if (!error_state.code eq -104 or !error_state.code eq 0) then begin
;        spawn, 'rm ' + in_dir + '/*.bil'
;        message, /reset
;endif
;----------------------------------


train_file = '~/global_250m/samples/hlorey_train_v3/sea/train_hlorey_sea_v3_clmisclass_wbin.csv'
in_dir = '/nobackup/yyu1/global_250m_output/sea/cl_misclass_nomodis'
out_dir = '/nobackup/yyu1/global_250m_output/sea/cl_misclass_nomodis/results'
bin_file = '~/global_250m/samples/hlorey_train_v3/sea/bin_hlorey_sea_v3_clmisclass.csv'

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

;print, !error_state.code
;if (!error_state.code eq -104 or !error_state.code eq 0) then begin
;        spawn, 'rm ' + in_dir + '/*.bil'
;        message, /reset
;endif


end
