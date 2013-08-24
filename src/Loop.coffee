class Loop
	constructor:(@repeatCallback, @action)->
		@running = no

	start:()->
		if !@running
			@running = yes
			@step()
		@

	step:()=>
		if @running
			@repeatCallback @step
			@action()

	stop:()->
		@running = no
		@

	@createInterval = (action, time)->
		new Loop ((callback)->window.setTimeout callback, time), action

	@createAnimationLoop = (action)->
		new Loop ((callback)->window.requestAnimationFrame callback), action

	@startInterval = (action, time)->
		Loop.createInterval(action, time).start()

	@startAnimationLoop = (action)->
		Loop.createAnimationLoop(action).start()
