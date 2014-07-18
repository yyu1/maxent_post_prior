
xdim = 57600ULL
ydim = 24000ULL
;test_ydim = 1000ULL  ;test for 1000 lines
topx = 6671703.1176
topy = 4447802.0784
pix_width = 231.65635825

grid_width = 100000. ;100km
min_pdf_points = 5000


train_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/train_hlorey_sea_v2_cl40_wbin.csv'
in_dir = '/Volumes/Global_250m/output/sea/cl40_nostdev'
out_dir = '/Volumes/Global_250m/output/sea/cl40_nostdev/results'
bin_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/bin_hlorey_sea_v2_cl40.csv'

;create local pdf
grid_nx = fix(xdim * pix_width / grid_width) + 1
grid_ny = fix(ydim * pix_width / grid_width) + 1
train_data = read_csv(train_file)
n_plots = n_elements(train_data.(0))

def_bin_data = read_csv(bin_file)
def_nbins = n_elements(def_bin_data.(0))
pdf_2d, train_data.(1), train_data.(2), train_data.(4), def_nbins, grid_width, topx, grid_nx, topy, grid_ny, pdf_out, min_pdf_points

maxent_post_vectorized_prior, xdim, ydim, in_dir, out_dir, bin_file, pdf_out

train_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/train_hlorey_sea_v2_misclass_wbin.csv'
in_dir = '/Volumes/Global_250m/output/sea/misclass_nostdev'
out_dir = '/Volumes/Global_250m/output/sea/misclass_nostdev/results'
bin_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/bin_hlorey_sea_v2_misclass.csv'

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
