class CanvasResizeListener
	constructor:(@canvas)->
		@canvasWidth = @canvas.width
		@canvasHeight = @canvas.height

	resize:(factor)=>
		@canvas.width = @canvasWidth * factor
		@canvas.height = @canvasHeight * factor
