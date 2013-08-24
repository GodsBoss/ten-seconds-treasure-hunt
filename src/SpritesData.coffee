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
		sand:
			x: 0
			y: 72
			width: 24
			height: 24
		'cliff-1':
			x: 24
			y: 72
			width: 24
			height: 24
		'cliff-2':
			x: 48
			y: 72
			width: 24
			height: 24
		'cliff-3':
			x: 72
			y: 72
			width: 24
			height: 24
		'cliff-4':
			x: 96
			y: 72
			width: 24
			height: 24
		'cliff-5':
			x: 120
			y: 72
			width: 24
			height: 24
		'cliff-6':
			x: 144
			y: 72
			width: 24
			height: 24
		'cliff-7':
			x: 168
			y: 72
			width: 24
			height: 24
		'cliff-8':
			x: 192
			y: 72
			width: 24
			height: 24
		'cliff-9':
			x: 216
			y: 72
			width: 24
			height: 24
		'cliff-10':
			x: 240
			y: 72
			width: 24
			height: 24
		'cliff-11':
			x: 264
			y: 72
			width: 24
			height: 24
		'cliff-12':
			x: 288
			y: 72
			width: 24
			height: 24
		'cliff-13':
			x: 312
			y: 72
			width: 24
			height: 24
		'cliff-14':
			x: 336
			y: 72
			width: 24
			height: 24
		'reef':
			x: 0
			y: 96
			width: 24
			height: 24
		'rock':
			x: 24
			y: 96
			width: 24
			height: 24
		'beach-top':
			x: 48
			y: 96
			width: 24
			height: 24
		'beach-left':
			x: 72
			y: 96
			width: 24
			height: 24
		'beach-right':
			x: 96
			y: 96
			width: 24
			height: 24
		'beach-bottom':
			x: 120
			y: 96
			width: 24
			height: 24
