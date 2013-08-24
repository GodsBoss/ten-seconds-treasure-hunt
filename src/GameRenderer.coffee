class GameRenderer
	constructor:(@game, @graphics)->

	render:()=>
		@graphics.fill 
		@graphics.draw 'title', { x: 100, y: 20 }
