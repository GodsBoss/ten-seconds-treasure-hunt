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
				'...............'
				'...............'
				'...............'
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
						icon: 'arrow-left'
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
				after: [
						message: 'You have proven your worth as a sailor. Great job!'
				]
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
				before: [
						message: 'Normal people have a clear concept of property.'
					,
						message: 'Every thing belongs to exactly one owner.'
					,
						message: 'Pirates transcend this primitive understanding.'
					,
						message: 'If you see a stranded ship, just take it for yourself!'
				]
				after: [
						message: 'You are learning quickly.'
				]
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
				before: [
						message: 'Treasure chests are rarely just standing around, waiting to be looted.'
					,
						message: 'Often, they are buried deep in the ground, marked with a big X.'
					,
						message: 'But it could also be a trap.'
					,
						message: 'To be sure, find a map. Maps never lie!'
					,
						message: 'Then you can dig out the chest.'
				]
				after: [
						message: 'You are not only a pirate, you are a tracker!'
				]
			level:[
				'.O,,,O....'
				'.OM,,O....'
				'.OOO=O....'
				'..........'
				'..C.......'
				'..........'
				'....OOOO..'
				'....=,TO..'
				'....OOOO..'
				'..........'
			]
		5:
			title: 'Wall'
			messages:
				before: [
						message: 'Walls can be a real hindrance.'
					,
						message: 'They are too high to climb and too strong to bash aside.'
					,
						message: 'But with a little blasting powder... try it out!'
				]
				after: [
						message: 'Walls do not impede you. Great!'
				]
			level:[
				'.O,TO.....'
				'.OWWOO....'
				'.O,,XO....'
				'.O=OOO....'
				'..........'
				'..........'
				'...C......'
				'..........'
				'..........'
				'..........'
			]
		6:
			title: 'Natives'
			messages:
				before: [
						message: 'Many islands are inhabited by primitive peoples.'
					,
						message: 'They often guard the treasures when they find them.'
					,
						message: 'You can easily defeat them with a saber.'
				]
				after: [
						message: 'These natives were no match for you.'
				]
			level:[
				'..........'
				'.....OOOOO'
				'.....O,N,T'
				'.....O=OOO'
				'..........'
				'OOOO......'
				',c,u......'
				'OOOO=O....'
				'...O,O....'
				'...OtO....'
			]
		7:
			title: 'Enemy ship'
			messages:
				before: [
						message: 'You are not the only pirate captain around.'
					,
						message: 'Others will only reduce you part of the loot.'
					,
						message: 'To destroy an enemy ship, shoot them with a cannon.'
				]
				after: [
						message: 'This would have taught them. If they had survived.'
				]
			level:[
				'......Oooo'
				'......Oooo'
				'....O=O,oo'
				'~~..O,,,,o'
				'^^^POOOO,T'
				'..~...^OOO'
				'........^.'
				'C.........'
				'..~...OOOO'
				'......=,,>'
			]
		8:
			title: 'Kraken'
			messages:
				before: [
						message: 'The Sea is big, deep and mysterious.'
					,
						message: 'Sometimes things emerge which should never the light of the sun.'
					,
						message: 'The Kraken is one of them. Big, ugly and hungry.'
					,
						message: 'Too big to kill, this monster can only be forced to submerge, hopefully forever.'
					,
						message: 'Find a magic scroll. It will help you make the Kraken disappear.'
				]
				after: [
						message: 'The Kraken is gone. Good, especially for you.'
				]
			level:[
				'.....OT,,o'
				'..^..OOO,o'
				'.......=,,'
				'.~~....Oo,'
				'OOO^..^OOO'
				'ocO~K^^....'
				',,O~......'
				'OuO.......'
				'.....OOOOO'
				'.....=,,,S'
			]
		9:
			title: 'Reefs'
			messages:
				before: [
						message: 'The Sea is big and deep... but not everywhere.'
					,
						message: 'Shallow waters are dangerous. Your ship could go aground.'
					,
						message: 'To avoid this, do not sail them.'
					,
						message: 'But if you have to, be sure to have lead with you.'
				]
				after: [
						message: 'Do you know how to identify a competent captain?'
					,
						message: 'He is alive.'
				]
			level:[
				'...~~~O,,,'
				'......O,o,'
				'~~C...=,oL'
				'~^...OOooo'
				'~~~~~OT,,o'
				'~~~^~OOO,o'
				'^...~~~O=O'
				'~~........'
				'....~^~...'
				'..........'
			]
		10:
			title: 'Whirlpool'
			messages:
				before: [
						message: 'A fast, but dangerous way to travel the sea is a whirlpool.'
					,
						message: 'These giant maelstroms can be used as shortcuts to other parts of the Sea.'
					,
						message: 'But if you just travel through them, you will not know where you are.'
					,
						message: 'To avoid getting lost, use a Sextant.'
				]
				after: [
						message: 'This was all just for fun.'
					,
						message: 'Are you ready for the real adventures?'
				]
			level:[
				'.....Ooooo'
				'.C...O,T,o'
				'....@Oo,,,'
				'O=OO.OO,o,'
				'o,,O..O,,,'
				',oVO^^OO=O'
				'OOOO~.....'
				'..........'
				'......@...'
				'..........'
			]
		11:
			title: 'Hidden in the sand'
			level:[
				'o,O~~~O,oT'
				',tO.~^Oo,,'
				'=OO...OONo'
				'......^O,,'
				'~^~....O=O'
				'.~^.......'
				'..~..OOOO.'
				'....OO,,=.'
				'.C..OMo,O^'
				'~~..O,,,O.'
			]
			messages:
				before: [
						message: 'These natives do not even know what they sit on.'
					,
						message: 'Nevertheless, to get the treasure, you have to kill them!'
				]
				after: [
						message: 'Great! You found the first chest all by yourself!'
				]
		12:
			title: 'Blocked!'
			level:[
				'..~~..O,,o'
				'~~~^..=,o,'
				'OOO...O,,,'
				'oSO.^KO,oT'
				'o,O^..Oooo'
				'o,OOOPO>,o'
				',,,,O.OO,,'
				'OO=OO..OO='
				'~~........'
				'^~~.C..~~^'
			]
			messages:
				before: [
						message: 'These pirates obviously do not know how to handle the Kraken.'
					,
						message: 'But they block the passage to not let anyone else do it!'
					,
						message: 'Show them that their plan is futile!'
				]
				after: [
						message: 'Respect! You defeated the pirates and the Kraken!'
				]
		13:
			title: 'Strange allies'
			level:[
				'o,,TO~^.OL'
				',NoOO...O,'
				'o,N=.~~~O='
				'OOOO..^^~.'
				'..~~K^.~^.'
				'OO~~~~~~..'
				'SO..~~...^'
				',OO~.....~'
				',,=~C..~..'
				'toO....^~~'
			]
			messages:
				before: [
						message: 'This tribe somehow managed to summon a Kraken.'
					,
						message: 'But first you must find a way to sail through the shoals.'
				]
				after: [
						message: 'You found your loot!'
				]
		14:
			title: 'Conflicts'
			level:[
				'V,=..~^Oto'
				'OOO..@.O,,'
				'^C.....Oo,'
				'....~~^OO='
				'.P.~^^~~.P'
				'O=OOO.....'
				',N,TO..~..'
				'ooooOO....'
				',,,o,=..@.'
				'>o,,,O...~'
			]
			messages:
				before: [
						message: 'Some pirates and natives seem to fight over the treasure.'
					,
						message: 'Make sure to be the last one laughing!'
				]
				after: [
						message: 'Both parties were not able to defeat a single enemy.'
					,
						message: 'You defeated them both! What a great success.'
				]
		15:
			title: 'Another break in the wall'
			level:[
				'^^O,ToO^~~'
				'^~OWWOO.C.'
				'~~OWWO....'
				'~.O,,O.^^~'
				'~.O=OO....'
				'.....~~~..'
				'...^.....^'
				'~O=OOOOOP~'
				'OO,oX,,=.~'
				'>,,,o,,O.^'
			]
			messages:
				before: [
						message: 'The chest is hidden behind a thick wall.'
					,
						message: 'You do not have any explosives, but why bring them along, when you can take them from someone else?'
				]
				after: [
					message: 'Opportunism is not a bad habit, it is clever!'
				]
		16:
			title: 'Turn the tide'
			level:[
				'MN,oX,,O~^'
				'OO=Ooo,=.~'
				'...O>OOO..'
				'~..O,O.^~.'
				'^..O=O^~..'
				'^.....^~~.'
				'O=O.OuOOOu'
				'T,OPO,Wco,'
				'ooO=Ooo,o,'
				't,,,ooo,,,'
			]
			messages:
				before: [
						message: 'Only with a very dirty trick could they capture you.'
					,
						message: 'But you are smart. Find a way out and take the treasure!'
					,
						message: 'By the way, natives seem to worship everything which looks mysterious to them.'
				]
				after: [
						message: 'Good! You have proven your worth as a pirate captain.'
					,
						message: 'But the greatest adventure is still waiting!'
				]
		17:
			title: 'Swirling'
			level:[
				'.=,To,=.OS'
				'KOOOO,O.ON'
				'....O,O.=,'
				'..O=OWOPOo'
				'~.O,otO.OX'
				'..OVooO.O,'
				'.~OOoLO.O='
				'.^^Oo,=...'
				'.@~OooO.@~'
				'.C~=,>O..^'
			]
			messages:
				before: [
						message: 'You have the unique chance of becoming king of the pirates.'
					,
						message: 'Defeat the evil Captain Blackbeard with the mythical cannon of the gods!'
					,
						message: 'Okay, that was a joke.'
					,
						message: 'This is not Captain Blackbeard, just an ordinary pirate ship.'
					,
						message: 'And it is a normal cannon, like every other.'
					,
						message: 'The pirates would never accept a king anyway.'
					,
						message: 'So without further ado, just get the treasure!'
				]
				after: [
						message: 'Wow! You actually did it!'
					,
						message: 'This story may be over, but you will find others, for sure!'
				]
			final: yes

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
