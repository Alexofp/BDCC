extends SceneBase

func _init():
	sceneID = "PSShaftMinerStart"

func _run():
	if(state == ""):
		saynn("Meow meow.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
