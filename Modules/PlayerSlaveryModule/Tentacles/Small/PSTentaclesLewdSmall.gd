extends SceneBase

func _init():
	sceneID = "PSTentaclesLewdSmall"

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
		saynn("The monster touches you.")

		addButton("Rub", "Rub its tentacles", "doRub")
		addButton("Shoo", "Go away", "dontFeed")
	if(state == "doRub"):
		saynn("YOU RUB TENTACLES!")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "dontFeed"):
		saynn("YOU SHOO!")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "doRub"):
		_tentacles.incStat(_tentacles.STAT_LUST)

	if(_action == "dontFeed"):
		_tentacles.incStat(_tentacles.STAT_ANGER)

	setState(_action)
