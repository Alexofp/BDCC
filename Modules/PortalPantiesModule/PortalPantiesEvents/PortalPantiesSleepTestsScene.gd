extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "PortalPantiesSleepTestsScene"

func _reactInit():
	var possible = [
		"sleeping_poke",
	]
	setState(RNG.pick(possible))
		
	#GM.pc.addCredits(1)

func _run():
	if(state == "sleeping_poke"):
		saynn("Even while sleeping you feel like your private bits are always out in the open. But at least no one is touching them.")

		addButton("Continue", "That wasn't too bad", "endthescene")


func _react(_action: String, _args):
	if(_action in ["sleeping_poke"]):
		GM.pc.addLust(20)

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

