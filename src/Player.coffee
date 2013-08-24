class Player
	@BY_FOOT = 'foot'
	@BY_SHIP = 'ship'

	constructor:(@x, @y, @type = Player.BY_FOOT)->
		@inventory = {}

	addItem:(type)->
		@inventory[type] = true

	hasItem:(type)->
		@inventory[type]?

	enterShip:()->
		@type = Player.BY_SHIP

	leaveShip:()->
		@type = Player.BY_FOOT

	moveTo:(position)->
		@x = position.x
		@y = position.y
