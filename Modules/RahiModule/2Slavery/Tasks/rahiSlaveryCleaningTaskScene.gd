extends SceneBase

var chanceEasy = 0.0
var chanceMedium = 0.0
var chanceHard = 0.0
var success = false

func _init():
	sceneID = "rahiSlaveryCleaningTaskScene"

func _reactInit():
	var rahiModule = getModule("RahiModule")
	chanceEasy = rahiModule.getSkillSuccessChance("rahiSkillLabor", 50, 95)
	chanceMedium = rahiModule.getSkillSuccessChance("rahiSkillLabor", 30, 75)
	chanceHard = rahiModule.getSkillSuccessChance("rahiSkillLabor", 2, 55)

func _run():
	if(state == ""):
		addCharacter("rahi")
		saynn("Pick how hard you want the cleaning task to be for Rahi.")

		saynn("Easy: "+str(Util.roundF(chanceEasy, 1))+"% chance. Rahi cleans her cell")

		saynn("Medium: "+str(Util.roundF(chanceMedium, 1))+"% chance. Rahi cleans her cell with a blindfold")

		saynn("Hard: "+str(Util.roundF(chanceHard, 1))+"% chance. Rahi cleans her cell naked and tied up")

		addButton("Back", "Pick another task", "endthescene")
		addButton("Easy", "Rahi cleans her cell", "easy_clean")
		addButton("Medium", "Rahi cleans her cell with a blindfold", "medium_clean")
		addButton("Hard", "Rahi cleans her cell naked and tied up", "hard_clean")
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
	if(state == "medium_clean"):
		saynn("You order Rahi to clean her cell. You explain that involves making the bed and dusting off as many surfaces as she can reach.")

		saynn("[say=pc]Let's make it harder for you.[/say]")

		saynn("Rahi raises her brow as you produce a simple piece of black cloth. You order the feline to turn away and then begin to wrap the piece of fabric around her head and over her eyes, blindfolding the kitty.")

		saynn("[say=rahi]But how is she gonna see..[/say]")

		saynn("[say=pc]Mhm. I will check on you later.[/say]")

		saynn("After that, you turn the kitty around again and tap on her shoulder before stepping out of the cell and looking through the reinforced window at what the feline is gonna do.")

		saynn("Rahi begins to turn around a lot, trying to orient herself in her cell. Having no visual feedback is obviously making it quite tricky. Kitty reaches her paws forward and just begins to slowly step in a random direction. Oops, that's a wall. And that's a corner. But that at least gives kitty something to go off.")

		saynn("She starts following the wall using her paws until finally reaching her bed. Success. Well, kinda. Kitty still has to fix it somehow. She starts by finding the pillow and puffing it up. Then she grabs the blanket and wraps it around herself so she can work on fixing the top sheet, all blindly.")

		saynn("You decide to let the kitty work and just turn away.")

		addButton("Continue", "See what happens next", "after_medium")
	if(state == "after_medium"):
		saynn("After quite some time, the busy feline noises finally seem to die down.")

		if (success):
			saynn("You turn around and see Rahi. She is standing roughly in the middle of her cell, her eyes still blindfolded. You step inside and begin slowly circling around. Kitty's ears track your position with surprising accuracy.")

			saynn("[say=pc]So, you think you succeeded?[/say]")

			saynn("[say=rahi]There is no way for her to know, {rahiMaster}..[/say]")

			saynn("You look around. The bed.. seems to be mostly well-made. Yeah, the blanket is tilted slightly and the pillow is hanging off the side but effort clearly went into making it as good as Rahi can. As for the dust.. Hm.. You drag your finger over the window and try to catch some. But there is none. That's nice.")

			saynn("You stand behind Rahi and untie the blindfold, letting her see. The feline blinks a few times quickly. She sees the bed that is clearly not perfect and prepares for the worst.")

			saynn("[say=pc]I think I can call it a success, kitty.[/say]")

			saynn("[say=rahi]Oh.. thank you, she didn't cheat..[/say]")

		else:
			saynn("You turn around and see Rahi sitting on the floor. The cell seems to be cleaned pretty well, even the bed. But Rahi is not blindfolded, she has her head lowered. You step inside and get the kitty a strict glance.")

			saynn("[say=rahi]The blindfold has fallen.. no, that's a lie..[/say]")

			saynn("She is trying to talk herself out of it? Your eyes become meaner, drilling through the sad kitty.")

			saynn("[say=rahi]She couldn't do it, {rahiMaster}.. At least she cleaned everything?..[/say]")

			saynn("Yeah she did, you drag the finger on the glass surface and are unable to pick up any dust. But cleaning the cell is not why you gave her that task.")

			saynn("[say=pc]You still failed, kitty.[/say]")

			saynn("You hear sad noises.")

		addButton("Continue", "See what happens next", "stop_task")
	if(state == "hard_clean"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={naked=true}})
		saynn("You order Rahi to clean her cell. You explain that involves making the bed and dusting off as many surfaces as she can reach. But today you feel particularly strict.")

		saynn("[say=pc]Let's see what you can do in a very tough situation. I want you to undress.[/say]")

		saynn("[say=rahi]Meow?..[/say]")

		saynn("You don't order her twice so kitty doesn't ask again too. She begins to slowly unbutton her shirt while you prepare some bindings for her. Mostly ropes but also a simple piece of black cloth that you can use as a blindfold.")

		saynn("The feline undresses completely before presenting herself. There is a reinforced window that looks out into the general block with some inmates occasionally passing by so kitty covers her private bits, especially her {rahi.breasts} and her crotch.")

		saynn("You start by putting a blindfold around her eyes and trying it behind her head. Then you crouch near her and start using ropes to tie her ankles together, limiting the possible motions by harsh degree. You slowly go up, tying more ropes around the girl's body and chest, making sure to do extra loops below and above her breasts, emphasizing them. As you tighten the ropes, one of them digs into Rahi's sensitive pussy, causing her to moan softly. You use the remaining rope to tie the girl's paws behind her back, rendering them useless for this task.")

		saynn("Here it is, a blindfolded tied up kitty. How is she gonna clean the cell like this? Well, that's not your problem now.")

		saynn("[say=rahi]How is she gonna..[/say]")

		saynn("[say=pc]Good luck.[/say]")

		saynn("You step out of the cell, letting the feline work.")

		saynn("The naked kitty seems to be quite lost at first. Her ears are turning a lot, trying to catch any useful noise. In the end, she just decides to start hopping into a random direction. The way she moves looks funny, like a cute bunny. Her exposed breasts bounce up and down a lot but she can't cover herself even if she wanted to. Quiet noises escape from Rahi. Eventually kitty hits one of the walls with her muzzle and begins following it until she finds the bed.")

		saynn("Now is clearly the hardest part. How is the kitty gonna do anything you wonder. She starts by dropping down to her knees and feeling where the bed is with her blindfolded head. She finds the pillow and puffs it up the best way she can, by bonking her head against it from different sides. Oh wow, is she using her teeth to move the blanket around? Smart.")

		saynn("You notice that the girl is quite.. aroused. The rope that is digging into her crotch area constantly shifts back and forth while the feline moves around, making her wet down there. Well, you decide to check on her later.")

		addButton("Continue", "See what happens next", "after_hard")
	if(state == "after_hard"):
		saynn("After quite some time, you return and look inside Rahi's cell.")

		if (success):
			saynn("Kitty is finishing up her work. She seems to be using her fluffy tail as a feather duster, dusting off the window and metal walls. Kinda cute. And wow, the bed seems to be well-made. Well, as much as a tied up person can make it. The feline seems to be huffing and moaning sometimes, clearly battling her desires.")

			saynn("You step inside and stop the kitty. She lets out a meow of surprise.")

			saynn("[say=rahi]Did she fail, {rahiMaster}?.. huff..[/say]")

			saynn("[say=pc]No. You did pretty well in fact. Good job.[/say]")

			saynn("The feline begins to purr as you untie her and remove the blindfold. The ropes have left a few trails on her short fur. She is still naked though so she covers herself when she can. You can notice her paw rubbing herself down there.")

		else:
			saynn("Kitty is sitting on the floor, squirming and arching her back. Seems like all the ropes have made her succumb to the mix of pleasure and discomfort, poor kitty is dripping arousal so much that there is a visible wet spot under her.")

			saynn("You step inside and look around. The bed is half-made and the dust wasn't touched at all.")

			saynn("[say=pc]Seems like you failed, kitty.[/say]")

			saynn("You only hear huffing and moaning coming from her.")

		addButton("Continue", "See what happens next", "stop_task")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "easy_clean"):
		if(RNG.chance(chanceEasy)):
			success = true
			getModule("RahiModule").advanceSkill("rahiSkillLabor", 5)

	if(_action == "medium_clean"):
		if(RNG.chance(chanceMedium)):
			success = true
			getModule("RahiModule").advanceSkill("rahiSkillLabor", 10)
		getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("blindfold"))

	if(_action == "hard_clean"):
		if(RNG.chance(chanceHard)):
			success = true
			getModule("RahiModule").advanceSkill("rahiSkillLabor")
		getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("blindfold"))
		getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("ZiptiesWrist"))
		getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("ZiptiesAnkle"))
		getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("ropeharness"))

	if(_action == "after_easy"):
		processTime(20*60)

	if(_action == "stop_task"):
		getCharacter("rahi").resetEquipment()
		endScene([success])
		return

	if(_action == "after_medium"):
		getCharacter("rahi").resetEquipment()
		processTime(40*60)

	if(_action == "after_hard"):
		processTime(50*60)

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
