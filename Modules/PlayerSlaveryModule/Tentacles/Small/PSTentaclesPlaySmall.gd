extends SceneBase

func _init():
	sceneID = "PSTentaclesPlaySmall"

func _reactInit():
	addCharacter(GM.main.PS.getTentaclesCharID())

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
		saynn("The monster is feeling like playing.")

		addButton("Ball", "Through a ball", "doBall")
		addButton("Puzzle", "Do a puzzle together", "doPuzzle")
		addButton("Shoo", "Go away", "dontFeed")
	if(state == "doBall"):
		saynn("YOU PLAY BALL!")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "doPuzzle"):
		saynn("YOU DO A PUZZLE!")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "dontFeed"):
		saynn("YOU SHOO!")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "doBall"):
		_tentacles.incStat(_tentacles.STAT_AGILITY)

	if(_action == "doPuzzle"):
		_tentacles.incStat(_tentacles.STAT_MIND)

	if(_action == "dontFeed"):
		_tentacles.incStat(_tentacles.STAT_ANGER)

	setState(_action)
