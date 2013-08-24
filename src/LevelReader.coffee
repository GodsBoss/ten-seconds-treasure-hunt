class LevelReader
	@DO_NOT_VALIDATE = no

	constructor:(@levelsData)->

	read:(id, validate = yes)->
		data = @levelsData.get id
		width = data.level[0].length
		height = data.level.length
		level = Level.create { width: width, height: height }
		hasCliffs = no
		for x in [0..width-1]
			for y in [0..height-1]
				char = data.level[y].charAt x
				switch char
					when '.'
						tile = Tile.create 'water'
					when ','
						tile = Tile.create 'sand'
					when '~'
						tile = Tile.create 'water'
						tile.setObject new Obstacle 'reef'
					when '^'
						tile = Tile.create 'water'
						tile.setObject new Obstacle 'rock'
					when 'O'
						tile = Tile.create 'cliff'
						hasCliffs = yes
					when 'T'
						tile = Tile.create 'sand'
						tile.setObject new Treasure
					when 'o'
						tile = Tile.create 'sand'
						tile.setObject new Obstacle 'tree'
					when 'c'
						tile = Tile.create 'sand'
						level.playerStart = { x: x, y: y }
					when 'C'
						tile = Tile.create 'water'
						level.playerStart = { x: x, y: y }
					when '>'
						tile = Tile.create 'sand'
						tile.setObject new Item 'cannon'
					when 'M'
						tile = Tile.create 'sand'
						tile.setObject new Item 'map'
					when 't'
						tile = Tile.create 'sand'
						tile.setObject new Item 'saber'
					when 'S'
						tile = Tile.create 'sand'
						tile.setObject new Item 'scroll'
					when 'X'
						tile = Tile.create 'sand'
						tile.setObject new Item 'explosives'
					when 'L'
						tile = Tile.create 'sand'
						tile.setObject new Item 'lead'
					when 'V'
						tile = Tile.create 'sand'
						tile.setObject new Item 'sextant'
					when '='
						# Behave like cliffs, but will later be converted to a beach by
						# changing the tile's type and subtype and removing the beach object.
						tile = Tile.create 'cliff'
						tile.setObject { type: 'beach' }
					else
						tile = Tile.create 'water'
				level.set x, y, tile

		if hasCliffs
			@handleCliffs level
			@convertCliffsToBeaches level

		level

	handleCliffs:(level)->
		cliffs = {}
		for x in [0..level.getWidth()-1]
			for y in [0..level.getHeight()-1]
				switch level.get(x, y).type
					when 'cliff'
						cliffs[x+'-'+y] =
							1: null
							2: null
							4: null
							8: null
					when 'sand'
						cliffs[x+'-'+y] =
							1: 1
							2: 1
							4: 1
							8: 1
					when 'water'
						cliffs[x+'-'+y] =
							1: 0
							2: 0
							4: 0
							8: 0

		nothingFound = no
		until nothingFound
			nothingFound = yes
			for x in [0..level.getWidth()-1]
				for y in [0..level.getHeight()-1]
					tile = level.get x, y
					id = x + '-' + y
					ids =
						left: (x-1)+'-'+y
						top: x+'-'+(y-1)
						right: (x+1)+'-'+y
						bottom: x+'-'+(y+1)
						leftTop: (x-1)+'-'+(y-1)
						rightTop: (x+1)+'-'+(y-1)
						leftBottom: (x-1)+'-'+(y+1)
						rightBottom: (x+1)+'-'+(y+1)
					if tile.type is 'cliff'
						if cliffs[id][1] is null
							if x > 0 and cliffs[ids.left][2] isnt null
								cliffs[id][1] = cliffs[ids.left][2]
								nothingFound = no
							else if y > 0 and cliffs[ids.top][4] isnt null
								cliffs[id][1] = cliffs[ids.top][4]
								nothingFound = no
							else if x > 0 and y > 0 and cliffs[ids.leftTop][8] isnt null
								cliffs[id][1] = cliffs[ids.leftTop][8]
								nothingFound = no
						if cliffs[id][2] is null
							if x < level.getWidth()-1 and cliffs[ids.right][1] isnt null
								cliffs[id][2] = cliffs[ids.right][1]
								nothingFound = no
							else if y > 0 and cliffs[ids.top][8] isnt null
								cliffs[id][2] = cliffs[ids.top][8]
								nothingFound = no
							else if x < level.getWidth()-1 and y > 0 and cliffs[ids.rightTop][4] isnt null
								cliffs[id][2] = cliffs[ids.rightTop][4]
								nothingFound = no
						if cliffs[id][4] is null
							if x > 0 and cliffs[ids.left][8] isnt null
								cliffs[id][4] = cliffs[ids.left][8]
								nothingFound = no
							else if y < level.getHeight()-1 and cliffs[ids.bottom][1] isnt null
								cliffs[id][4] = cliffs[ids.bottom][1]
								nothingFound = no
							else if x > 0 and y < leve.getHeight()-1 and cliffs[ids.leftBottom][2] isnt null
								cliffs[id][4] = cliffs[ids.leftBottom][2]
								nothingFound = no
						if cliffs[id][8] is null
							if x < level.getWidth()-1 and cliffs[ids.right][4] isnt null
								cliffs[id][8] = cliffs[ids.right][4]
								nothingFound = no
							else if y < level.getHeight()-1 and cliffs[ids.bottom][2] isnt null
								cliffs[id][8] = cliffs[ids.bottom][2]
								nothingFound = no
							else if x < level.getWidth()-1 and y < level.getHeight()-1 and cliffs[ids.rightBottom][1] isnt null
								cliffs[id][8] = cliffs[ids.rightBottom][1]
								nothingFound = no

		for x in [0..level.getWidth()-1]
			for y in [0..level.getHeight()-1]
				tile = level.get(x, y)
				if tile.type is 'cliff'
					cliff = cliffs[x+'-'+y]
					for corner in [1, 2, 4, 8]
						if cliff[corner] is null
							throw new Error 'Could not read level!'
					tile.setSubType cliff[1]+cliff[2]*2+cliff[4]*4+cliff[8]*8

	convertCliffsToBeaches:(level)->
		for x in [0..level.getWidth()-1]
			for y in [0..level.getHeight()-1]
				tile = level.get x, y
				if tile.type is 'cliff' and tile.hasObject() and tile.getObject().type == 'beach'
					tile.removeObject()
					tile.type = 'beach'
					switch tile.getSubType()
						when 3
							tile.setSubType 'top'
						when 5
							tile.setSubType 'left'
						when 10
							tile.setSubType 'right'
						when 12
							tile.setSubType 'bottom'
