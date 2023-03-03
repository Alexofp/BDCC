extends SceneBase

func _init():
	sceneID = "rahiSlaveryMorningScene"

func _reactInit():
	setState("rahi_is_sleeping")

func _run():
	if(state == ""):
		saynn("You shouldn't see this")

	if(state == "rahi_is_sleeping"):
		saynn("You step into Rahi's cell. She seems to be sleeping so you make your presence known by coughing a few times.")

		saynn("Rahi's ears perk as she opens her eyes. The feline quickly gets up and assumes a submissive pose. Straight posture, head tilted down, arms by her sides.")

		saynn("[say=rahi]Hello, "+str(getFlag("RahiModule.rahiPCName", GM.pc.getName()))+"..[/say]")

		saynn("[say=pc]Did you drink any alcohol while I wasn't here?[/say]")

		saynn("Rahi nods subtly.")

		saynn("[say=pc]Okay, we will deal with that later.[/say]")

		addButton("Continue", "See what happens next", "pick_task_scene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "pick_task_scene"):
		endScene()
		runScene("rahiSlaveryPickTaskScene")
		return

	setState(_action)
