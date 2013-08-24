class Resizer
	constructor:(@window, @size)->
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
		hFactor = Math.max 1, Math.floor(@window.innerWidth / @size.width)
		vFactor = Math.max 1, Math.floor(@window.innerHeight / @size.height)
		Math.min hFactor, vFactor
