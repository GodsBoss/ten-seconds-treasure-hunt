class TextRenderer
	constructor:(@graphics, @fontSize)->

	render:(text, position, widthInPixels)->
		if text is ''
			return
		maxChars = Math.floor widthInPixels / @fontSize.width
		lines = []
		words = text.split ' '
		line = words.shift()
		while words.length > 0
			word = words.shift()
			if line.length + word.length + 1 <= maxChars
				line += ' ' + word
			else
				lines.push line
				line = word
		if line.length > 0
			lines.push line
		for line, row in lines
			for char, charPos in line.split ''
				if char isnt ' '
					@graphics.draw 'letter-'+char, { x: position.x + charPos * @fontSize.width, y: position.y + row * @fontSize.height }
