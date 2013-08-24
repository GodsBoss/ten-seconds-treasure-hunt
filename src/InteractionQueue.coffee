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

	retrieveEvents:()->
		result = @events
		@events = []
		result
