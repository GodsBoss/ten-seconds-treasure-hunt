class Graphics
	constructor:(@context, @spriteSheet)->
		@factor = 1

	resize:(factor)->
		@factor = factor

	draw:(id, position)->
		sprite = @spriteSheet.get id, @factor
		realX = position.x * @factor
		realY = position.y * @factor
		@context.putImageData sprite, realX, realY
