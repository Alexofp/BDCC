extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "StocksEscape"

func _reactInit():
	var possible = ["rahi_saves_you"]
	if(GM.main.getFlag(TaviModule.Tavi_IntroducedTo) && !GM.main.getFlag(TaviModule.Tavi_IsAngryAtPlayer)):
		possible.append("tavi_saves_you")
	setState(RNG.pick(possible))
	
func _run():
	if(state == "rahi_saves_you"):
		addCharacter("rahi")
		
		saynn("With the corner of your eye you notice some movement, a brown feline that was sitting on the bench has stood up. She is not very big and wears a general block uniform.")

		saynn("She looks around for a bit and then carefully approaches you. Firstly, she unchains your legs and then unlocks the top part of the stocks, allowing you to finally escape from it. You stand up and stretch.")

		saynn("[say=rahi]Sorry she couldn’t do it earlier, it’s scary when others are watching..[/say]")

		if(!GM.main.getFlag(RahiModule.Rahi_Introduced)):
			saynn("Huh, she is talking about herself in third person?")

			saynn("[say=pc]Um.. thanks anyways[/say]")

			saynn("[say=rahi]Don’t mention it..[/say]")
		else:
			saynn("[say=pc]Thank you, kitty[/say]")

			saynn("She offers you a smile and nods.")

			saynn("[say=rahi]All good[/say]")


		saynn("The brown feline makes sure you’re okay and then goes back to resting on the bench in the corner.")

		addButton("Leave", "You got saved!", "endthescene")

	if(state == "tavi_saves_you"):
		addCharacter("tavi")
		
		saynn("You hear a voice behind.")

		saynn("[say=tavi]Oh hey, that butt looks familliar.[/say]")

		saynn("You try to look back but your neck has a very small angle of freedom. You feel your butt being spanked and let out a soft moan.")

		saynn("[say=tavi]My pet has been naughty, huh~?[/say]")

		saynn("Tavi walks into your view and crouches before you, her paw slides along your cheek and taps a few times.")

		saynn("[say=tavi]You look cute there, maybe I shouldn’t unlock you. But oh well[/say]")

		saynn("Tall feline unchains your legs and then unlocks the stocks, letting you stand up at last.")

		saynn("[say=tavi]Don’t get used to it~[/say]")

		saynn("She gives you a little head pat and then leaves.")

		addButton("Leave", "You got saved!", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
