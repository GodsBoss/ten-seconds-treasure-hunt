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
