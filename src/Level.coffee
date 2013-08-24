class Level
	constructor:(@size, @tiles)->

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

	@create = (size)->
		tiles = {}
		for x in [0..size.width-1]
			for y in [0..size.height-1]
				tiles[x + '-' + y] = Tile.create 'water'
		new Level size, tiles
