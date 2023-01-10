extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "TaviStocksEscape"

func _run():
	if(state == ""):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		
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
