extends SceneBase

func _init():
	sceneID = "PSTentaclesTemplate"

func _run():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS
	
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		saynn("MEOW MEOW!")
		
		addButton("Continue", "See what happens next", "endthescene")
		

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func supportsShowingPawns() -> bool:
	return true
