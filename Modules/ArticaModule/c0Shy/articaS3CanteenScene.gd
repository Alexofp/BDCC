extends SceneBase

var gaveApple = false

func _init():
	sceneID = "articaS3CanteenScene"

func _run():
	if(state == ""):
		addCharacter("artica")
		playAnimation(StageScene.Solo, "sit", {pc="artica"})
		saynn("You look around the canteen.. and notice a familiar white fluff sitting alone on a bench near one of the corners, staring at her food tray.")

		saynn("You get in line and receive your own tray.. filled with the gray tasteless paste. Yummy..")

		saynn("Might as well join her and see what's up.")

		addButton("Sit near", "Sit near the white fluff", "walk_up_scare")
	if(state == "walk_up_scare"):
		playAnimation(StageScene.Duo, "stand", {npc="artica", npcAction="sit"})
		saynn("You walk up to that lilac's table, still holding the tray.")

		saynn("[say=pc]Mind if I?[/say]")

		saynn("Hearing that, the girl jumps! She quickly pulls her paws from under the table and looks at you with big cyan eyes while blinking frantically.")

		saynn("[say=artica]Eep! Ah! Oh.. Um.. m..[/say]")

		saynn("She closes her legs, tucks her tail under butt and lowers her gaze, trying to occupy as little space as possible.")

		saynn("[say=artica]Mm.. um.. I..[/say]")

		saynn("Your sudden words really startled her, it seems.")

		saynn("[say=pc]Relax. Just wondering if I can eat at this table.[/say]")

		saynn("[say=artica]Oh.. s-sure..[/say]")

		saynn("The girl shakes her head.. but then nods twice as much.")

		saynn("So unsure this girl is. Maybe she is just still in shock after suddenly ending up in one of the most strict and secure prisons.")

		addButton("Sit", "Take a seat", "sit_near")
	if(state == "sit_near"):
		playAnimation(StageScene.Duo, "sit", {npc="artica", npcAction="sit"})
		saynn("You sit on a bench opposite of hers, just so you don't startle the poor girl even more.")

		saynn("Plastic utensil in hand, you begin consuming the prison treat. The girl keeps her gaze low, doing the same, eating.. just at a much slower pace.")

		saynn("Might as well be a little polite.")

		if (GM.pc.getInmateType() == InmateType.HighSec):
			saynn("[say=pc]Name is {pc.name}. Don't worry about the red, I won't bite you now.[/say]")

		elif (GM.pc.getInmateType() == InmateType.SexDeviant):
			saynn("[say=pc]Name is {pc.name}. You're a lilac, just like me.[/say]")

		else:
			saynn("[say=pc]Name is {pc.name}. Orange colors means I'm harmless.[/say]")

		saynn("Her ears perk at your words. The girl blinks a few more times in a row, fidgeting while sitting on her tail.")

		saynn("[say=artica]Hi.. umm.. m..[/say]")

		saynn("No wonder you couldn't hear her talking with that big ass cat the other day.")

		addButton("So shy", "Tell the girl that she acting quite shy for a lilac", "say_shy")
		addButton("Food sucks?", "Ask why is she eating so slowly", "say_foodsucks")
	if(state == "say_shy"):
		saynn("[say=pc]You seem quite shy, for a lilac especially.[/say]")

		saynn("The girl rubs her nose. As you are sitting opposite of her, you notice her spreading her toes wide each time you get her attention. It's kinda.. cute.")

		saynn("[say=artica]..j-just.. trying to.. stay quiet.[/say]")

		saynn("Poor fluff clearly scared. Might as well reassure her a little bit.")

		saynn("[say=pc]Whatever you heard from others, it's not that bad. You get used to it.[/say]")

		saynn("She looks up at you.. and offers you a subtle smile.")

		saynn("[say=artica]M-mm.. mhm.. um..[/say]")

		saynn("She continues to nom the paste at a fairly slow pace.")

		addButton("Lilacs are sluts", "Remind the girl of the colors that she is wearing", "say_lilacssluts")
		addButton("Food sucks?", "Ask why is she eating so slowly", "say_foodsucks")
		addButton("Enough chat", "Time to move on", "enough_chat")
	if(state == "say_lilacssluts"):
		saynn("[say=pc]All the lilacs are sluts. Just so you know.[/say]")

		saynn("The girl's cheeks start glowing red as you say that. She sways from side to side on the bench, struggling to stay still. You can just feel her heart racing now.. but even that didn't seem to make her snap out of her shy state.")

		saynn("[say=artica]Um.. m.. m.m.. sluts?..[/say]")

		saynn("You continue to casually eat the paste with a smug expression.")

		saynn("[say=pc]Yeah, just stating the facts. You might become someone's sex toy.[/say]")

		saynn("Your gazes collide. You smile while the girl only blushes even more deeply.")

		saynn("[say=pc]Not the worst thing that could happen to someone here.[/say]")

		saynn("She shakes her head a little.. and then nods a bunch.. before lowering her head and focussing on nomming her food.")

		addButton("Food sucks?", "Ask why is she eating so slowly", "say_foodsucks")
		addButton("Enough chat", "Time to move on", "enough_chat")
	if(state == "say_foodsucks"):
		saynn("[say=pc]Don't like the food?[/say]")

		saynn("She shrugs.")

		saynn("[say=artica]It's.. oki..[/say]")

		saynn("[say=pc]Don't have to be insincere with me, I'm eating the same crap. And I know that it's crap.[/say]")

		if (!gaveApple):
			saynn("The girl tilts her head a bit, occasionally still getting some more paste into her mouth.")

		else:
			saynn("The girl tilts her head a bit, focussing on biting into the apple that you gave her.")

		addButton("So shy", "Tell the girl that she acting quite shy for a lilac", "say_shy")
		addButton("Enough chat", "Time to move on", "enough_chat")
		if (!gaveApple):
			if (GM.pc.getInventory().hasItemID("appleitem")):
				addButton("Give apple", "Give the girl one of your apples", "do_give_apple")
			else:
				addDisabledButton("Give apple", "You don't have any apples")
	if(state == "do_give_apple"):
		saynn("Your hand produces a little treat and quickly rubs it squeaky-clean against your wrist before offering it to the girl.")

		saynn("[say=pc]Nom this. It's not exactly a lot of protein.. but at least it has a taste.[/say]")

		saynn("The fluff is reluctant.. so you basically put the apple into her paw.")

		saynn("[say=artica]..t-thank.. k.. ks..[/say]")

		saynn("[say=pc]Don't mention it.[/say]")

		saynn("She brings the treat to her maw.. bites it.. and then chrrrs as the juice hits her tongue.")

		saynn("Can't let the poor girl starve.")

		addButton("So shy", "Tell the girl that she acting quite shy for a lilac", "say_shy")
		addButton("Enough chat", "Time to move on", "enough_chat")
	if(state == "enough_chat"):
		playAnimation(StageScene.Duo, "stand", {npc="artica", npcAction="sit"})
		saynn("You finish your meal, feeling slightly less tired than before.. which is the best thing you could hope for.")

		saynn("[say=pc]Well, see you around.[/say]")

		saynn("You get up and bring the tray to the right window.")

		saynn("As you walk past the girl, you hear her quiet shy voice.")

		saynn("[say=artica]..Artica..[/say]")

		saynn("[say=pc]Huh?[/say]")

		saynn("You stop for a second.")

		saynn("[say=artica]..n..name is..[/say]")

		addButton("Nice name", "Comment on her name", "say_nicename")
		addButton("Forget it", "Tell Artica that she might as well forget it", "say_canforget")
	if(state == "say_nicename"):
		saynn("[say=pc]Artica? Has a nice ring to it.[/say]")

		saynn("[say=artica]..t-thanks..[/say]")

		saynn("Probably better to give Artica a day to rest and get used to her new life. Hard to say what's going on in her head right now.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "say_canforget"):
		saynn("[say=pc]You might as well forget it. Inmates here only have a number.[/say]")

		saynn("Artica nods subtly and lowers her gaze.")

		saynn("[say=pc]Don't be sad. You will also be called all sorts of cool names. Depends on how you act.[/say]")

		saynn("[say=artica]..ok-k.. t-thanks..[/say]")

		saynn("Probably better to give Artica a day to rest and get used to her new life. Hard to say what's going on in her head right now.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "walk_up_scare"):
		processTime(60*2)

	if(_action == "sit_near"):
		processTime(3*60)

	if(_action == "enough_chat"):
		processTime(10*60)
		GM.pc.addPain(-50)
		GM.pc.addStamina(50)

	if(_action == "do_give_apple"):
		GM.pc.getInventory().removeXOfOrDestroy("appleitem", 1)
		gaveApple = true

	setState(_action)

func saveData():
	var data = .saveData()

	data["gaveApple"] = gaveApple

	return data

func loadData(data):
	.loadData(data)

	gaveApple = SAVE.loadVar(data, "gaveApple", false)
