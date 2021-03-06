
xdim = 38400ULL
ydim = 43200ULL
test_ydim = 1000ULL  ;test for 1000 lines
topx = -11119505.1960
topy = 3335851.5590
pix_width = 231.65635825

grid_width = 100000.
min_pdf_points = 10000


train_file = '~/global_250m/hmax_train/train_hmax_sam_v1_cl40_wbin.csv'

in_dir = '/nobackup/yyu1/global_250m_output/sam/hmax_cl_40'
out_dir = '/nobackup/yyu1/global_250m_output/sam/hmax_cl_40/speedtest'

spawn, 'mkdir ' + out_dir
spawn, 'find ' + in_dir + ' -name "*.gz" | parallel -j 10 gunzip {}'

bin_file = '~/global_250m/hmax_train/bin_hmax_sam_v1_cl40.csv'

;create local pdf
grid_nx = fix(xdim * pix_width / grid_width) + 1
grid_ny = fix(ydim * pix_width / grid_width) + 1
train_data = read_csv(train_file)
n_plots = n_elements(train_data.(0))

def_bin_data = read_csv(bin_file)
def_nbins = n_elements(def_bin_data.(0))
pdf_2d, train_data.(1), train_data.(2), train_data.(4), def_nbins, grid_width, topx, grid_nx, topy, grid_ny, pdf_out, min_pdf_points

print, 'Starting probability aggregation...', systime()
;maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out, min_pdf_points
profiler, /system & profiler
maxent_post_vectorized_prior, xdim, test_ydim, in_dir, out_dir, bin_file, pdf_out

print, !error_state.code

print, 'Done!', systime()

profiler, /report

end
