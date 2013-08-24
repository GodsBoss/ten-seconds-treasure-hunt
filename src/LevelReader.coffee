class LevelReader
	@DO_NOT_VALIDATE = no

	constructor:(@levelsData)->

	read:(id, validate = yes)->
		data = @levelsData.get id
		width = data.level[0].length
		height = data.level.length
		level = Level.create { width: width, height: height }
		for x in [0..width-1]
			for y in [0..height-1]
				char = data.level[y].charAt x
				switch char
					when '.'
					else
						tile = LevelReader.createWater()
		level

	@createWater:()->
		type: 'water'
		time: Math.random()
