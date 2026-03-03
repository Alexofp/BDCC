extends SceneBase

func _init():
	sceneID = "PSTentaclesWindowAlone"

func _reactInit():
	#addCharacter(GM.main.PS.getTentaclesCharID())
	processTime(60*10)
	GM.pc.addLust(-20)
	pass

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
		playAnimation(StageScene.Solo, "stand")
		saynn("You approach the big reinforced window of your cell that leads into the void.")

		saynn("The glass is cold under your fingertips. Beyond it.. nothing but black and tiny dots of light. Stars.")

		saynn("You've been a prisoner for so long that the outside world feels like a dream. Something you once knew but can't quite remember.")

		saynn("There are no planets or moons nearby. And even if there is a sun.. it's probably only visible from the other side.")

		saynn("You calm your mind a bit..")

		if (_tentacles.isNormal() || _tentacles.isSmalll()):
			saynn("The tentacles are somewhere behind you. You can hear their soft rustle.")

			if (_tentacles.getPrefer() != _tentacles.EVENT_WINDOW):
				addButton("Tentacles", "Go get their attention and make them look through the window", "get_attention")
			else:
				addDisabledButton("Tentacles", "They already prefer to be mindful..")
		addButton("Enough", "See what happens next", "endthescene")
		if (!_tentacles.isNormal() && !_tentacles.isSmalll()):
			if (_tentacles.isTiny()):
				addDisabledButton("Tentacles", "They're too small and weak to share this view with..")
			else:
				addDisabledButton("Someone", "You don't have anyone to share this view with..")
	if(state == "get_attention"):
		_tentacles.doAnim("idle")
		addCharacter(GM.main.PS.getTentaclesCharID())
		saynn("You get the attention of the tentacles and invite them to look at the view.")

		saynn("[say=pc]The world is bigger than you think.[/say]")

		saynn("You're not sure if they could even think the same way that you do.. but it doesn't matter.")

		saynn("[say=pc]Each of those small lights is a small world of its own. Not a single person can comprehend how much there is to explore.[/say]")

		saynn("You spend some more time thinking about it.. and then look at the still tentacles. It looks like you have sparked some.. curiosity in them. For sure.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "get_attention"):
		_tentacles.setPrefer(_tentacles.EVENT_WINDOW)

	setState(_action)
