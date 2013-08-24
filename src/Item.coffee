class Item
	constructor:(@type)->

	action:(game, tile, player)->
		tile.removeObject()
		player.addItem @type
