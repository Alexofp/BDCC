extends SceneBase

var isFirst = true
var amountCollected = 0.0

func _init():
	sceneID = "ElizaMilkingBreastsHandScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		if (isFirst):
			saynn("The feline seems to be filling out some reports, barely paying any attention now.")

			saynn("[say=pc]Hey.. uhh.. I want to donate my breast milk.[/say]")

			saynn("She doesn't even raise her eyes.")

			saynn("[say=eliza]Alright, do you have it on you?[/say]")

			saynn("You tilt your head slightly, unsure what to say.")

			saynn("[say=eliza]The fluid container, can I have it?[/say]")

			saynn("You scratch behind your head.")

			saynn("[say=pc]Well, it's in my breasts.[/say]")

			saynn("Eliza finally pulls her gaze away and looks at your chest. Then it hits her.")

			saynn("[say=eliza]OHHH. You wanna be milked![/say]")

			saynn("Everyone in the room looks at you.. awkward..")

			saynn("[say=eliza]Sorry. Yeah, you came to the right place~. Follow me, inmate. I'm a professional, don't worry.[/say]")

		else:
			saynn("You ask Eliza to be milked. She nods and asks you to follow her..")

		addButton("Follow", "See where she will bring you", "in_heaven")
	if(state == "in_heaven"):
		aimCameraAndSetLocName("med_milkingroom")
		playAnimation(StageScene.Grope, "tease", {pc="pc", npc="eliza", milkTank=true, bodyState={exposedChest=true}})
		saynn("Doctor brings you into a special room. It seems to have pipes going across its ceiling that connect massive fluid tanks to the stalls.")

		saynn("Eliza picks the stall that doesn't have any equipment in it.. just a small empty milk tank.")

		saynn("[say=eliza]I will need access to your.. you know.[/say]")

		saynn("You expose your {pc.breasts}, as ordered by the feline.")

		saynn("Eliza quickly brings some kind of soft cushion and places it in front of the fluid container. She then gestures for you to kneel on it.")

		addButton("Kneel", "Might as well", "do_kneel")
	if(state == "do_kneel"):
		playAnimation(StageScene.BreastGroping, "tease", {pc="eliza", npc="pc", milkTank=true, npcBodyState={exposedChest=true}})
		saynn("You obey, positioning yourself on that soft cushion and lowering yourself to your knees. For some reason you feel.. excitement.. growing inside you. Your nips stiffen slightly as you look at the milk tank in front of you.. its lid is off..")

		saynn("[say=eliza]Let's proceed, try not to squirm too much. Just so we don't waste it.[/say]")

		saynn("The feline kneels behind you. She reaches out and, with delicate precision, cups your breasts with her skilled hands. Her touch is both commanding.. and tender.. her clawed digits exploring the softness of your curves..")

		addButton("Continue", "See what happens next", "do_milk")
	if(state == "do_milk"):
		playAnimation(StageScene.BreastGroping, "grope", {pc="eliza", npc="pc", milkTank=true, npcBodyState={exposedChest=true, hard=true}})
		saynn("The doctor starts the process slowly, her touch light at first.. just a gentle, rhythmic compression of your soft mounds. Your nipples harden fully from her caresses.. an occasional pinch sends a shudder through your body. The coolness of the air dances along your sensitive flesh as her hands work methodically..")

		saynn("And soon.. you feel the first few droplets of {pc.milk} emerging from your breasts.. hanging from the nips for a few seconds.. before falling into the milking tank.. the sight makes your heartbeat a little faster.")

		saynn("After that, her paws begin to knead your breasts more firmly.. applying steady pressure and precise, teasing pinches on your stiff nips. You feel a rush of warmth and tingling pleasure spread through you as the droplets increase in numbers.. creating a small flow.. of your {pc.milk}..")

		saynn("Each squeeze of her palms extracts more of your creamy secretion. It feels good.. your lips slightly parted.. panting softly.. while this doctor keeps milking you.")

		saynn("[say=eliza]Feels nice, eh~?[/say]")

		saynn("[say=pc]Y-yes..[/say]")

		saynn("The noise of your deep breathing mingles with the sounds of {pc.milk} droplets joining the rest.. the level in that milk tank slowly rising. Eliza's paws seem to work tirelessly.. kneading your {pc.breasts} in ways that keep the flow steady..")

		saynn("Time seems to stretch.. Your eyes close as you focus on the pleasurable sensations..")

		saynn("Eventually, the flow of your {pc.milk} begins to subside.. Eliza's rhythmic kneading slows down.. switching to gentle caressing.")

		addButton("Continue", "See what happens next", "do_milk_process")
	if(state == "do_milk_process"):
		playAnimation(StageScene.BreastGroping, "tease", {pc="eliza", npc="pc", milkTank=true, npcBodyState={exposedChest=true, hard=true}})
		GM.pc.setLocation("med_nearmilking")
		saynn("She carefully releases your breasts, after ensuring that the last traces of your {pc.milk} got captured in the reservoir before you.")

		saynn("[say=eliza]Thank you for donating your milk. You were incredible.[/say]")

		saynn("The genuine warmth in her tone washes over you.")

		saynn("[say=eliza]Please come again when your beaties are full~.[/say]")

		saynn("She then helps you to get up. The milking is done.. so she brings you out into the corridor.")

		saynn("[say=eliza]Hope you will find your way back, I gotta go fill in some paperwork.[/say]")

		saynn("Time to go..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_heaven"):
		processTime(5*60)

	if(_action == "do_kneel"):
		processTime(3*60)

	if(_action == "do_milk"):
		processTime(5*60)

	if(_action == "do_milk_process"):
		processTime(5*60)
		amountCollected = GM.main.SCI.processMilkPlayerBreasts()

	setState(_action)

func saveData():
	var data = .saveData()

	data["isFirst"] = isFirst
	data["amountCollected"] = amountCollected

	return data

func loadData(data):
	.loadData(data)

	isFirst = SAVE.loadVar(data, "isFirst", true)
	amountCollected = SAVE.loadVar(data, "amountCollected", 0.0)
