extends SceneBase

func _init():
	sceneID = "PSTentaclesNormalSleep"

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
		saynn("IT'S LATE. TIME TO SLEEP.")

		addButton("Sleep", "Go sleep", "doSleep")
	if(state == "doSleep"):
		saynn("YOU SLEPT. EVENT HERE MAYBE?")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "doSleep"):
		GM.main.startNewDay()
		_tentacles.doNewDay()

	setState(_action)
