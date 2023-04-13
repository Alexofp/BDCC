extends SceneBase

func _init():
	sceneID = "rahi5SlaveryStartScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		saynn("You enter Rahi's cell. Her cell is not really that different from any other cell, the inmates aren't really allowed to have much personal stuff. Putting anything out on display quickly leads it to being stolen too. So.. just a cell.")

		saynn("Rahi is standing near her bed, looking at you.")

		saynn("[say=rahi]So.. you gonna.. help her?[/say]")

		saynn("[say=pc]I will, kitty. I will do my best.[/say]")

		saynn("She tilts her head down slightly.")

		saynn("[say=rahi]She trusts you.. Please, do what you think is right.. even if she doesn't agree..[/say]")

		saynn("Powerful words. From such a weak-looking kitty. The feline completely surrenders herself to you.")

		saynn("[say=pc]Even if you resist?[/say]")

		saynn("[say=rahi]Yes..[/say]")

		saynn("So. This is it. Time to order her to do something and see what happens.")

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
