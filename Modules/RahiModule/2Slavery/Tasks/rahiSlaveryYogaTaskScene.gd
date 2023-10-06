extends SceneBase

var chanceEasy = 0.0
var chanceMedium = 0.0
var chanceHard = 0.0
var success = false

func _init():
	sceneID = "rahiSlaveryYogaTaskScene"

func _reactInit():
	var rahiModule = getModule("RahiModule")
	chanceEasy = rahiModule.getSkillSuccessChance("rahiSkillExhibit", 50, 95)
	chanceMedium = rahiModule.getSkillSuccessChance("rahiSkillExhibit", 30, 75)
	chanceHard = rahiModule.getSkillSuccessChance("rahiSkillExhibit", 2, 55)

func _run():
	if(state == ""):
		addCharacter("rahi")
		saynn("Pick how hard you want the yoga task to be for Rahi.")

		saynn("Easy: "+str(Util.roundF(chanceEasy, 1))+"% chance. Rahi does some simple yoga poses")

		saynn("Medium: "+str(Util.roundF(chanceMedium, 1))+"% chance. Rahi does yoga naked")

		saynn("Hard: "+str(Util.roundF(chanceHard, 1))+"% chance. Rahi does yoga naked and with toys")

		addButton("Back", "Pick another task", "endthescene")
		addButton("Easy", "Rahi does some simple yoga poses", "easy_task")
		addButton("Medium", "Rahi does yoga naked", "medium_task")
		addButton("Hard", "Rahi does yoga naked and with toys", "hard_task")
	if(state == "easy_task"):
		playAnimation(StageScene.Solo, "struggle", {pc="rahi"})
		saynn("You tell Rahi to do some yoga poses for relaxation. She agrees to give it a try.")

		saynn("Rahi starts her yoga practice with some simple stretches, reaching up high and then bending down to touch her toes. She makes sure to focus on her breathing.")

		addButton("Continue", "See what happens next", "easy_outcome")
	if(state == "easy_outcome"):
		playAnimation(StageScene.Yoga, "catcow", {pc="rahi"})
		saynn("After the simple stretches, Rahi gets on all fours and starts doing some cat-cow poses, arching her back like a cat and then rounding it like a cow. Quite cute and fitting for a kitty like Rahi.")

		if (success):
			saynn("After some time, Rahi completes her entire yoga routine, now feeling more relaxed and confident.")

			saynn("Rahi succeeded!")

		else:
			saynn("Unfortunately, Rahi spots your gaze directed at her and starts blushing. The embarrassment causes kitty to put her paw in the wrong spot and collapse.")

			saynn("Rahi fails her task.")

			saynn("[say=rahi]{rahiFP('I', 'She')} couldn't even do the simplest ones.. sorry..[/say]")

		addButton("Continue", "See what happens next", "stop_task")
	if(state == "medium_task"):
		playAnimation(StageScene.Solo, "struggle", {pc="rahi", bodyState={naked=true}})
		saynn("You tell Rahi to do some yoga poses for relaxation. She agrees to give it a try. The catch is that she must do it naked.")

		saynn("Kitty takes off her clothes and hands them to you.")

		saynn("Rahi starts her yoga practice with some simple stretches, reaching up high and then bending down to touch her toes. While she does that, you walk around her and watch her body in all these compromising positions. She tries not to think about you staring at her private bits and instead focuses on her breathing.")

		addButton("Continue", "See what happens next", "medium_outcome")
	if(state == "medium_outcome"):
		playAnimation(StageScene.Yoga, "camel", {pc="rahi", bodyState={naked=true}})
		saynn("After the simple stretches, Rahi gets on her knees before you. She makes sure to keep her shins flat on the floor while she leans back, arching her spine as far as possible and keeping her paws on her ankles, using them for support.")

		saynn("[say=rahi]A camel pose..[/say]")

		saynn("In this pose Rahi is completely exposed to you.. Her {rahi.breasts}, fluffy belly, tight little pussy slit, everything is on display.")

		if (success):
			saynn("She knows that you're staring at her but she does her best not to let that information cloud her mind. Rahi successfully goes through her whole routine naked.")

			saynn("Rahi succeeded!")

		else:
			saynn("She suddenly realizes how lewd this probably looks from your point of view and gets very shy. Rahi tries to cover herself with her tail but loses balance during that, breaking the pose and collapsing.")

			saynn("[say=rahi]It's hard when someone is staring..[/say]")

			saynn("Rahi failed her task.")

		addButton("Continue", "See what happens next", "stop_task")
	if(state == "hard_task"):
		playAnimation(StageScene.Solo, "struggle", {pc="rahi", bodyState={naked=true}})
		saynn("You tell Rahi to do some yoga poses for relaxation. But the big catch is that kitty must do it naked and while having buzzing toys on her. She reluctantly agrees to give it a try.")

		saynn("She hands you her clothes and stands in the middle of her cell. You grab a few pink bullet vibrators and slip two down Rahi's pussy slit before taping the last one to her clit. Rahi is already blushing.")

		saynn("Rahi starts her usual yoga practice, just some simple stretches, reaching up high and then bending down to touch her toes. While she does that, you turn on all the toys to their lowest setting, causing kitty to suddenly produce a noise of pleasure. The toys buzz against her sensitive spots, making focusing incredibly hard. But Rahi does her best to think about her actions and breathing.")

		addButton("Continue", "See what happens next", "hard_outcome")
	if(state == "hard_outcome"):
		playAnimation(StageScene.Hogtied, "idle", {pc="rahi", bodyState={naked=true}})
		saynn("After the warm up stretches, Rahi slowly lies on her stomach and reaches back with her paws to grab her ankles. She then tries to lift her chest and legs off the ground, bending her body into a bow shape.")

		saynn("The hardest part here is holding that pose for a lengthy amount of time. You make it harder by changing the setting on the toys, causing them to buzz louder against Rahi's pussy. She bites her lip and moans quietly, her slit dripping juices onto the floor while she tries to hold the pose the best she can.")

		if (success):
			saynn("She is fighting against the very pleasurable sensations. Her pussy twitching slightly and leaking more juices but Rahi stays still, just letting the toys vibrate inside her. She is breathing very deeply, her eyes lustful.")

			saynn("In the end, Rahi manages to stay like this for a few minutes without cumming! Rahi succeeded!")

		else:
			saynn("Unfortunately, the pleasure was too much for the poor kitty. She moans and pants heavily until a powerful orgasm suddenly washes over her. Rahi squirms and breaks her pose, letting go of her shaking legs. Her overstimulated pussy squirts girlcum all over her thighs, leaving quite a mess.")

			saynn("Blushy kitty looks up at you with her sorry eyes.")

			saynn("[say=rahi]It was too much for {rahiFP('me', 'her')}. Sorry..[/say]")

			saynn("Rahi failed her task.")

		addButton("Continue", "See what happens next", "stop_task")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "easy_task"):
		if(RNG.chance(chanceEasy)):
			success = true
		getModule("RahiModule").advanceSkill("rahiSkillExhibit", 5)

	if(_action == "medium_task"):
		if(RNG.chance(chanceMedium)):
			success = true
			getModule("RahiModule").advanceSkill("rahiSkillExhibit", 10)
		#getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("blindfold"))

	if(_action == "hard_task"):
		if(RNG.chance(chanceHard)):
			success = true
			getModule("RahiModule").advanceSkill("rahiSkillExhibit")

	if(_action == "easy_outcome"):
		processTime(5*60)

	if(_action == "stop_task"):
		getCharacter("rahi").resetEquipment()
		endScene([success])
		return

	if(_action == "medium_outcome"):
		processTime(5*60)

	if(_action == "hard_outcome"):
		processTime(5*60)

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
