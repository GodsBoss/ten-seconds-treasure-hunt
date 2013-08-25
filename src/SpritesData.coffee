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
		'level-choose-border':
			x: 120
			y: 0
			width:26
			height:26
			frames: 4
			time: 0.5
		'level-screen':
			x: 320
			y: 240
			width: 320
			height: 240
		treasure:
			x: 0
			y: 120
			width: 24
			height: 24
		cannon:
			x: 24
			y: 120
			width: 24
			height: 24
		map:
			x: 48
			y: 120
			width: 24
			height: 24
		saber:
			x: 72
			y: 120
			width: 24
			height: 24
		scroll:
			x: 96
			y: 120
			width: 24
			height: 24
		explosives:
			x: 120
			y: 120
			width: 24
			height: 24
		lead:
			x: 144
			y: 120
			width: 24
			height: 24
		sextant:
			x: 168
			y: 120
			width: 24
			height: 24
		'player-by-foot':
			x: 0
			y: 144
			width: 24
			height: 24
			frames: 4
			time:1.0
		'player-by-ship':
			x: 96
			y: 144
			width: 24
			height: 24
			frames: 4
			time: 1.0
		ship:
			x: 96
			y: 144
			width: 24
			height: 24
			frames: 4
			time: 1.0
		tree:
			x: 144
			y: 96
			width: 24
			height: 24
		'arrow-up':
			x: 0
			y: 168
			width: 24
			height: 24
		'arrow-right':
			x: 24
			y: 168
			width: 24
			height: 24
		'arrow-down':
			x: 48
			y: 168
			width: 24
			height: 24
		'arrow-left':
			x: 72
			y: 168
			width: 24
			height: 24
		whirlpool:
			x: 192
			y: 144
			width: 24
			height: 24
			frames: 4
			time: 0.5
		sidebar:
			x: 560
			y: 0
			width: 80
			height: 240
		clock:
			x: 0
			y: 40
			width: 7
			height: 7
