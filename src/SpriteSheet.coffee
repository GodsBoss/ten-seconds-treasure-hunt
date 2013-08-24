class SpriteSheet
	###
		imageData is of type ImageData, created via canvas.getContext('2d').createImageData(...)
		It contains the image data.
	###
	constructor:(@context, @imageData, @spritesData)->
		@cache = {}

	get:(id, factor)->
		@cache[factor] ?= {}
		@cache[factor][id] ?= @createSprite id, factor

	createSprite:(id, factor)->
		spriteData = @spritesData.get id
		resultWidth = spriteData.width * factor
		resultHeight = spriteData.height * factor
		resultImageData = @context.getImageData 0, 0, resultWidth, resultHeight
		for sourceX in [spriteData.x..spriteData.x+spriteData.width-1]
			for sourceY in [spriteData.y..spriteData.y+spriteData.height-1]
				sourceBaseIndex = 4*(@imageData.width*sourceY + sourceX)
				targetXStart = (sourceX - spriteData.x)*factor
				targetYStart = (sourceY - spriteData.y)*factor
				for targetX in [targetXStart..targetXStart+factor-1]
					for targetY in [targetYStart..targetYStart+factor-1]
						targetBaseIndex = 4*(resultImageData.width*targetY + targetX)
						for colorIndex in [0..3]
							resultImageData.data[targetBaseIndex+colorIndex] = @imageData.data[sourceBaseIndex+colorIndex]
		resultImageData

	@createWithImage = (image, spriteData)->
		canvas = document.createElement 'canvas'
		canvas.width = image.width
		canvas.height = image.height
		context = canvas.getContext '2d'
		context.drawImage image, 0, 0
		new SpriteSheet context, context.getImageData(0, 0, canvas.width, canvas.height), spriteData
