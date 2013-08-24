window.onload = (e)->
	document.body.removeChild document.getElementById 'js-hint'

	canvas = document.getElementById 'gfx'
	context = canvas.getContext '2d'

	if !context
		document.body.removeChild canvas
		hint = document.createElement 'p'
		hint.innerHTML = 'You do not have a browser capable of HTML5. :-('
		hint.id = 'html5-hint'
		document.body.appendChild hint
		return

	resizer = new Resizer window, { width: 320, height: 240 }, { horizontal: 10, vertical: 20 }
	resizer.addListener new CanvasResizeListener canvas
	resizer.resize()