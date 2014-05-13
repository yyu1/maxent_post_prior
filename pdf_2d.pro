;This program calculates a local probability density based on location of points
;on a 2D grid and their associated z categories.
;points are placed into square grids of width specified by the "width" parameter
;the probability density for each grid box is determined by the points located within
;a 3x3 grid spacing centered around that grid box

;Author - Yifan Yu
;Version 1.0

;Parameters -
;
;		input parameters
;		xcoord - vector of x coordinates
;		ycoord - vector of y coordinates
;		category - vector of category each point belongs to
;		n_cats - total number of categories, so elements of category vector should go from 0 to n_cats-1
;		width - width of boxes to use
;		xmin - min x coordinate of grid to calculate pdf
;		nx - number of grid points in the x direction
;		ymax - min y coordinate of grid to calculate pdf
;		ny - number of grid points in the y direction
;		min_points - minimum number of points needed, or expand box

;		output parameters
;		pdf - (n_cats by nx by ny array of unsigned long of number of points in each category)
;					dimenions are n_cat by nx by ny so that retrieval from memory of pdf for a given x,y is fast
;		


Pro pdf_2d, xcoord, ycoord, category, n_cats, width, xmin, nx, ymax, ny, pdf_out, min_points

	tmp_pdf_count = lonarr(n_cats, nx, ny)
	pdf_out = ulonarr(n_cats, nx, ny)

	;calculate pdf grid
	for i=0, n_cats-1 do begin
		index = where(category eq i, count)

		if (count gt 0) then begin
			;transform coordinates
			xcoord_sc = ulong((xcoord[index] - xmin)/width)
			ycoord_sc = ulong((ymax - ycoord[index])/width)

			coord_transformed = xcoord_sc + nx*ycoord_sc

			tmp_pdf_count[i,*,*] = histogram(coord_transformed, min=0, max=(nx*ny)-1)
			
		endif
	endfor

	;calculate probability densities based on surrounding gridboxes

	for j=0L, ny-1 do begin
	print, j
	for i=0L, nx-1 do begin
		
		calc_pdf = 1

		min_i = i > 0
		max_i = (nx-1) < (i+1)
		min_j = j > 0
		max_j = (ny-1) < (j+1)

		while(calc_pdf) do begin
			for jj=min_j, max_j do begin
			for ii=min_i, max_i do begin
				pdf_out[*,i,j] += tmp_pdf_count[*,ii,jj]
			endfor
			endfor

			total_points = total(pdf_out[*,i,j])
			if (total_points ge min_points) then begin
				calc_pdf = 0 ;enough points, currently location pdf complete
			endif else begin
				;too few points, expand box by 1 in each direction
				min_i = (min_i-1) > 0
				max_i = (nx-1) < (max_i+1)
				min_j = (min_j-1) > 0
				max_j = (ny-1) < (max_j+1)
				pdf_out[*,i,j] = 0UL
			endelse
		endwhile

	endfor
	endfor

End

