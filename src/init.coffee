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

	resizer = new Resizer window, { width: 320, height: 240 }, { horizontal: 10, vertical: 20 }
	resizer.addListener new CanvasResizeListener canvas
	resizer.addListener graphics
	resizer.resize()

	game = new Game
	renderer = new GameRenderer game, graphics
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
