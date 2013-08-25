class LevelsData

	get:(id)->
		LevelsData.levels[id]

	@levels =
		title:
			title: ''
			messages:
				before: []
				after: []
			level:[
				'...............'
				'...^~..........'
				'...............'
				'.....OOOOOO....'
				'....~O,,,,=....'
				'....~OT,OOO....'
				'.....OOOO.^^...'
				'..........^....'
				'........~^^~...'
				'..^............'
				'...............'
			]
		1:
			title: 'Tutorial: Landlubber'
			messages:
				before: [
						message: 'Arr! You are a pirate captain!'
						icon: 'captain'
					,
						message: 'Your destiny is to find treasure.'
						icon: 'treasure'
					,
						message: 'But move quickly, because you only have ten seconds to get it!'
					,
						message: 'Now go (click or touch the field to go to) to the chest to obtain your loot.'
				]
				after: [
						message: 'Great! You made it. The next adventure is waiting.'
				]
			level:[
				'........^~'
				'..^~......'
				'....OOOO..'
				'..OOOoTO..'
				'.OOc,,,O..'
				'.OoooooOO.'
				'.O,o,,o,O.'
				'.OOOO,,OO.'
				'.~^^OO=O~.'
				'..~~......'
			]
		2:
			title: 'Tutorial: Beach boy'
			messages:
				before: [
						message: 'A real pirate travels by boat. You can move it just like you move yourself.'
					,
						message: 'But treasure chests can only be found on land!'
					,
						message: 'Your ship can only land on beaches, not cliffs.'
					,
						message: 'Sail to the beach and obtain the chest.'
				]
				after: []
			level:[
				'..........'
				'.OOOO...^.'
				'~OT,=...^.'
				'~OOOO.....'
				'~.........'
				'.....C....'
				'......^...'
				'..^^^^^...'
				'..~~....^.'
				'..........'
			]
		3:
			title: 'Take a ship'
			messages:
				before: []
				after: []
			level:[
				'..........'
				'.OOOOO....'
				'.Oc,,u....'
				'.OOOOO....'
				'..........'
				'..........'
				'.......OOO'
				'.......=,T'
				'.......OOO'
				'..........'
			]
		4:
			title: 'Treasure map'
			messages:
				before: []
				after: []
			level:[
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
			]
		5:
			title: 'Wall'
			messages:
				before: []
				after: []
			level:[
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
			]
		6:
			title: 'Natives'
			messages:
				before: []
				after: []
			level:[
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
			]
		7:
			title: 'Enemy ship'
			messages:
				before: []
				after: []
			level:[
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
			]
		8:
			title: 'Kraken'
			messages:
				before: []
				after: []
			level:[
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
			]
		9:
			title: 'Reefs'
			messages:
				before: []
				after: []
			level:[
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
			]
		10:
			title: 'Whirlpool'
			messages:
				before: []
				after: []
			level:[
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
			]

###

Level template:

		0:
			title: ''
			level:[
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
				'..........'
			]
			messages:
				before: []
				after: []

###
