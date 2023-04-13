extends SceneBase

var success = false

func _init():
	sceneID = "rahiTaskCommentingScene"

func _reactInit():
	success = getFlag("RahiModule.rahiTaskSuceeded", false)

func _run():
	if(state == ""):
		addCharacter("rahi")
		saynn("Rahi stands still, waiting for something. Until curiosity makes her ask you a question first.")

		saynn("[say=rahi]"+RNG.pick([
			"So.. how did she do today?..",
			"So.. how was her performance today, {rahiMaster}?..",
			"What do you think about her task, {rahiMaster}?..",
		])+"[/say]")

		addButton(RNG.pick(["Great", "Good", "Good job", "Amazing"]), "Say that you loved her performance today", "say_great")
		addButton(RNG.pick(["Could be better", "Meh", "Okay-ish", "Needs improvement"]), "Rahi could have tried better", "say_meh")
		addButton(RNG.pick(["Bad", "Pathetic", "Awful", "Terrible"]), "Rahi did awful", "say_bad")
	if(state == "say_great"):
		saynn("[say=pc]You were great today, kitty. Keep this up.[/say]")

		if (success):
			saynn("Kitty smiles and purrs contently.")

			saynn("[say=rahi]Yay.[/say]")

		else:
			saynn("Kitty tilts her head slightly, she looks surprised.")

			saynn("[say=rahi]Oh?.. She did try her best, yes..[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "say_meh"):
		saynn("[say=pc]You could have done better, not gonna lie.[/say]")

		if (success):
			saynn("Kitty tilts her head down. You can see her cheeks inflating slightly.")

			saynn("[say=rahi]But.. But.. Sorry, {rahiMaster}.. You're right..[/say]")

		else:
			saynn("Kitty tilts her head down.")

			saynn("[say=rahi]Sorry, {rahiMaster}.. She will try harder next time..[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "say_bad"):
		saynn("[say=pc]That was just awful, kitty. Any other slave could have done it better.[/say]")

		if (success):
			saynn("Kitty tilts her head a lot, she clearly doesn't understand something.")

			saynn("[say=rahi]But.. But.. {rahiMaster}.. That's unfair..[/say]")

		else:
			saynn("Kitty tilts her head down, her ears droop, her tail rubs between her thighs.")

			saynn("[say=rahi]Sorry, {rahiMaster}.. Your slave is very sorry for failing..[/say]")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "say_great"):
		if(success):
			increaseFlag("RahiModule.rahiAffection", 2)
			increaseFlag("RahiModule.rahiObedience", 0)
		else:
			increaseFlag("RahiModule.rahiAffection", 3)
			increaseFlag("RahiModule.rahiObedience", -3)

	if(_action == "say_meh"):
		if(success):
			increaseFlag("RahiModule.rahiAffection", -2)
			increaseFlag("RahiModule.rahiObedience", -2)
		else:
			increaseFlag("RahiModule.rahiAffection", -1)
			increaseFlag("RahiModule.rahiObedience", 3)

	if(_action == "say_bad"):
		if(success):
			increaseFlag("RahiModule.rahiAffection", -2)
			increaseFlag("RahiModule.rahiObedience", -4)
		else:
			increaseFlag("RahiModule.rahiAffection", 0)
			increaseFlag("RahiModule.rahiObedience", 2)

	setState(_action)

func saveData():
	var data = .saveData()

	data["success"] = success

	return data

func loadData(data):
	.loadData(data)

	success = SAVE.loadVar(data, "success", false)
