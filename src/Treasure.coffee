class Treasure
	type: 'treasure'

	constructor:(@hidden = no)->
		@type = if @hidden then 'cross' else 'treasure'

	hide:()->
		@hidden = yes
		@type = 'cross'

	action:(game, tile, player)->
		if not @hidden or player.hasItem 'map'
			tile.removeObject()
			game.winLevel()
