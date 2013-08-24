class Resizer
	constructor:(@window, @size, @margin = { horizontal: 0, vertical: 0 })->
		@listeners = []

	addListener:(listener)->
		if @listeners.length == 0
			@window.onresize = @resize
		@listeners.push listener
		@

	resize:()=>
		factor = @getFactor()
		@listeners.forEach (listener)->
			listener.resize factor
		@

	getFactor:()->
		hFactor = Math.max 1, Math.floor((@window.innerWidth - @margin.horizontal) / @size.width)
		vFactor = Math.max 1, Math.floor((@window.innerHeight - @margin.vertical) / @size.height)
		Math.min hFactor, vFactor
