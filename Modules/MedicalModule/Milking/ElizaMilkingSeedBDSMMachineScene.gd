extends SceneBase

var hasCage = false
var amountCollected = 0.0

func _init():
	sceneID = "ElizaMilkingSeedBDSMMachineScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		aimCameraAndSetLocName("med_milkingroom")
		playAnimation(StageScene.Grope, "tease", {pc="pc", npc="eliza", bodyState={exposedCrotch=true}})
		saynn("You ask the doctor to seed-milk you. She nods and asks you to follow her into the secluded room that has an advanced-looking table installed in it.")

		saynn("You expose your {pc.penis} and wait for what will happen next.")

		saynn("[say=eliza]Just stand still for me.[/say]")

		saynn("You do that while she taps away at a computer's keyboard.")

		addButton("Continue", "See what happens next", "pc_gets_grabbed")
	if(state == "pc_gets_grabbed"):
		playAnimation(StageScene.BDSMMachineAltFuck, "tease", {pc="pc", bodyState={naked=true,chains=([["hose", "penisPump", "scene", "milkIntake"]] if !hasCage else [])}})
		saynn("Suddenly, the table's mechanisms spring into lift. Two pairs of grabby manipulators dart towards your limbs.. tightly securing themselves around your wrists and ankles.. before effortlessly lifting you off of the floor and bringing you onto the table, belly-down.")

		saynn("Your body is rendered helpless as the manipulators secure your wrists and ankles in place, leaving you completely exposed.. especially your tasty rear, where each inch of your butt is laid bare, your {pc.analStretch} tailhole fully visible..")

		saynn("[say=pc]Ah.[/say]")

		if (!hasCage):
			saynn("[say=eliza]That's not even everything~.[/say]")

			saynn("She presses another button and a new manipulator joins the rest. But this one is quite different, it has a pump module attached to its tip. The table transforms a bit, a section under your crotch gets retracted, allowing the manipulator to secure that pump onto your member.. The negative pressure inside invites blood to rush down to your shaft, getting it nice and hard..")

		saynn("With mechanical precision, a motorized.. tool.. slides out from its compartment. Pre-lubed, it makes its way towards your exposed asshole, its surface sprinkled with lots of bumps. You feel it touching your anal ring.. and kneading it, gradually stretching and softening your tight sphincter. That rhythmic, gentle probing makes you arch your back a little.")

		saynn("[say=pc]Mh..[/say]")

		addButton("Continue", "See what happens next", "start_fuck")
	if(state == "start_fuck"):
		playAnimation(StageScene.BDSMMachineAltFuck, "sex", {pc="pc", bodyState={naked=true,chains=([["hose", "penisPump", "scene", "milkIntake"]] if !hasCage else [])}})
		saynn("After teasing your rear for a bit, the tool decides to make its deliberate, firm entry into your ass, its bumps quickly finding your prostate and putting pressure on it, causing your {pc.penis} to leak some transparent fluid out..")

		saynn("[say=pc]Ah!..[/say]")

		saynn("[say=eliza]Just enjoy the ride~.[/say]")

		saynn("When it's done sliding inside you, the machine begins retracting the tool.. before plunging it deep inside again, establishing a cycle. A cycle of pounding your ass.")

		if (!hasCage):
			saynn("At the same time, the pump module spools up as well, it begins to tug on your cock by sucking most of the air out, creating negative pressure.. before stuffing the air back inside. It feels like you're fucking a hungry fuckhole that wants to suck you in.. There is also a pleasure ring that neatly hugs your hard shaft before proceeding to slide along it, stroking hard..")

		else:
			saynn("As your p-spot gets stimulated so hard, your poor locked away member tries to get hard, blood flowing towards it but quickly encountering the cage that makes any kind of erection impossible. All your cock can do is dribble pre into the fluid collector below while your asshole is getting fucked by that machine..")

		saynn("Eliza just stands near and watches you with great fascination, her little smile makes yours glow red. The steady, powerful thrusts of that tool creates a storm of pleasurable sensations that cascade through your entire body as heat..")

		addButton("Continue", "See what happens next", "process_cum")
	if(state == "process_cum"):
		playAnimation(StageScene.BDSMMachineAltFuck, "fast", {pc="pc", bodyState={naked=true,chains=([["hose", "penisPump", "scene", "milkIntake"]] if !hasCage else [])}})
		saynn("The tool.. the dildo.. gradually ramps up its pressure on your pleasure button, sliding in and out of your ass at a crazy rate, the lubed-surface allowing it to do so.")

		saynn("[say=pc]Ah.. ahh.. ah..[/say]")

		if (!hasCage):
			saynn("The combined stimulation from that dildo and the rhythmic suctions and strokes coming from that penis pump leave you moaning like a slut, your prostate, caught in between all of this, begins to get all big and swollen, the milking makes it produce more and more of that transparent fluid that leaks from your cock.. Your body, straining against the restraints, squirms and convulses as the unyielding pressure builds relentlessly within you..")

		else:
			saynn("The combined stimulation from that dildo with the tightness coming from your cock trying to get hard in your cage leave you moaning like a slut, your prostate, caught in between all of this, begins to get all big and swollen, the milking makes it produce more and more of that transparent fluid that leaks from your cock.. Your body, straining against the restraints, squirms and convulses as the unyielding pressure builds relentlessly within you..")

		saynn("[say=eliza]Give me all that useless seed, c'mon~."+str(" It's not like you can use it anyway~." if hasCage else "")+"[/say]")

		saynn("Soon, the pounding becomes too much to bear. You throw your head back and moan as your member pulses violently, shooting "+str("thick powerful" if !hasCage else "weak")+" spurts of seed"+str(", filling the transparent tube of that penis pump" if !hasCage else " into the fluid collector below")+". The dildo keeps smashing your throbbing prostate, milking more and more of your {pc.cum} out of your twitching balls, your body trembling uncontrollably.")

		saynn("[say=pc]Ahh-hh.. mhhnhhh.. nhhh-h..[/say]")

		saynn("Your asshole clenches with every surge, your p-spot squeezed to its limits.. pretty much destroyed by that relentless dildo that just keeps pounding you.. until you are left completely dry.. every last drop of your {pc.cum} forced from your cock"+str(" and collected by that pump" if !hasCage else "")+".")

		addButton("Continue", "See what happens next", "stop_milking")
	if(state == "stop_milking"):
		playAnimation(StageScene.BDSMMachineAltFuck, "inside", {pc="pc", bodyState={naked=true,chains=([["hose", "penisPump", "scene", "milkIntake"]] if !hasCage else [])}})
		saynn("The dildo stops when there is no more seed to collect.. your orgasm fading away.")

		saynn("While panting heavily, you catch Eliza's gaze.. she is biting her lip.")

		saynn("[say=eliza]Amazing~. Felt good?[/say]")

		saynn("Little shudders are still rocking through your spent body.")

		saynn("[say=pc]T-thanks.. Yeah..[/say]")

		saynn("[say=eliza]Let's get you out of there~.[/say]")

		saynn("She presses a button that causes the machine to retract the dildo, leaving your tailhole to gape for a bit.. beads of lube still hanging between the walls.")

		addButton("Continue", "See what happens next", "outside_room")
	if(state == "outside_room"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		GM.pc.setLocation("med_nearmilking")
		saynn("Eliza presses a few more buttons that make the table put you down on your feet carefully. Your legs are still shaking..")

		saynn("[say=eliza]Thank you for that great donation~.[/say]")

		saynn("You nod.. trying to catch your breathing.")

		saynn("[say=eliza]I need to fill in some paperwork now, I hope you will find your way back to the lobby~.[/say]")

		saynn("It's time to go.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "pc_gets_grabbed"):
		processTime(5*60)
		if(GM.pc.isWearingChastityCage()):
			hasCage = true
		else:
			var thePump = GlobalRegistry.createItem("PenisPump")
			GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(thePump)

	if(_action == "start_fuck"):
		processTime(5*60)

	if(_action == "process_cum"):
		processTime(5*60)
		amountCollected = GM.main.SCI.processMilkPlayerPenis()
		GM.pc.orgasmFrom("eliza")

	if(_action == "stop_milking"):
		processTime(3*60)

	if(_action == "outside_room"):
		if(!hasCage):
			GM.pc.getInventory().clearSlot(InventorySlot.Penis)

	setState(_action)

func saveData():
	var data = .saveData()

	data["hasCage"] = hasCage
	data["amountCollected"] = amountCollected

	return data

func loadData(data):
	.loadData(data)

	hasCage = SAVE.loadVar(data, "hasCage", false)
	amountCollected = SAVE.loadVar(data, "amountCollected", 0.0)
