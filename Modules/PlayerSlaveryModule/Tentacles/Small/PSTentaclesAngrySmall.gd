extends SceneBase

func _init():
	sceneID = "PSTentaclesAngrySmall"

func _reactInit():
	addCharacter(GM.main.PS.getTentaclesCharID())
	GM.pc.addPain(10)

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
		saynn("THE TENTACLE MONSTER BONKS YOU! OW!")

		saynn("IT SEEMS TO BE ANGRY BECAUSE YOU "+str(_tentacles.getAngryReason())+".")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
