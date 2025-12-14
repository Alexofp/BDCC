extends SceneBase

func _init():
	sceneID = "PSTentaclesFeedSmall"

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
		saynn("The monster stares at the fridge.")

		addButton("Feed", "Do feed", "doFeed")
		addButton("Shoo", "Go away", "dontFeed")
	if(state == "doFeed"):
		saynn("YOU FEED!")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "dontFeed"):
		saynn("YOU DON'T FEED!")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "doFeed"):
		_tentacles.incStat(_tentacles.STAT_AGILITY)

	if(_action == "dontFeed"):
		_tentacles.incStat(_tentacles.STAT_ANGER)

	setState(_action)
