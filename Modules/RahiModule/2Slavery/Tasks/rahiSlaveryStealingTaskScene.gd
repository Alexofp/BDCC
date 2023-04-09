extends SceneBase

var chanceEasy = 0.0
var chanceMedium = 0.0
var chanceHard = 0.0
var success = false

func _init():
	sceneID = "rahiSlaveryStealingTaskScene"

func _reactInit():
	var rahiModule = getModule("RahiModule")
	chanceEasy = rahiModule.getSkillSuccessChance("rahiSkillLabor", 60, 95)
	chanceMedium = rahiModule.getSkillSuccessChance("rahiSkillLabor", 10, 75)
	chanceHard = rahiModule.getSkillSuccessChance("rahiSkillLabor", 2, 55)

func _run():
	if(state == ""):
		addCharacter("rahi")
		saynn("Pick how hard you want the stealing task to be for Rahi.")

		saynn("Easy: "+str(Util.roundF(chanceEasy, 1))+"% chance. Rahi will try to steal an apple from the green houses.")

		saynn("Medium: "+str(Util.roundF(chanceMedium, 1))+"% chance. Rahi will try to steal something from the medical wing.")

		saynn("Hard: "+str(Util.roundF(chanceHard, 1))+"% chance. Rahi will try to steal credits from inmates")

		addButton("Back", "Pick another task", "endthescene")
		addButton("Easy", "Rahi will try to steal an apple from the green houses", "easy_steal")
		addButton("Medium", "Rahi will try to steal something from the medical wing", "medium_steal")
		addButton("Hard", "Rahi will try to steal credits from inmates", "hard_steal")
	if(state == "easy_steal"):
		saynn("You order Rahi to go to the greenhouses and steal an apple for you.")

		saynn("She nods and steps out of the cell to do her task.")

		addButton("Continue", "See what happens next", "easy_outcome")
	if(state == "easy_outcome"):
		if (success):
			saynn("After some time Rahi returns and brings you the forbidden fruit!")

			saynn("[say=rahi]Here you go, {rahiMaster}.. No one saw her![/say]")

			saynn("You grab the apple and rub it clean against her fur.")

			saynn("[say=pc]Good job.[/say]")

		else:
			playAnimation(StageScene.Duo, "stand", {npc="rahi"})
			saynn("After some time Rahi returns. But instead of an apple, she is carrying a full list of restraints on her.")

			saynn("[say=rahi]She got spotted.. many times.. Sorry, {rahiMaster}, she couldn't do it..[/say]")

			saynn("Well, Rahi failed her task. You wonder if you should even begin to untie her.")

		addButton("Continue", "See what happens next", "stop_task")
	if(state == "medium_steal"):
		saynn("You order Rahi to slip into the medical wing storage and steal something from it.")

		saynn("She nods and steps out of the cell to do her task.")

		addButton("Continue", "See what happens next", "medium_outcome")
	if(state == "medium_outcome"):
		if (success):
			saynn("After some time Rahi returns and brings you an item that she stole!")

			saynn("[say=rahi]Here you go, {rahiMaster}.. Not a single nurse saw her![/say]")

			saynn("You grab what she brought you and nod to her.")

			saynn("[say=pc]Good job.[/say]")

		else:
			saynn("After some time Rahi returns. But instead of bringing a useful item, she steps into the room wearing a straitjacket and looking.. quite lusty.")

			saynn("[say=rahi]She got spotted.. They.. injected her with something.. Sorry, {rahiMaster}, she couldn't do it..[/say]")

			saynn("Well, Rahi failed her task. You wonder if you should even begin to free her.")

		addButton("Continue", "See what happens next", "stop_task")
	if(state == "hard_steal"):
		saynn("You order Rahi to steal some credits from the inmates.")

		saynn("She nods and steps out of the cell to do her task.")

		addButton("Continue", "See what happens next", "hard_outcome")
	if(state == "hard_outcome"):
		if (success):
			saynn("After some time Rahi returns and brings you a chip with some credits!")

			saynn("[say=rahi]Here you go, {rahiMaster}.. They won't know it was her![/say]")

			saynn("You grab the chip and insert it into your collar, transferring the credits to your inmate account.")

			saynn("[say=pc]Good job.[/say]")

		else:
			saynn("Rahi returns but instead of carrying credits, she looks all roughed up. Seems like someone wrote humiliating things on her fur.")

			saynn("[say=rahi]They caught her stealing.. She couldn't escape..[/say]")

			saynn("Well, Rahi failed her task.")

		addButton("Continue", "See what happens next", "stop_task")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "easy_steal"):
		if(RNG.chance(chanceEasy)):
			success = true
			getModule("RahiModule").advanceSkill("rahiSkillLabor", 10)

	if(_action == "medium_steal"):
		if(RNG.chance(chanceMedium)):
			success = true
			getModule("RahiModule").advanceSkill("rahiSkillLabor")

	if(_action == "hard_steal"):
		if(RNG.chance(chanceHard)):
			success = true
			getModule("RahiModule").advanceSkill("rahiSkillLabor")

	if(_action == "easy_outcome"):
		processTime(30*60)
		if(!success):
			var rahi = getCharacter("rahi")
			rahi.getInventory().equipItem(GlobalRegistry.createItem("blindfold"))
			rahi.getInventory().equipItem(GlobalRegistry.createItem("inmatewristcuffs"))
			rahi.getInventory().equipItem(GlobalRegistry.createItem("inmateanklecuffs"))
			rahi.getInventory().equipItem(GlobalRegistry.createItem("ropeharness"))
			rahi.getInventory().equipItem(GlobalRegistry.createItem("ballgag"))
			rahi.getInventory().equipItem(GlobalRegistry.createItem("bondagemittens"))
		else:
			GM.pc.getInventory().addItem(GlobalRegistry.createItem("appleitem"))
			addMessage("You receive an apple")

	if(_action == "stop_task"):
		getCharacter("rahi").resetEquipment()
		endScene([success])
		return

	if(_action == "medium_outcome"):
		processTime(30*60)
		if(!success):
			var rahi = getCharacter("rahi")
			rahi.forceIntoHeat()
			rahi.getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("LatexStraitjacket"))
		else:
			var possibleItems = [
			["painkillers", "painkillers"],
			["a single pregnancy test", "PregnancyTest"],
			["an energy drink", "EnergyDrink"],
			["a heat pill", "HeatPill"],
			["a tube of lube", "lube"],
			["a single condom", "QualityCondom"],
			["a restraint key", "restraintkey"],
			["a birth control pill", "BirthControlPill"],
			["an anaphrodisiac pill", "AnaphrodisiacPill"],
			["a breeder pill", "BreederPill"],
			]
			var randomItem = RNG.pick(possibleItems)
			GM.pc.getInventory().addItem(GlobalRegistry.createItem(randomItem[1]))
			addMessage("You receive "+str(randomItem[0]))

	if(_action == "hard_outcome"):
		processTime(30*60)
		if(!success):
			var rahi = getCharacter("rahi")
			for _i in range(5):
				var zone = BodyWritingsZone.getRandomZone()
				rahi.addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone))
		else:
			var creditAmount = RNG.randi_range(2, 5)
			addMessage("You receive "+str(creditAmount)+" credits!")
			GM.pc.addCredits(creditAmount)

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
