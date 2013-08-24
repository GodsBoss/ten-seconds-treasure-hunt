class Graphics
	constructor:(@context, @spriteSheet)->
		@factor = 1

	resize:(factor)->
		@factor = factor

	draw:(id, position, animationTime)->
		sprite = @spriteSheet.get id, @factor, animationTime
		realX = position.x * @factor
		realY = position.y * @factor
		@context.drawImage sprite, realX, realY
