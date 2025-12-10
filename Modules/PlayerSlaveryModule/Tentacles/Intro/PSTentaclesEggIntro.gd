extends SceneBase

func _init():
	sceneID = "PSTentaclesEggIntro"

func _run():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS
	
	if(state == ""):
		aimCameraAndSetLocName(_tentacles.LOC_SCIENTISTS)
		playAnimation(StageScene.Solo, "stand")
		saynn("THEY TALK!")
		
		addContinue("guards_step_in")
		
		#addButton("Continue", "See what happens next", "endthescene")
	
	if(state == "guards_step_in"):
		aimCameraAndSetLocName(_tentacles.LOC_ENTRANCE)
		saynn("GUARDS WALK IN.")
		
		addContinue("guards_leave_egg")

	if(state == "guards_leave_egg"):
		aimCameraAndSetLocName(_tentacles.LOC_MIDDLE)
		saynn("GUARDS PLACE EGG.")
		
		addButton("Approach", "Do what they say", "do_approach_egg")
	
	if(state == "do_approach_egg"):
		GM.pc.setLocation(_tentacles.LOC_MIDDLE)
		aimCameraAndSetLocName(_tentacles.LOC_MIDDLE)
		saynn("YOU LOOK AT EGG. WOW, WEIRD.")
		addContinue("endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS
	
	if(_action == "guards_leave_egg"):
		_tentacles.setStage(_tentacles.STAGE_EGG)
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func supportsShowingPawns() -> bool:
	return true
