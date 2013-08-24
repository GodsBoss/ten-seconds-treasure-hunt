class Game
	@STATE =
		START: 0
		TITLE: 1
		LEVELS: 2
		RUNNING: 3
		MESSAGE: 4

	constructor:(@interval, @levelReader, @interactionQueue)->
		@state = Game.STATE.START
		@factor = 1
		@finishedLevels = 3
		@time = 0

	tick:()=>
		@time += @interval
		switch @state
			when Game.STATE.START
				@init()
			when Game.STATE.TITLE
				@scrollLevel()
				@level.tick @interval
				if @justClicked()
					@state = Game.STATE.LEVELS
			when Game.STATE.LEVELS
				@highlightOrStartLevel()
			when Game.STATE.RUNNING
				@remainingTime -= @interval
				@level.tick @interval
				@handleUserInteraction()

	init:()->
		@state = Game.STATE.TITLE
		@scrollOffset =
			x: 0
			y: 0
		@level = @levelReader.read 'title', LevelReader.DO_NOT_VALIDATE

	scrollLevel:()->
		@scrollOffset.x++
		@scrollOffset.y++
		@scrollOffset.x %= @level.getWidth() * 24
		@scrollOffset.y %= @level.getHeight() * 24

	resize:(@factor)->

	justClicked:()->
		events = @interactionQueue.retrieveEvents()
		for event in events
			if event.type is 'mouse'
				if event.event.type is 'click'
					return yes
		no

	highlightOrStartLevel:()->
		events = @interactionQueue.retrieveEvents()
		for event in events
			if event.type is 'mouse'
				e = event.event
				x = (e.clientX - e.target.offsetLeft) / @factor
				y = (e.clientY - e.target.offsetTop) / @factor
				delete @highlightedLevel
				for levelIndex in [1..@finishedLevels]
					iconPosition = LevelScreen.iconPositions[levelIndex]
					if iconPosition? and x >= iconPosition.x and x <= iconPosition.x + 24 and y >= iconPosition.y and y <= iconPosition.y + 24
						if e.type is 'click'
							@initLevel levelIndex
							@state = Game.STATE.RUNNING
							return
						if e.type is 'mousemove'
							@highlightedLevel = levelIndex

	initLevel:(index)->
		@level = @levelReader.read index
		@remainingTime = 10

	handleUserInteraction:()->
		events = @interactionQueue.retrieveEvents()
		for event in events
			if event.type is 'mouse'
				e = event.event
				x = (e.clientX - e.target.offsetLeft) / @factor
				y = (e.clientY - e.target.offsetTop) / @factor
				delete @possibleStep
				player = @level.player
				playerCenter =
					x: player.x * 24 + 80 + 12
					y: player.y * 24 + 12
				if Math.abs(x - playerCenter.x) > Math.abs(y - playerCenter.y)
					if x > playerCenter.x and player.x < @level.getWidth()-1
						@possibleStep = 'right'
					else if x < playerCenter.x and player.x > 0
						@possibleStep = 'left'
				else
					if y > playerCenter.y and player.y < @level.getHeight()-1
						@possibleStep = 'down'
					else if y < playerCenter.y and player.y > 0
						@possibleStep = 'up'
				@checkPossibleStep()
				if @possibleStep and e.type is 'click'
					@level.player = @getPossiblePosition()
					@checkPossibleStep()

	checkPossibleStep:()->
		if @possibleStep
			nextPosition = @getPossiblePosition()
			tile = @level.get nextPosition.x, nextPosition.y
			if tile.type is 'cliff'
				delete @possibleStep
			if tile.type is 'sand' and tile.hasObject() and tile.getObject().type is 'tree'
				delete @possibleStep

	getPossiblePosition:()->
		nextX = @level.player.x
		nextY = @level.player.y
		if @possibleStep is 'up'
			nextY--
		if @possibleStep is 'down'
			nextY++
		if @possibleStep is 'left'
			nextX--
		if @possibleStep is 'right'
			nextX++
		x: nextX
		y: nextY
