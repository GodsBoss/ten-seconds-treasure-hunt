class Game
	@states =
		overview: 1
		message: 2
		running: 3

	constructor:(@interval, @state = Game.states.overview)->
		@water = []

	tick:()=>
		if @water.length is 0
			@initWater()
		for x in [0..13]
			for y in [0..9]
				@water[x][y] += @interval

	initWater:()->
		for x in [0..13]
			line = []
			for y in [0..9]
				line.push Math.random()
			@water.push line
