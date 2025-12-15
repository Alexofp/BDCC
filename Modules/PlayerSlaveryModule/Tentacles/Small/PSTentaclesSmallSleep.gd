extends SceneBase

func _init():
	sceneID = "PSTentaclesSmallSleep"

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
		saynn("YOU GO SLEEP IN YOUR BED.")

		saynn("THE TENTACLES MIGHT DO SOMETHING BASED ON STATS HERE.")

		addButton("Sleep", "Time to sleep", "doSleep")
	if(state == "doSleep"):
		saynn("YOU SLEEP.")

		saynn("YOU GET UP.")

		saynn("OH WOW. {psTentacles} IS MUCH BIGGER! MORE TENTACLES TOO.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "doSleep"):
		GM.main.startNewDay()
		_tentacles.setStage(_tentacles.STAGE_NORMAL)

	setState(_action)
