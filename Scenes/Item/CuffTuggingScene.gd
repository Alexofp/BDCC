extends "res://Scenes/SceneBase.gd"


func _init():
	sceneID = "CuffTuggingScene"

func _run():
	if(state == ""):
		saynn("You take a look at your cuffs. They're not as complicated as the collar but they still feature a magnetic lock.")
		
		saynn("They sit pretty tightly, the soft padding on the inside doesn't help much.")

		addButton("Leave it", "Nothing you can do", "leaveit")
		if(GM.pc.hasBoundArms()):
			addDisabledButton("Tug", "Your bound arms don't let you do this")
		else:
			addButton("Tug", "Try to tug on them", "tug")

	if(state == "tug"):
		saynn("You try and tug on one of your cuffs, it has barely any leeway. You decide that breaking your fingers just to take one off is not worth it.")
		
		saynn("Alas, you make zero progress")
		
		addButton("Continue", "Oh well", "")

	if(state == "leaveit"):
		saynn("You sigh and leave your cuffs alone")
		
		addButton("Continue", "Oh well", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
