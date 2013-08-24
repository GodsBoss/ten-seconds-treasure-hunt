class Obstacle
	obstacle: yes

	constructor:(@type)->

	isDestructible:()->
		Obstacle.destructibles[@type]?

	isAccessible:()->
		Obstacle.accessibles[@type]?

	neededForDestruction:()->
		Obstacle.destructibles[@type]

	neededForAccess:()->
		Obstacle.accessibles[@type]

	@destructibles =
		wall: 'explosives'
		natives: 'saber'
		kraken: 'scroll'
		pirates: 'cannon'

	@accessibles =
		reef: 'lead'
