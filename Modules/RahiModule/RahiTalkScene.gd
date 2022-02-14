extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "RahiTalkScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		
	if(state == ""):
		saynn("You approach Rahi.")

		addButton("Talk", "Pick a topic to talk to", "talk")
		addButton("Appearance", "Look at her", "appearance")
		addButton("Leave", "Do something else", "endthescene")
		
	if(state == "appearance"):
		saynn("She looks cute")
		
		addButton("Back", "Go back", "")
		
	if(state == "talk"):
		saynn("[say=rahi]What do you wanna talk about?[/say]")
		
		addButton("Back", "Go back", "")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
