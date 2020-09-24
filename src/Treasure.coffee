class Treasure
	constructor:(@hidden = no)->
		@type = if @hidden then 'cross' else 'treasure'
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
