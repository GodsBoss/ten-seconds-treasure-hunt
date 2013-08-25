class Whirlpool
	type: 'whirlpool'

	constructor:(@time)->

	tick:(time)->
		@time = (@time + time) % 1.0

	action:(game, tile, player)->
		if player.hasItem('sextant')
			game.movePlayerTo game.level.getOtherWhirlpoolPosition player
