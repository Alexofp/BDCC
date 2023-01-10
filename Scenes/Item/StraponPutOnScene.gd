extends "res://Scenes/SceneBase.gd"


func _init():
	sceneID = "StraponPutOnScene"

func _run():
	if(state == ""):
		saynn("You realize how silly you would look walking around with a strapon and decide against it.")
		
		saynn("( Strapons are only usable during sex scenes )")

		addButton("Leave it", "Nothing you can do", "endthescene")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
