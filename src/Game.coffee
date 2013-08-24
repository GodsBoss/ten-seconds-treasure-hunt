class Game
	@STATE =
		START: 0
		TITLE: 1
		LEVELS: 2
		RUNNING: 3
		MESSAGE: 4

	constructor:(@interval, @levelReader)->
		@state = Game.STATE.START

	tick:()=>
		switch @state
			when Game.STATE.START
				@init()
			when Game.STATE.TITLE
				@scrollLevel()
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
