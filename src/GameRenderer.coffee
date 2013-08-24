class GameRenderer
	constructor:(@game, @graphics)->

	render:()=>
		@graphics.fill
		switch @game.state
			when Game.STATE.TITLE
				@renderTitle()

	renderTitle:()->
		level = @game.level
		@renderTitleLevel level, @game.scrollOffset.x, @game.scrollOffset.y
		@graphics.draw 'title', { x: 100, y: 20 }

	renderTitleLevel:(level, offsetX, offsetY)->
		for x in [0..level.getWidth()-1]
			for y in [0..level.getHeight()-1]
				tile = level.get x, y
				drawX = x * 24 + offsetX
				drawY = y * 24 + offsetY
				if drawX > 320
					drawX -= level.getWidth()*24
				if drawY > 240
					drawY -= level.getHeight()*24
				position = { x: drawX, y: drawY }
				switch tile.type
					when 'water'
						@graphics.draw 'water', position, tile.time
					when 'sand'
						@graphics.draw 'sand', position
					when 'cliff'
						@graphics.draw 'cliff-' + tile.getSubType(), position
