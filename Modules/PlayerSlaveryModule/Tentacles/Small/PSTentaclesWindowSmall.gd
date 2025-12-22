extends SceneBase

func _init():
	sceneID = "PSTentaclesWindowSmall"

func _reactInit():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS
	addCharacter(GM.main.PS.getTentaclesCharID())
	
	var possible:Array = []
	
	if(_tentacles.mind <= 0):
		possible.append("0watch")
	
	if(possible.size() > 0):
		setState(RNG.pick(possible))

func resolveCustomCharacterName(_charID):
	if(_charID == "ten"):
		return GM.main.PS.getTentaclesCharID()
	if(_charID == "sci1"):
		return GM.main.PS.getScientist1CharID()
	if(_charID == "sci2"):
		return GM.main.PS.getScientist2CharID()

func _run():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(state == ""):
		saynn("You stare at the window.")

		addButton("Chat", "Do chat", "doChat")
	if(state == "doChat"):
		saynn("You chat.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "0watch"):
		# ((small idle
		saynn("The tentacle monster bumps into the huge glass window.. Luckily, the reinforced glass isn't so easy to crack.")

		saynn("But the tentacles keep trying.. bumping into the window again and again.. almost like they don't realize that there is a glass there.")

		saynn("They're not the smartest, are they..")

		addButton("Explain", "Try to explain that there is a window in the way", "0watch_explain")
		addButton("Just watch", "Watch the silly tentacles", "0watch_watch")
		addButton("Pull away", "Pull the tentacles away from the window", "0watch_pullaway")
	if(state == "0watch_explain"):
		saynn("You try to get its attention..")

		saynn("[say=pc]Hey.. look at me.[/say]")

		saynn("One of the pointy tips bends towards you.")

		saynn("[say=pc]This.. is a window.[/say]")

		saynn("You knock on it.")

		saynn("[say=pc]It might look.. transparent.. It might seem like it's not there.. but it's solid.[/say]")

		saynn("You're not sure where to look to check if the tentacles have understood anything. But then the tentacles reveal it by bumping into the window again.")

		saynn("You sigh and get their attention again.")

		saynn("[say=pc]Look at me.[/say]")

		saynn("You point at the window and then cross your wrists.")

		saynn("[say=pc]No. Bad.[/say]")

		saynn("The tentacles watch your gestures.. and seemingly listen.")

		saynn("They give up trying to escape into the void and move somewhere else..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "0watch_watch"):
		saynn("You decide to just watch the tentacles.")

		saynn("Each time they bonk themselves against the transparent window, you can't help but to giggle.")

		saynn("[say=pc]You are so dumb, you know that?[/say]")

		saynn("But they just smash themselves against the window again.. like a silly trapped fly.")

		saynn("Eventually, the tentacles give up. They sway their tentacles in a mean way towards the glass.. and move on.")

		saynn("That was fun while it lasted.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "0watch_pullaway"):
		saynn("You just can't watch the tentacles hurt themselves..")

		saynn("[say=pc]Stop it.[/say]")

		saynn("Before the next tendril has a chance to bonk into the window, you catch it and yank it back, away from the glass.")

		saynn("A second tentacle tries the same.. but you block that attempt too.")

		saynn("[say=pc]Quit it already.[/say]")

		saynn("Eventually you get too annoyed with them and just yank the whole plant away from the corner where the window is.")

		saynn("[say=pc]Do something else, don't go here.[/say]")

		saynn("Seeing you in the spot of a window.. makes them finally give up.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "doChat"):
		_tentacles.incStat(PlayerSlaveryTentacles.STAT_MIND)

	if(_action == "0watch_explain"):
		_tentacles.train(_tentacles.STAT_MIND)

	if(_action == "0watch_watch"):
		_tentacles.train(_tentacles.STAT_ANGER)

	if(_action == "0watch_pullaway"):
		_tentacles.trainNothing()

	setState(_action)
