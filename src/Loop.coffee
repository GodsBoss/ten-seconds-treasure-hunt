class Loop
	constructor:(@repeatCallback, @action)->
		@running = no

	start:()->
		if !@running
			@running = yes
			@step()

	step:()=>
		if @running
			@action()
			@repeatCallback @step

	stop:()->
		@running = no

	@createInterval = (action, time)->
		new Loop ((callback)->window.setTimeout callback, time), action

	@createAnimationLoop = (action)->
		new Loop ((callback)->window.requestAnimationFrame callback), action
