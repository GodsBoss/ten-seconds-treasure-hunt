class SpriteSheet
	###
		imageData is of type ImageData, created via canvas.getContext('2d').createImageData(...)
		It contains the image data.
	###
	constructor:(@context, @imageData, @spritesData)->
		@cache = {}

	get:(id, factor, animationTime)->
		@cache[factor] ?= {}
		@cache[factor][id] ?= {}
		@cache[factor][id].spriteData ?= @spritesData.get id
		@cache[factor][id].sprites ?= {}
		animationIndex = @getAnimationIndex @cache[factor][id].spriteData, animationTime
		@cache[factor][id].sprites['frame-' + animationIndex] ?= @createSprite id, factor, animationIndex

	getAnimationIndex:(spriteData, animationTime)->
		if animationTime?
			animationTime %= spriteData.time
			Math.floor(animationTime * spriteData.frames / spriteData.time)
		else
			0

	createSprite:(id, factor, animationIndex)->
		spriteData = @spritesData.get id
		resultWidth = spriteData.width * factor
		resultHeight = spriteData.height * factor
		resultImageData = @context.getImageData 0, 0, resultWidth, resultHeight
		spriteX = spriteData.x + animationIndex * spriteData.width
		spriteY = spriteData.y

		for sourceX in [spriteX..spriteX+spriteData.width-1]
			for sourceY in [spriteY..spriteY+spriteData.height-1]
				sourceBaseIndex = 4*(@imageData.width*sourceY + sourceX)
				targetXStart = (sourceX - spriteX)*factor
				targetYStart = (sourceY - spriteY)*factor
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
