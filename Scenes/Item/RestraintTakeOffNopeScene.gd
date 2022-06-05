extends "res://Scenes/SceneBase.gd"


func _init():
	sceneID = "RestraintTakeOffNopeScene"

func _run():
	if(state == ""):
		saynn("It's a locked restraint, you can't just take it off")
		
		saynn("If you wanna escape it you gotta use the struggle action.")

		addButton("Leave it", "Nothing you can do", "leaveit")

	if(state == "leaveit"):
		saynn("You sigh and leave the restraint alone")
		
		addButton("Continue", "Oh well", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
