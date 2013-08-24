class InteractionQueue
	constructor:()->
		@events = []

	key:(e)=>
		@events.push
			type: 'key'
			event: e

	mouse:(e)=>
		@events.push
			type: 'mouse'
			event: e

	handleEvents:(handler)->
		handler @events
		@events = []
