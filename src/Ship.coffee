class Ship
	type: 'ship'

	action:(game, tile, player)->
		tile.removeObject()
		player.enterShip()
