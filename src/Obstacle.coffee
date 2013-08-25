class Obstacle
	obstacle: yes

	constructor:(@type, @time)->

	tick:(time)->
		if @time?
			@time = (@time + time) % 1.0

	isDestructible:()->
		Obstacle.destructibles[@type]?

	isAccessible:()->
		Obstacle.accessibles[@type]?

	neededForDestruction:()->
		Obstacle.destructibles[@type]

	neededForAccess:()->
		Obstacle.accessibles[@type]

	action:(game, tile, player)->
		tile.removeObject()

	@destructibles =
		wall: 'explosives'
		natives: 'saber'
		kraken: 'scroll'
		pirates: 'cannon'

	@accessibles =
		reef: 'lead'
