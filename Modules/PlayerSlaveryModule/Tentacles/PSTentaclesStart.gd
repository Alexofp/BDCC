extends SceneBase

func _init():
	sceneID = "PSTentaclesStart"

func _run():
	if(state == ""):
		aimCameraAndSetLocName("pstent_bed")
		GM.pc.setLocation("pstent_bed")
		playAnimation(StageScene.Solo, "kneel")
		saynn("START TENTACLES!")

		addButton("Continue", "See what happens next", "start_main")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "start_main"):
		endScene()
		runScene("PSTentaclesWalker")
		return

	setState(_action)
