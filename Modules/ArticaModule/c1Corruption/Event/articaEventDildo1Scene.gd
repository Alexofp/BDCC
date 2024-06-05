extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false

func _init():
	sceneID = "articaEventDildo1Scene"

func _run():
	if(state == ""):
		setFlag("ArticaModule.nextReaction", "d1hap")
		addCharacter("artica")
		isNaked = getFlag("ArticaModule.NoClothes", false)
		isCaged = getCharacter("artica").isWearingChastityCage()
		corruption = getModule("ArticaModule").getCorruption()
		isSlut = getModule("ArticaModule").isSlut()
		isVerySlut = getModule("ArticaModule").isVerySlut()
		isLusty = getModule("ArticaModule").isLusty()
		nakedAndShy = (isNaked && !isSlut)
		playAnimation(StageScene.Solo, "walk", {pc="artica"})
		aimCameraAndSetLocName("hall_mainentrance")
		saynn("Artica seems to be heading towards the main elevator"+str(", covering her private bits with her paws at all times" if nakedAndShy else "")+".")

		saynn("You let her take this one and just wait for the next. She seems to be heading down to the lowest floor.. the one where all the mine shafts are.")

		addButton("Follow", "See where Artica is heading..", "artica_near_mines")
	if(state == "artica_near_mines"):
		aimCameraAndSetLocName("mining_nearentrance")
		saynn("As you exit the elevator, you see Artica.. standing on a catwalk.")

		if (isNaked):
			saynn("Her hands seem to be traveling along her body.. digits caressing her curves. Occasionally, her paw reaches her pussy and gives it a few rubs.")

		else:
			saynn("Her hands seem to be traveling along her body.. slipping under her uniform and caressing her curves. Bravely, she tugs her shorts down a bit, exposing her pussy and giving it a few rubs.")

		saynn("Artica stands high on her toes as her clawed digits spread her sensitive folds wide. You're standing behind her, seeing her fluffy butt mostly.. but you still notice the ropes of her juices hanging from her slit. Someone is clearly incredibly horny..")

		saynn("So horny that she doesn't even notice a..")

		saynn("[say=socket]Hey there![/say]")

		saynn("[say=artica]EEK![/say]")

		addButton("Continue", "See what happens next", "sudden_socket")
	if(state == "sudden_socket"):
		addCharacter("socket")
		playAnimation(StageScene.Duo, "stand", {pc="artica", npc="socket"})
		saynn("..a half-naked fennec approaching her."+str(" Artica jumps and quickly tries to pull her shorts up.. failing at that spectacularly.." if !isNaked else " Artica jumps and quickly covers herself up..")+"")

		saynn("[say=socket]Name is Socket. But you can call me EEK as well if you want![/say]")

		saynn("Embarrassed Artica tries to cover her blushing cheeks with her paws.. only to realize that her digits are still coated with her juices.")

		saynn("[say=socket]So.. What's up, um.. friendly face.[/say]")

		saynn("Artica notices the.. general lack of what one would consider clothing.. on the engineer.")

		saynn("[say=artica].. ..[/say]")

		saynn("She is talking so quietly that you can't hear a word..")

		saynn("[say=socket]Oh, that's my uniform! Always been like that.."+str(" But where is yours?" if isNaked else "")+"[/say]")

		if (nakedAndShy):
			saynn("Socket tilts her head while Artica eeps and covers herself again.")

			saynn("[say=socket]Don't be shy! I'm not planning to have an unsolicited breeding session with you![/say]")

			saynn("The poor fluff blinks while her cheeks burn red..")

		elif (isNaked):
			saynn("Artica shrugs and blinks a lot, now feeling a little bit more comfy when she realizes that she is not alone with all her private bits exposed..")

			saynn("[say=socket]I guess you're looking for an unsolicited breeding session. Sadly I can't provide, sorry![/say]")

			saynn("A small blush does appear on the fluff's cheeks when she hears that.")

		saynn("[say=artica].. ..?[/say]")

		saynn("[say=socket]Me? I'm a space station technician! Very new here.[/say]")

		saynn("[say=artica].. ..[/say]")

		saynn("Socket smiles.")

		saynn("[say=socket]Oh, you and me both. Cool! I can show you the workshop if you want.[/say]")

		saynn("Artica is clearly hesitant, her legs shut, inner thighs rubbing against each other.")

		saynn("[say=socket]Something is wrong?[/say]")

		saynn("[say=artica].. ..[/say]")

		saynn("Socket raises a brow, her hand scratches under her chin.")

		saynn("[say=socket]Hm.. I'm sure I can help you! Let's go![/say]")

		saynn("With nothing better to do, Artica decides to follow the naked engineer..")

		addButton("Follow", "See where Artica is heading..", "artica_in_workshop")
	if(state == "artica_in_workshop"):
		GM.pc.setLocation("eng_workshop")
		aimCameraAndSetLocName("eng_workshop")
		playAnimation(StageScene.Duo, "sit", {pc="artica", npc="socket", npcAction=["stand", "res://Inventory/UnriggedModels/BigWrench/BigWrench.tscn"]})
		saynn("Socket brings Artica into the workshop. A room with multiple working benches for inmates and staff to use. Although, any and all tools seem to be locked away, requiring staff access.")

		saynn("Artica sits behind one of the benches while Socket just leans against it.")

		saynn("[say=socket]So, you are saying.. you can hardly focus?[/say]")

		saynn("Artica nods slightly.")

		saynn("[say=socket]Ask someone to rail your cunt? Did you try that?[/say]")

		saynn("The fluff starts coughing, air stuck in her throat.")

		saynn("[say=socket]There is gotta be someone who you can ask to plow you raw! Make you into their cock pocket.[/say]")

		saynn("The way Socket casually talks about sex makes her gather all the eyes in the room..")

		saynn("[say=artica].. ..[/say]")

		saynn("[say=socket]Ohh.. that's fair. Can't you just use your fingers then?[/say]")

		saynn("Artica lowers her gaze low.")

		saynn("[say=artica].. ..[/say]")

		saynn("[say=socket]More digits?[/say]")

		saynn("[say=artica]..[/say]")

		saynn("[say=socket]What about the whole fist? That's gotta be enough![/say]")

		saynn("Artica blushes and shrugs, keeping her legs closed.")

		saynn("Socket scratches her chin more.")

		saynn("[say=socket]Aw.. I don't think I have any toys for you.. I have this wrench though! Wanna use it?[/say]")

		saynn("Socket pulls out her giant industrial wrench and places it on the bench, making Artica's eyes go big.")

		saynn("[say=artica]..[/say]")

		saynn("[say=socket]No? It's way bigger than a fist! I can lend it to you for some time.[/say]")

		saynn("[say=artica].. ..[/say]")

		saynn("Socket sighs and puts the wrench away, returning to thinking..")

		saynn("[say=socket]Hmm.. I have no toys.. but I have access to a 3d printer![/say]")

		saynn("Artica's eyes sparkling, full of hope, her toes curling, tail wagging.")

		saynn("[say=socket]..but I don't have any models.. I mean I do, but you probably can't have much fun with a support girder piece..[/say]")

		saynn("Artica sighs..")

		saynn("[say=socket]I might have an idea..[/say]")

		if (isCaged):
			if (isNaked):
				saynn("Socket eyes the naked girl out.. and notices her caged cock. Socket points straight at it, making Artica spread her legs and gasp.")

			else:
				saynn("Socket eyes the girl out.. and notices her bulging shorts. She quickly pulls down her shorts, exposing a caged cock, making the fluff gasp and squirm.")

			saynn("[say=socket]This! This could be a model![/say]")

			saynn("[say=artica].. ..[/say]")

			saynn("[say=socket]The cage? Pff, easy. You have a condom wrapper by any chance?[/say]")

			saynn(""+str("Naked " if isNaked else "")+"Artica tilts her head at that question.")

			saynn("[say=socket]No? I could use my wrench then.. Hold still![/say]")

			saynn("Artica eeps and offers her claws instead.")

			saynn("[say=socket]Claws?.. Let's try.[/say]")

			saynn("Socket grabs Artica's paw and guides one of her claws under the cage's lock, somewhere very specific. She shakes it a little.. until something inside the cage clicks!")

			saynn("[say=socket]There you go![/say]")

			saynn("Artica gasps.")

			saynn("[say=artica].. .. ..[/say]")

			saynn("[say=socket]Oh, you were locked for a reason? It's okay, it's just temporary! To make a digital mold! One second![/say]")

		else:
			if (isNaked):
				saynn("Socket eyes the naked girl out.. and notices her hard cock. Socket points straight at it, making Artica spread her legs and gasp.")

			else:
				saynn("Socket eyes the girl out.. and notices her bulging shorts. She quickly pulls down her shorts, exposing a hard canine cock, making the fluff gasp and squirm.")

			saynn("[say=socket]This! This could be a model![/say]")

			saynn("[say=artica].. ..[/say]")

			saynn("Socket smiles.")

			saynn("[say=socket]Trust me, it will work! I just need a digital mold. Stand up and give me a second![/say]")

		addButton("Continue", "See what happens next", "socket_takes_digital_mold")
	if(state == "socket_takes_digital_mold"):
		playAnimation(StageScene.Duo, "stand", {pc="artica", npc="socket", bodyState={naked=true,hard=true}, npcAction="kneel"})
		if (isCaged):
			saynn("Socket grabs her datapad and kneels before Artica. She carefully takes the unlocked cage off, causing that juicy canine cock to instantly spring out hard, pre leaking from its tip..")

			saynn("[say=socket]Fluids might interfere with it![/say]")

			saynn("Socket puts her hand on Artica's cock and slides her palm along its veiny texture, capturing any precum and making the girl squirm oh so much, her member quickly growing even harder, her knot inflating with blood.")

			saynn("[say=socket]Oh, perfect![/say]")

			saynn("Socket runs some app and proceeds to orbit her datapad around Artica's twitching hard cock, seemingly trying to record it from every angle.")

			saynn("After she is finished doing that, Socket quickly puts the cage back on that hard cock, forcing it into its sheath while Artica is moaning a lot.. click..")

			saynn("[say=socket]There you go, just like it was![/say]")

			saynn("Artica looks at her claws.. and hums.. before bringing them into her mouth and carefully trimming them short with her teeth. Huh.")

		else:
			saynn("Socket grabs her datapad and kneels before Artica. Feeling a warm breath near her crotch is making Artica's cock quickly get fully hard, pre leaking from its tip..")

			saynn("[say=socket]Fluids might interfere with it![/say]")

			saynn("Socket puts her hand on Artica's cock and slides her palm along its veiny texture, capturing any precum and making the girl squirm oh so much, her member quickly growing even harder, her knot inflating with blood.")

			saynn("[say=socket]Oh, perfect![/say]")

			saynn("Socket runs some app and proceeds to orbit her datapad around Artica's twitching hard cock, seemingly trying to record it from every angle.")

		saynn("After doing the required steps for the photogrammetry, Socket projects the final model of Artica's cock and balls on her datapad, causing a spinning hologram to appear and start hovering above the screen. The resolution seems high enough to see every crease.. every vein..")

		saynn("[say=socket]Look, pretty cool, uh?[/say]")

		saynn("Artica licks her lips, her mouth watering.")

		saynn("[say=socket]It's one to one, the exact dimensions are recorded too![/say]")

		saynn("[say=artica].. .. ..?..[/say]")

		saynn("Socket blinks while looking at Artica.")

		saynn("[say=socket]I mean.. Yeah, I can.[/say]")

		saynn("Socket presses a button and the projected hologram becomes bigger..")

		saynn("[say=socket]Like this?[/say]")

		saynn("[say=artica]..[/say]")

		saynn("[say=socket]Haha, sure![/say]")

		saynn("Socket presses that button again and the hologram of the cock gets scaled up again, now being at least 50% bigger than it was originally..")

		saynn("[say=artica]..[/say]")

		saynn("[say=socket]Oki doki! I will get the process started and get it delivered to your cell! In a discrete package of course.[/say]")

		saynn("Artica nods and steps away. Her lust isn't satisfied today.. but she seems to be mostly content about it. You might have to ignite the fire inside her again to push her further..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "artica_near_mines"):
		processTime(3*60)

	if(_action == "sudden_socket"):
		processTime(3*60)

	if(_action == "artica_in_workshop"):
		processTime(3*60)

	if(_action == "socket_takes_digital_mold"):
		processTime(3*60)
		getModule("ArticaModule").triggerCorruption(0.0)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isNaked"] = isNaked
	data["isCaged"] = isCaged
	data["corruption"] = corruption
	data["isSlut"] = isSlut
	data["isVerySlut"] = isVerySlut
	data["isLusty"] = isLusty
	data["nakedAndShy"] = nakedAndShy

	return data

func loadData(data):
	.loadData(data)

	isNaked = SAVE.loadVar(data, "isNaked", false)
	isCaged = SAVE.loadVar(data, "isCaged", false)
	corruption = SAVE.loadVar(data, "corruption", 0.0)
	isSlut = SAVE.loadVar(data, "isSlut", false)
	isVerySlut = SAVE.loadVar(data, "isVerySlut", false)
	isLusty = SAVE.loadVar(data, "isLusty", false)
	nakedAndShy = SAVE.loadVar(data, "nakedAndShy", false)
