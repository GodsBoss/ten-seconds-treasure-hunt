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
				@level.tick @interval

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
