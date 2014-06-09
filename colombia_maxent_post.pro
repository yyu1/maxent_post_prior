
xdim = 10625ULL
ydim = 22500ULL
topx = -79.999555555555555
topy = 9.99955555555555555
pix_width = 0.0004444444444444444

grid_width = 0.1
min_pdf_points = 100000


train_file = '/Volumes/Global_250m/colombia/maxent_50m_runs/samples/colombia_50m_maxent_agb_train_wbin.csv'

in_dir = '/Volumes/Global_250m/colombia/maxent_50m_runs/output1'
out_dir = '/Volumes/Global_250m/colombia/maxent_50m_runs/output1/results'

bin_file = '/Volumes/Global_250m/colombia/maxent_50m_runs/samples/colombia_50m_maxent_agb_bin.csv'

;create local pdf
grid_nx = fix(xdim * pix_width / grid_width) + 1
grid_ny = fix(ydim * pix_width / grid_width) + 1
train_data = read_csv(train_file)
n_plots = n_elements(train_data.(0))

def_bin_data = read_csv(bin_file)
def_nbins = n_elements(def_bin_data.(0))
pdf_2d, train_data.(1), train_data.(2), train_data.(4), def_nbins, grid_width, topx, grid_nx, topy, grid_ny, pdf_out, min_pdf_points

print, 'Starting probability aggregation...', systime()
maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out

print, !error_state.code

print, 'Done!', systime()

end
