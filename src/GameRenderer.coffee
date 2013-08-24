class GameRenderer
	constructor:(@game, @graphics)->

	render:()=>
		@graphics.fill
		switch @game.state
			when Game.STATE.TITLE
				@renderTitle()
			when Game.STATE.LEVELS
				@renderLevels()
			when Game.STATE.RUNNING
				@renderRunningGame()
			when Game.STATE.MESSAGE
				@renderMessage()

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
				if tile.time?
					@graphics.draw tile.getId(), position, tile.time
				else
					@graphics.draw tile.getId(), position
				if tile.hasObject()
					object = tile.getObject()
					if object.time?
						@graphics.draw object.type, position, object.time
					else
						@graphics.draw object.type, position

	renderLevels:()->
		@graphics.draw 'level-screen', {x:0, y:0}
		if @game.highlightedLevel?
			@graphics.draw 'level-choose-border', LevelScreen.iconPositions[@game.highlightedLevel], @game.time

	renderRunningGame:()->

	renderMessage:()->
