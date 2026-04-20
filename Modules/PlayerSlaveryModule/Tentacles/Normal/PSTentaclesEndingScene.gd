extends SceneBase

func _init():
	sceneID = "PSTentaclesEndingScene"

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
		saynn("ENDING ENDING ENDING!!!")

		addButton("Okay", "ENOUGH FUN", "doEndSlavery")
	if(state == "doSleep"):
		saynn("YOU SLEPT. EVENT HERE MAYBE?")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "doEndSlavery"):
		endScene()
		GM.main.endCurrentScene()
		GM.main.stopPlayerSlavery()
		GM.pc.setLocation(GM.pc.getCellLocation())
		return

	setState(_action)
