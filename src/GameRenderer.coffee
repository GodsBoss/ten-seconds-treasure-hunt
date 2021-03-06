class GameRenderer
	constructor:(@game, @graphics, @textRenderer)->

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
			when Game.STATE.FINISHED
				@renderFinishedGame()

	renderTitle:()->
		@renderScrollingLevel @game.level, @game.scrollOffset.x, @game.scrollOffset.y
		@graphics.draw 'title', { x: 100, y: 20 }

	renderFinishedGame:()->
		@renderScrollingLevel @game.level, @game.scrollOffset.x, @game.scrollOffset.y
		@graphics.draw 'finished', { x: 100, y: 20 }

	renderScrollingLevel:(level, offsetX, offsetY)->
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
			@textRenderer.render @game.levelTitle, { x: 4, y: 231 }, 999999

	renderRunningGame:()->
		@graphics.draw 'sidebar', {x: 0, y: 0}
		level = @game.level
		for x in [0..level.getWidth()-1]
			for y in [0..level.getHeight()-1]
				tile = level.get x, y
				position = { x: x * 24 + 80, y: y * 24 }
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
		player = @game.player
		@graphics.draw 'player-by-' + player.type, {x: player.x * 24 + 80, y: player.y * 24 }, @game.time
		@renderPlayerInventory()
		if @game.possibleStep and @game.state is Game.STATE.RUNNING
			stepX = player.x * 24 + 80
			stepY = player.y * 24
			switch @game.possibleStep
				when 'left'
					stepX -= 24
				when 'right'
					stepX += 24
				when 'up'
					stepY -= 24
				when 'down'
					stepY += 24
			@graphics.draw 'arrow-' + @game.possibleStep, {x: stepX, y: stepY }
		for i in [1..Math.min 10, Math.ceil @game.remainingTime]
			@graphics.draw 'clock', {x: (i-1)*8, y: 1}

	renderPlayerInventory:()->
		itemX = 0
		itemY = 0
		for item of @game.player.inventory
			drawX = if itemX is 0 then 10 else 46
			drawY = 10 + itemY * 36
			@graphics.draw item, {x: drawX, y: drawY }
			itemX++
			if itemX > 1
				itemX = 0
				itemY++

	renderMessage:()->
		@renderRunningGame()
		message = @game.message
		@graphics.draw 'message-box', { x: 119, y: 35 }
		@textRenderer.render @game.message.message, { x: 152, y: 40 }, 128
		icon = message.icon ? 'skull'
		@graphics.draw icon, { x: 124, y: 40 }
		if @game.isLastMessage()
			@graphics.draw 'message-okay', { x: 266, y: 70 }
