
xdim = 67200ULL
ydim = 24000ULL
;test_ydim = 1000ULL  ;test for 1000 lines
topx = -2223901.0392
topy = 10007554.6764
pix_width = 231.65635825

grid_width = 100000. ;100km
min_pdf_points = 10000


;train_file = '~/global_250m/hlorey_train/train_hlorey_eur_v1_cl100_wbin.csv'
;in_dir = '/nobackup/yyu1/global_250m_output/eur/cl_100'
;out_dir = '/nobackup/yyu1/global_250m_output/eur/cl_100/results'
;bin_file = '~/global_250m/hlorey_train/bin_hlorey_eur_v1_cl100.csv'
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
;
;print, !error_state.code
;if (!error_state.code eq -104 or !error_state.code eq 0) then begin
;        spawn, 'rm ' + in_dir + '/*.bil'
;        message, /reset
;endif
;
;;-----------------------
;
;train_file = '~/global_250m/hlorey_train/train_hlorey_eur_v1_cl100_wbin.csv'
;in_dir = '/nobackup/yyu1/global_250m_output/eur/cl_100_nomodis'
;out_dir = '/nobackup/yyu1/global_250m_output/eur/cl_100_nomodis/results'
;bin_file = '~/global_250m/hlorey_train/bin_hlorey_eur_v1_cl100.csv'
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
;;maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out, min_pdf_points
;maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out
;
;print, !error_state.code
;if (!error_state.code eq -104 or !error_state.code eq 0) then begin
;        spawn, 'rm ' + in_dir + '/*.bil'
;        message, /reset
;endif
;
;;-----------------------------
;
;
;train_file = '~/global_250m/hlorey_train/train_hlorey_eur_v1_cl5060_wbin.csv'
;in_dir = '/nobackup/yyu1/global_250m_output/eur/cl_50_60'
;out_dir = '/nobackup/yyu1/global_250m_output/eur/cl_50_60/results'
;bin_file = '~/global_250m/hlorey_train/bin_hlorey_eur_v1_cl5060.csv'
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
;;maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out, min_pdf_points
;maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out
;
;print, !error_state.code
;if (!error_state.code eq -104 or !error_state.code eq 0) then begin
;        spawn, 'rm ' + in_dir + '/*.bil'
;        message, /reset
;endif
;----------------------------------


;train_file = '~/global_250m/hlorey_train/train_hlorey_eur_v1_cl5060_wbin.csv'
;in_dir = '/nobackup/yyu1/global_250m_output/eur/cl_50_60_nomodis'
;out_dir = '/nobackup/yyu1/global_250m_output/eur/cl_50_60_nomodis/results'
;bin_file = '~/global_250m/hlorey_train/bin_hlorey_eur_v1_cl5060.csv'
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
;;maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out, min_pdf_points
;maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out
;
;print, !error_state.code
;if (!error_state.code eq -104 or !error_state.code eq 0) then begin
;        spawn, 'rm ' + in_dir + '/*.bil'
;        message, /reset
;endif



;-----------------------------


train_file = '~/global_250m/hlorey_train/train_hlorey_eur_v1_cl90_wbin.csv'
in_dir = '/nobackup/yyu1/global_250m_output/eur/cl_90'
out_dir = '/nobackup/yyu1/global_250m_output/eur/cl_90/results'
bin_file = '~/global_250m/hlorey_train/bin_hlorey_eur_v1_cl90.csv'

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


train_file = '~/global_250m/hlorey_train/train_hlorey_eur_v1_cl90_wbin.csv'
in_dir = '/nobackup/yyu1/global_250m_output/eur/cl_90_nomodis'
out_dir = '/nobackup/yyu1/global_250m_output/eur/cl_90_nomodis/results'
bin_file = '~/global_250m/hlorey_train/bin_hlorey_eur_v1_cl90.csv'

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
