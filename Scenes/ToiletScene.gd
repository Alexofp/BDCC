extends "res://Scenes/SceneBase.gd"


func _init():
	sceneID = "ToiletScene"

func _run():
	if(state == ""):
		saynn("You find an empty toilet stall and enter it. Then you sit on the toilet and begin thinking.")
		
		# TODO: FINISH ME
		addButton("Leave", "Enough thinking", "endthescene")
		

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
