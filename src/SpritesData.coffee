class SpritesData
	get:(id)->
		SpritesData.sprites[id] or throw new Error 'Could not find sprite with id ' + id

	@sprites =
		title:
			x: 0
			y: 0
			width: 120
			height: 40
		water:
			x: 0
			y: 48
			width: 24
			height: 24
			frames: 4
			time: 1.0
