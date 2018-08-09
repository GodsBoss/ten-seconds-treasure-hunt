class Item
	constructor:(@type, @time)->

	tick:(time)->
		if @time?
			@time = (@time + time) % 1.0

	action:(game, tile, player)->
		tile.removeObject()
		player.addItem @type
