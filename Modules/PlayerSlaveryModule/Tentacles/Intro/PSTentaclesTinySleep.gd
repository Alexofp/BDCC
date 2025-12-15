extends SceneBase

func _init():
	sceneID = "PSTentaclesTinySleep"

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
		saynn("YOU SLEEP CAREFULLY.")

		addButton("Sleep", "See what happens next", "newday")
	if(state == "newday"):
		saynn("NEW DAY.")

		saynn("THE TENTACLES HAVE GROWN. THEY CAN MOVE NOW.")

		saynn("OH NO, THEY ARE NOW WANDERING AROUND THE CELL.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "newday"):
		GM.main.startNewDay()
		_tentacles.setStage(_tentacles.STAGE_SMALL)

	setState(_action)
