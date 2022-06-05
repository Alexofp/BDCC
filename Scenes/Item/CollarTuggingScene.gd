extends "res://Scenes/SceneBase.gd"


func _init():
	sceneID = "CollarTuggingScene"

func _run():
	if(state == ""):
		saynn("You try to inspect your collar but that proves to be very hard since it's on your neck.")
		
		saynn("It sits very tight, you can barelly squeeze a finger under it to scratch on your neck but thats about it.")

		addButton("Leave it", "Nothing you can do", "leaveit")
		if(GM.pc.hasBoundArms()):
			addDisabledButton("Tug", "Your bound arms don't let you do this")
		else:
			addButton("Tug", "Try to tug on it", "tug")

	if(state == "tug"):
		saynn("You try and tug on your collar while no one is looking. Maybe you can somehow take it off without unlocking.")
		
		saynn("But alas, you make no progress, the bulky thing is sitting very tightly")
		
		addButton("Continue", "Oh well", "")

	if(state == "leaveit"):
		saynn("You sigh and leave your collar alone")
		
		addButton("Continue", "Oh well", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
