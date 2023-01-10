extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "StocksEscape"


func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		
		saynn("With the corner of your eye you notice some movement, a brown feline that was sitting on the bench has stood up. She is not very big and wears a general block uniform.")

		saynn("She looks around for a bit and then carefully approaches you. Firstly, she unchains your legs and then unlocks the top part of the stocks, allowing you to finally escape from it. You stand up and stretch.")

		saynn("[say=rahi]Sorry she couldn’t do it earlier, it’s scary when others are watching..[/say]")

		if(!GM.main.getModuleFlag("RahiModule", "Rahi_Introduced")):
			saynn("Huh, she is talking about herself in third person?")

			saynn("[say=pc]Um.. thanks anyways[/say]")

			saynn("[say=rahi]Don’t mention it..[/say]")
		else:
			saynn("[say=pc]Thank you, kitty[/say]")

			saynn("She offers you a smile and nods.")

			saynn("[say=rahi]All good[/say]")

		saynn("The brown feline makes sure you’re okay and then goes back to resting on the bench in the corner.")

		addButton("Leave", "You got saved!", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
