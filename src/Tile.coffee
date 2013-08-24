class Tile
	constructor:(@type, @time)->

	tick:(time)->
		if @time?
			@time = (@time + time) % Tile.TIMES[@type]
		if @object? and @object.tick?
			@object.tick time

	hasObject:()->
		@object?

	getObject:()->
		@object

	setObject:(@object)->

	removeObject:()->
		delete @object

	setSubType:(@subType)->

	getSubType:()->
		@subType

	@TIMES =
		water: 1.0

	@create: (type)->
		if @TIMES[type]?
			new Tile type, @TIMES[type] * Math.random()
		else
			new Tile type
