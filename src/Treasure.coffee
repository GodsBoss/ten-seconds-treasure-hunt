class Treasure
	type: 'treasure'

	action:(game, tile, player)->
		tile.removeObject()
		game.winLevel()
