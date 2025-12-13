extends SceneBase

func _init():
	sceneID = "PSTentaclesStart"

func _reactInit():
	#addCharacter(GM.main.PS.getTentaclesCharID())
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
		aimCameraAndSetLocName("pstent_bed")
		GM.pc.setLocation("pstent_bed")
		playAnimation(StageScene.Solo, "kneel")
		saynn("START TENTACLES!")

		addButton("Continue", "See what happens next", "start_main")
		_tentacles.addSkipActions(self)
		if (false):
			addButton("Meow", "You shouldn't see this", "skipStage")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "start_main"):
		endScene()
		runScene("PSTentaclesWalker")
		return

	if(_action == "skipStage"):
		_tentacles.doSkipAction(_args[0])
		endScene()
		runScene("PSTentaclesWalker")
		return

	setState(_action)
