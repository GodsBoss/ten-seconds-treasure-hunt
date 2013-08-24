class Resizer
	constructor:(@window, @width, @height)->
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
		hFactor = Math.max 1, Math.floor(@window.innerWidth / @width)
		vFactor = Math.max 1, Math.floor(@window.innerHeight / @height)
		Math.min hFactor, vFactor
