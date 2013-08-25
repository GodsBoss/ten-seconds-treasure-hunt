INTERVAL = 40 / 1000 # Interval in seconds

init = (gfxImage)->
	canvas = document.getElementById 'gfx'
	context = canvas.getContext '2d'

	if !context
		document.body.removeChild canvas
		hint = document.createElement 'p'
		hint.innerHTML = 'You do not have a browser capable of HTML5. :-('
		hint.id = 'html5-hint'
		document.body.appendChild hint
		return

	spriteSheet = SpriteSheet.createWithImage gfxImage, new SpritesData
	graphics = new Graphics context, spriteSheet

	interactionQueue = new InteractionQueue
	canvas.onclick = interactionQueue.mouse
	canvas.onmousemove = interactionQueue.mouse

	game = new Game INTERVAL, new LevelReader(new LevelsData), interactionQueue
	textRenderer = new TextRenderer graphics, { width: 6, height: 6 }
	renderer = new GameRenderer game, graphics, textRenderer

	resizer = new Resizer window, { width: 320, height: 240 }, { horizontal: 10, vertical: 20 }
	resizer.addListener new CanvasResizeListener canvas
	resizer.addListener graphics
	resizer.addListener game
	resizer.resize()

	Loop.startInterval game.tick, INTERVAL * 1000
	Loop.startAnimationLoop renderer.render

window.onload = (e)->
	document.body.removeChild document.getElementById 'js-hint'

	gfxImage = new Image

	gfxImage.onload = ()->
		init gfxImage
		
	gfxImage.onerror = ()->
		document.body.removeChild document.getElementById 'gfx'
		hint = document.createElement 'p'
		hint.innerHTML = 'Graphics could not be loaded. :-('
		hint.id = 'gfx-hint'
		document.body.appendChild hint

	gfxImage.src = 'gfx.png'
