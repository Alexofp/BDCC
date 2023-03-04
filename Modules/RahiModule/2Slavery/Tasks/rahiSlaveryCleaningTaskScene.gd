extends SceneBase

var chanceEasy = 0.0
var chanceMedium = 0.0
var chanceHard = 0.0
var success = false

func _init():
	sceneID = "rahiSlaveryCleaningTaskScene"

func _reactInit():
	chanceEasy = 45
	chanceMedium = 60
	chanceHard = 50

func _run():
	if(state == ""):
		addCharacter("rahi")
		saynn("Pick how hard you want the cleaning task to be for Rahi.")

		saynn("Easy: "+str(Util.roundF(chanceEasy, 1))+"%. Rahi cleans her cell")

		saynn("Medium: "+str(Util.roundF(chanceMedium, 1))+"%. Rahi cleans her cell with a blindfold")

		saynn("Hard: "+str(Util.roundF(chanceHard, 1))+"%. Rahi cleans her cell naked and tied up")

		addButton("Back", "Pick another task", "endthescene")
		addButton("Easy", "Rahi cleans her cell", "easy_clean")
	if(state == "easy_clean"):
		saynn("You order Rahi to clean her cell. You quickly explain what it involves.")

		if (success):
			saynn("The feline nods and proceeds to do what was ordered. She starts by making her bed. She puts the pillow and blanket away before fixing the top sheet, making it look nice and tucked up, no wrinkles. She makes sure there is no dirt or strange bodily fluids before putting the pillow back and fluffing it up. Then she carefully places the blanket on top.")

			saynn("[say=rahi]That should be good..[/say]")

			saynn("You nod and look away, letting kitty clean the rest of the cell.")

		else:
			saynn("The feline nods and proceeds to do what was ordered. She starts by making her bed. She puts the pillow and blanket away before fixing the top sheet. Well, trying to. Kitty almost gets tangled in it. She drops the pillow onto the floor by accident, letting it catch some dirt. And the blanket.. oof.. she just stuffed it into the corner after getting annoyed with it all.")

			saynn("[say=rahi]Ughhh-h..[/say]")

			saynn("You sigh and look away, letting kitty clean the rest of the cell.")

		addButton("Continue", "See what happens next", "after_easy")
	if(state == "after_easy"):
		if (success):
			saynn("After some time, you turn around and see that the cell.. looks pristine.. seemingly. Rahi stands still near her made bed and just waits for your verdict.")

			saynn("You proceed to slowly step around it, hands behind back, with a face of a restaurant critic. The floor.. looks clean.. The single chair that every single inmate is given is placed in the corner. You lean closer to the window's frame.. No dust there.")

			saynn("You approach Rahi and look at her bed. Yep, it's well made.")

			saynn("[say=pc]You succeeded. Good job.[/say]")

			saynn("Rahi nods subtly.")

		else:
			saynn("After some time, you turn around and see that the cell.. probably looks worse than before Rahi did anything. Rahi stands still near the disaster that looked like a bed before with her head tilted down.")

			saynn("Dust everywhere.. dirt too.. Is this a mineshaft or Rahi's cell?")

			saynn("You approach Rahi. She lowers her head even more, trying to look as little as possible.")

			saynn("[say=rahi]She failed.. she knows..[/say]")

			saynn("You nod and just proceed to redo her bed, showing how it should have been done.")

		addButton("Continue", "See what happens next", "stop_task")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "easy_clean"):
		if(RNG.chance(chanceEasy)):
			success = true

	if(_action == "after_easy"):
		processTime(20*60)

	if(_action == "stop_task"):
		endScene([success])
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["chanceEasy"] = chanceEasy
	data["chanceMedium"] = chanceMedium
	data["chanceHard"] = chanceHard
	data["success"] = success

	return data

func loadData(data):
	.loadData(data)

	chanceEasy = SAVE.loadVar(data, "chanceEasy", 0.0)
	chanceMedium = SAVE.loadVar(data, "chanceMedium", 0.0)
	chanceHard = SAVE.loadVar(data, "chanceHard", 0.0)
	success = SAVE.loadVar(data, "success", false)
