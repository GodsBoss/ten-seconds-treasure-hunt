class Level
	constructor:(@size, @tiles)->
		@whirlpools = {}

	get:(x, y)->
		@tiles[x + '-' + y]

	set:(x, y, tile)->
		@tiles[x + '-' + y] = tile

	getWidth:()->
		@size.width

	getHeight:()->
		@size.height

	tick:(time)->
		for x in [0..@size.width-1]
			for y in [0..@size.height-1]
				@tiles[x + '-' + y].tick time

	getPlayerTile:()->
		@tiles[@player.x + '-' + @player.y]

	setWhirlpool:(position)->
		@whirlpools[position.x+'-'+position.y] = position

	getOtherWhirlpoolPosition:(position)->
		id = position.x + '-' + position.y
		for otherId, otherPosition of @whirlpools
			if id isnt otherId
				return otherPosition

	@create = (size)->
		tiles = {}
		for x in [0..size.width-1]
			for y in [0..size.height-1]
				tiles[x + '-' + y] = Tile.create 'water'
		new Level size, tiles
