extends SceneBase

var bratCounter = 0

func _init():
	sceneID = "AlexTrustExercise2Scene"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("You walk up to Alex and wait for a good moment to ask.")

		saynn("[say=pc]Can we do a trust exercise? Second one?[/say]")

		if (GM.pc.hasBoundArms() || GM.pc.hasBlockedHands() || GM.pc.hasBoundLegs() || GM.pc.isBlindfolded() || GM.pc.isGagged() || GM.pc.isWearingPortalPanties()):
			saynn("Alex notices your restraints and hums")

			saynn("[say=alexrynard]Kinky. But I need your body to be fully free.[/say]")

			saynn("Huff, what a buzzkill. Looks like you have to struggle out of your restraints first.")

			addButton("Oh well", "Was worth a try", "endthescene")
		elif (GM.pc.isFullyNaked()):
			saynn("Alex sees your naked body and hums.")

			saynn("[say=alexrynard]Please cover up yourself with something first. Clothing will be important for this first one.[/say]")

			saynn("Huff, what a buzzkill. Looks like you have to be wearing something before asking this.")

			addButton("Oh well", "Was worth a try", "endthescene")
		elif (GM.pc.hasEffect(StatusEffect.CoveredInCum)):
			saynn("Alex notices how messy you are and sighs.")

			saynn("[say=alexrynard]Please clean yourself first. You're way too messy.[/say]")

			saynn("Huff, what a buzzkill. Looks like you will have to take a shower first.")

			addButton("Oh well", "Was worth a try", "endthescene")
		else:
			saynn("Alex quickly checks you and your outfit out before nodding.")

			saynn("[say=alexrynard]Sure, we can try something interesting today.[/say]")

			saynn("[say=pc]You're gonna push me?[/say]")

			saynn("He smiles.")

			saynn("[say=alexrynard]Not how it works. Follow me.[/say]")

			addButton("Follow", "See where he brings you", "brought_intro_breakroom")
	if(state == "brought_intro_breakroom"):
		aimCameraAndSetLocName("eng_breakroom")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("He brings you into the staff-only break room, the same one as before. Looks just as cozy as before.")

		saynn("[say=alexrynard]We're gonna do the same thing, seeing where your limits lie. If I hear 'RED', I stop what I'm doing immediately. If I don't hear it, even your tears won't stop me.. Well, tears probably would too. Got it?[/say]")

		saynn("Alex points at the center of the room. You take your spot and watch Alex rummage through some of his equipment, big boxes of it.")

		addButton("Yes", "You understand", "1_yes")
		addButton("Cry", "Shed a tear", "1_brat")
		addButton("RED", "Say this", "1_red")
	if(state == "1_red"):
		saynn("[say=pc]RED![/say]")

		saynn("He stops what he is doing and looks at you. After seeing that you're alright.. he rolls his eyes.")

		saynn("[say=alexrynard]Very funny. But it is very important. Did you understand what I said?[/say]")

		addButton("Yes", "You understand", "1_yes")
		addButton("RED", "Say this", "1_red_red")
	if(state == "1_red_red"):
		saynn("You don't why but you feel like you must..")

		saynn("[say=pc]RED!![/say]")

		saynn("He sighs and just invites you to leave. You can hardly hold the laughter.")

		saynn("[say=alexrynard]Come back when you get all of that out of your system.[/say]")

		saynn("Oh well. At least it was funny.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "1_yes"):
		saynn("[say=pc]Yes, I understand. All green.[/say]")

		saynn("Alex nods and then finds what he was looking for. A big cardboard box with something.")

		saynn("He pushes that box into the center of the room.")

		saynn("[say=pc]What's inside?[/say]")

		saynn("[say=alexrynard]Be a good {pc.boy} and undress. Maybe you will find out then.[/say]")

		addButton("Undress", "Do as he orders", "2_undress")
		addButton("Make me", "Be a brat about it", "2_brat")
		addButton("RED", "Say this", "2_red")
	if(state == "2_brat"):
		# (( You tell him to make you
		# (( He just starts dragging the box away. So you obey anyway
		pass
	if(state == "2_undress"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", bodyState={naked=true}})
		saynn("[say=pc]Yes, Sir.[/say]")

		saynn("You show that you remember how to address him. You {pc.undressMessage}, leaving nothing covered. Your {pc.privates} are all on display..")

		saynn("Seeing that you obeyed his words, Alex finally opens the box, exposing.. a little machine. The one that looks kinda like a saddle.. but with some rubber bits sticking out of it.. roughly where one is supposed to be sitting.")

		saynn("[say=alexrynard]Sybian. One of the simplest.. love machines. But I find it fun anyway.[/say]")

		saynn("He grabs the remote.")

		saynn("[say=alexrynard]I modified it a little.[/say]")

		saynn("[say=pc]Modified?[/say]")

		saynn("[say=alexrynard]Yeah, it's my guilty pleasure, getting more juice out of the hardware.[/say]")

		saynn("You can only guess what he did to this machine.. You will only find out when he actually turns it on.")

		saynn("[say=alexrynard]Hop on.[/say]")

		addButton("Stand on it", "Hop on", "3_brat")
		addButton("Sit on it", "Sit on the sybian", "3_syb")
		addButton("RED", "Say this", "3_red")
	if(state == "3_brat"):
		# (( Aw, it's not a footrest?
		pass
	if(state == "3_syb"):
		playAnimation(StageScene.Sybian, "idle", {bodyState={naked=true}})
		saynn("[say=pc]Yes, Sir..[/say]")

		saynn("You carefully position yourself above the sybian.. and begin to lower yourself onto it.")

		if (GM.pc.hasReachableVagina()):
			saynn("It has a small rubber dildo sticking out of it.. so you align your pussy hole with it. The smooth silicone spreads your folds with ease, allowing you to sit on it without much problems. Near the base of that dildo is a ridged little platform that your clit and sensitive folds instantly feel.")

		else:
			saynn("It has a small rubber dildo sticking out of it.. so you align your tailhole with it. The smooth silicone spreads your {pc.analStrech} star with ease, allowing you to sit on it without much problems. Near the base of that dildo is a ridged little platform that your taint area instantly feels.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Even without any direct stimulation, your locked away dick is already putting some pressure on the chastity cage.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Even without any direct stimulation, your {pc.penis} is already slowly getting harder.")

		saynn("[say=alexrynard]Mhm. I'm not gonna tie you up. Or gag you. Not today. If you feel uncomfortable, just get off. Otherwise.. Let's see how much you can handle.[/say]")

		addButton("Yes Sir", "Say this", "4_yessir")
		addButton("TIE ME UP!", "Demand it", "4_brat")
		addButton("RED", "Say this", "4_red")
	if(state == "4_brat"):
		# (( Fine you get a blindfold
		pass
	if(state == "4_yessir"):
		playAnimation(StageScene.Sybian, "idle", {bodyState={naked=true}})
		saynn("[say=pc]Yes, Sir..[/say]")

		saynn("Alex holds the remote with one hand while the second one twists one of the knobs by one notch.")

		if (GM.pc.hasReachableVagina()):
			saynn("The machine under you begins to hum quietly, the little dildo is vibrating inside your pussy with a low frequency. It feels.. quite pleasantly.. nothing insane but you can for sure feel it.")

		else:
			saynn("The machine under you begins to hum quietly, the little dildo is vibrating inside you with a low frequency. It feels.. quite pleasantly.. nothing insane but you can for sure feel it.")

		saynn("You exhale audibly and just sit still, your gaze directed straight forward.")

		saynn("[say=alexrynard]Tell me how it feels.[/say]")

		addButton("Like nothing", "Say this", "5_brat")
		addButton("Feels nice", "Say this", "5_nice")
		addButton("RED", "Say this", "5_red")
	if(state == "5_brat"):
		# (( He spikes the power and says that it would numb you fast
		pass
	if(state == "5_nice"):
		playAnimation(StageScene.Sybian, "idle", {bodyState={naked=true, hard=true}})
		saynn("[say=pc]Feels nice, Sir..[/say]")

		saynn("He nods and turns the knob again, causing the seat under you to vibrate a little more eagerly.")

		if (GM.pc.hasReachableVagina()):
			saynn("Even the little ridged platform that your clit is resting on is now shifting back and forth, providing some stimulation. You can't help but to produce your first little moan, your petals getting more wet every second.")

		else:
			saynn("Even the little ridged platform that your taint area is resting on is now shifting back and forth, providing some stimulation to your sensitive zone. You can't help but to produce your first little moan.")

		saynn("[say=pc]Ah..[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your caged up member begins to drip pre through the chastity as the dildo starts vibrating harder against your pleasure spot.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your cock gets fully hard and starts dripping pre as the dildo starts vibrating harder against your pleasure spot.")

		saynn("Alex is just standing near, his eyes watching you with great interest.")

		saynn("[say=alexrynard]Yeah, I can tell by now. Looks like you're ready for more.[/say]")

		addButton("Cry!", "Shed a tear", "6_brat")
		addButton("Brace", "Prepare for what's to come", "6_brace")
		addButton("RED", "Say this", "6_red")
	if(state == "6_brace"):
		playAnimation(StageScene.Sybian, "ride", {bodyState={naked=true, hard=true}})
		saynn("Seems like something is gonna happen.. so you brace, all your muscles tense up.")

		saynn("That might have been a mistake though.. Clenching around that dildo only made it worse when Alex turned the knob on his remote to a medium setting.")

		saynn("Instantly, you arch your back. The dildo vibrates inside you so hard that you can't help but to start squirming.")

		if (GM.pc.hasReachableVagina()):
			saynn("It'd be so easy to get up and make that feeling go away.. but you stay on it and let the machine pleasure you and your pussy.")

		else:
			saynn("It'd be so easy to get up and make that feeling go away.. but you stay on it and let the machine pleasure you.")

		saynn("[say=pc]Ah-h..[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your cock is pushing more against the chastity cage but the metal is too strong.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your cock twitches wildly, more precum dripping from it.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "brought_intro_breakroom"):
		processTime(3*60)

	if(_action == "1_brat"):
		bratCounter += 1

	if(_action == "1_red"):
		bratCounter += 1

	if(_action == "2_brat"):
		bratCounter += 1

	if(_action == "3_brat"):
		bratCounter += 1

	if(_action == "4_brat"):
		bratCounter += 1
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("blindfold"))

	if(_action == "5_brat"):
		bratCounter += 1

	setState(_action)

func saveData():
	var data = .saveData()

	data["bratCounter"] = bratCounter

	return data

func loadData(data):
	.loadData(data)

	bratCounter = SAVE.loadVar(data, "bratCounter", 0)
