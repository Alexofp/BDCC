extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "TestMasturbationSpottedScene"

func _run():
	#if(state == ""):
	#	addCharacter("cp_guard")

	if(state == ""):
		saynn("((This should be a scene where you get caught masturbating))")
		
		addButton("Walk away", "Yay", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	
	setState(_action)

