(let* ((image (car (gimp-file-load RUN-NONINTERACTIVE "./gfx.xcf" "gfx.xcf")))
	(grid (car (gimp-image-get-layer-by-name image "Grid"))))
	(gimp-image-remove-layer image grid)
	(file-png-save RUN-NONINTERACTIVE image (car (gimp-image-merge-visible-layers image EXPAND-AS-NECESSARY)) "./gfx.png" "gfx.png" 0 9 0 0 0 0 0)
	(gimp-quit 0))