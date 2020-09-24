class Treasure
	constructor:()->
		@type = 'treasure'
		@hidden = no
		@time = 0

	tick:(time)->
		@time = (@time + time) % 1.0

	hide:()->
		@hidden = yes
		@type = 'cross'

	action:(game, tile, player)->
		if not @hidden or player.hasItem 'map'
			tile.removeObject()
			game.winLevel()
