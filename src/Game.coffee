class Game
	@STATE =
		START: 0
		TITLE: 1
		LEVELS: 2
		RUNNING: 3
		MESSAGE: 4
		FINISHED: 5

	constructor:(@interval, @levelReader, @interactionQueue)->
		@state = Game.STATE.START
		@factor = 1
		@finishedLevels = 10
		@time = 0
		@messageWaitTime = 0

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
				@loseIfTimeIsUp()
			when Game.STATE.MESSAGE
				@level.tick @interval
				@messageWaitTime = Math.max 0, @messageWaitTime - @interval
				if @justClicked() and @messageWaitTime is 0
					@nextMessage()
			when Game.STATE.FINISHED
				@scrollLevel()
				@level.tick @interval
				if @justClicked()
					@state = Game.STATE.LEVELS

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
				for levelIndex in [1..@finishedLevels+1]
					iconPosition = LevelScreen.iconPositions[levelIndex]
					if iconPosition? and x >= iconPosition.x and x <= iconPosition.x + 24 and y >= iconPosition.y and y <= iconPosition.y + 24
						if e.type is 'click'
							@state = Game.STATE.RUNNING
							@initLevel levelIndex
							return
						if e.type is 'mousemove'
							@highlightedLevel = levelIndex
							@levelTitle = @levelReader.getTitle levelIndex

	initLevel:(index)->
		@currentLevelIndex = index
		@level = @levelReader.read index
		@player = new Player @level.playerStart.x, @level.playerStart.y
		if @level.get(@player.x, @player.y).type isnt 'sand'
			@player.enterShip()
		@remainingTime = 10
		if @level.messages.before.length > 0
			@messageType = 'before'
			@messageIndex = 0
			@message = @level.messages.before[0]
			@state = Game.STATE.MESSAGE

	handleUserInteraction:()->
		events = @interactionQueue.retrieveEvents()
		for event in events
			if event.type is 'key'
				e = event.event
				move = no
				if e.charCode is 0
					switch e.keyCode
						when 37
							@possibleStep = 'left'
							move = yes
						when 38
							@possibleStep = 'up'
							move = yes
						when 39
							@possibleStep = 'right'
							move = yes
						when 40
							@possibleStep = 'down'
							move = yes
					if move
						@checkPossibleStep()
						if @possibleStep
							@movePlayer()
			if event.type is 'mouse'
				e = event.event
				x = (e.clientX - e.target.offsetLeft) / @factor
				y = (e.clientY - e.target.offsetTop) / @factor
				delete @possibleStep
				playerCenter =
					x: @player.x * 24 + 80 + 12
					y: @player.y * 24 + 12
				if Math.abs(x - playerCenter.x) > Math.abs(y - playerCenter.y)
					if x > playerCenter.x
						@possibleStep = 'right'
					else if x < playerCenter.x
						@possibleStep = 'left'
				else
					if y > playerCenter.y
						@possibleStep = 'down'
					else if y < playerCenter.y
						@possibleStep = 'up'
				@checkPossibleStep()
				if @possibleStep and e.type is 'click'
					@movePlayer()

	movePlayer:()->
		nextPosition = @getPossiblePosition()
		playerTile = @level.get(@player.x, @player.y)
		nextTile = @level.get(nextPosition.x, nextPosition.y)
		if playerTile.type is 'beach' and nextTile.type is 'sand'
			playerTile.setObject new Ship()
			@player.type = 'foot'
		else if @player.type is 'foot' and nextTile.type is 'beach'
			if not nextTile.hasObject() or nextTile.getObject().type isnt 'ship'
				return
		@player.moveTo nextPosition
		@checkPossibleStep()
		@invokeObjectAction()

	checkPossibleStep:()->
		if @possibleStep
			nextPosition = @getPossiblePosition()
			if nextPosition.x is -1 or nextPosition.y is -1 or nextPosition.x is @level.getWidth() or nextPosition.y is @level.getHeight()
				delete @possibleStep
				return
			tile = @level.get nextPosition.x, nextPosition.y
			if tile.type is 'cliff'
				delete @possibleStep
			if tile.hasObject()
				object = tile.getObject()
				if object.obstacle and not @player.canDestroy(object) and not @player.canAccess(object)
					delete @possibleStep

	getPossiblePosition:()->
		nextX = @player.x
		nextY = @player.y
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

	invokeObjectAction:()->
		tile = @level.get @player.x, @player.y
		if tile.hasObject() and tile.getObject().action?
			tile.getObject().action @, tile, @player

	winLevel:()->
		@finishedLevels = Math.max @finishedLevels, @currentLevelIndex
		if @level.messages.after.length > 0
			@state = Game.STATE.MESSAGE
			@messageType = 'after'
			@messageIndex = 0
			@message = @level.messages.after[0]
			@messageWaitTime = 0.25
		else
			if @level.final
				@finishedGame()
			else
				@state = Game.STATE.LEVELS

	loseLevel:()->
		@messageType = 'lose'
		@message =
			icon: 'big-clock'
			message: 'Your time ran out! Be faster next time!'
		@state = Game.STATE.MESSAGE
		@messageWaitTime = 0.25

	loseIfTimeIsUp:()->
		if @remainingTime < 0
			@remainingTime = 0
			@loseLevel()

	nextMessage:()->
		if @messageType is 'lose'
			@state = Game.STATE.LEVELS
		if @messageType is 'before'
			if @messageIndex >= @level.messages.before.length - 1
				@state = Game.STATE.RUNNING
			else
				@messageIndex++
				@message = @level.messages.before[@messageIndex]
		if @messageType is 'after'
			if @messageIndex >= @level.messages.after.length - 1
				if @level.final
					@finishedGame()
				else
					@state = Game.STATE.LEVELS
			else
				@messageIndex++
				@message = @level.messages.after[@messageIndex]

	isLastMessage:()->
		if @messageType is 'before' or @messageType is 'after'
			@level.messages[@messageType].length - 1 == @messageIndex
		else
			no

	movePlayerTo:(position)->
		@player.moveTo position
		if @level.get(position.x, position.y).type == 'sand'
			@player.leaveShip()
		else
			@player.enterShip()
		@checkPossibleStep()

	finishedGame:()->
		@init()
		@state = Game.STATE.FINISHED
