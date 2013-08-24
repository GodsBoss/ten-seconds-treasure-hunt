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
