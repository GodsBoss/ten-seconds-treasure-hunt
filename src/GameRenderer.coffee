class GameRenderer
	constructor:(@game, @graphics)->

	render:()=>
		@graphics.fill 
		for x in [0..13]
			for y in [0..9]
				@graphics.draw 'water', { x: x*24, y: y*24 }, @game.water[x][y]
		@graphics.draw 'title', { x: 100, y: 20 }
