extends SceneBase

var isAnal = false
var amountCollected = 0.0

func _init():
	sceneID = "ElizaMilkingBreastsBDSMMachineScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		aimCameraAndSetLocName("med_milkingroom")
		playAnimation(StageScene.Grope, "tease", {pc="pc", npc="eliza", milkTank=true, bodyState={naked=true}})
		saynn("You ask the doctor to milk you. She nods and brings you into the special room. But rather than picking one of the milking stalls, she brings you into a special little secluded space..")

		saynn("In the center of the room stands a high-tech smart table, its surface cool and clinical.")

		saynn("You expose your {pc.breasts} and wait for her orders.")

		saynn("[say=eliza]Perfect. Give me just one second~.[/say]")

		saynn("She approaches some kind of computer and begins pressing buttons on it.")

		addButton("Continue", "See what happens next", "get_locked")
	if(state == "get_locked"):
		playAnimation(StageScene.BDSMMachineFuck, "tease", {pc="pc", bodyState={naked=true, hard=true, chains=[["hoseshort", "breastpump", "scene", "milkIntake"]]}})
		saynn("Before you can react, the table springs into life, sending out some kinds of robotic manipulators towards you! With precise, calculated movements, they grab your wrists and ankles.. before lifting you off the floor and bringing you onto the table.")

		saynn("[say=eliza]There we go~. Technology is great.[/say]")

		saynn("You test the grabby arms of the table.. but nah.. all you can do is make the motors inside them whirl a little louder.. your arms and legs are spread wide.. you are completely exposed and helpless.")

		saynn("Eliza presses a few more buttons.. sending some additional manipulators towards you, these ones fitted with suction cups.. One by one, they press against your sensitive, full breasts.. each cup tightly locking onto your swollen mounds.")

		saynn("Instantly, the integrated breast pumps whir to life. You feel a gentle.. but insistent.. tug at your nipples, making them stiff and perky. The rhythmic suctions are making you part your lips and moan softly..")

		saynn("And soon, the pumps begin to draw out warm, creamy {pc.milk} from your breasts.. each pulse of the pumps causes a few precious droplets to spawn at your swollen nips.. and quickly get sucked out into the soft tubes.")

		saynn("[say=pc]Mhh..[/say]")

		saynn("[say=eliza]Great~. One last thing I forgot, let me set the mood~.[/say]")

		saynn("Whatever she did, it made one one of the manipulators bring a screen in front of your eyes. This screen begins to display the exact amount of {pc.milk} that was collected from you.. and also lots of encouraging messages..")

		saynn("You're such a good cow..")

		saynn("Keep producing.. Always keep producing..")

		saynn("From that point on, Eliza is just watching the automated process.. The automated process of you being milked..")

		saynn("It feels great though.. The pumps keep tugging at your hardened nips with calculated pressure, causing more beads of your {pc.milk} to spawn from your nips.. a constant steady flow.. Some of it is just little rivers of creamy fluids.. and some is squirting out with force.. but all of it is neatly collected.")

		saynn("Let it flow..")

		saynn("Surrender to the rhythm..")

		saynn("After establishing a good flow, the screen suddenly shows you a choice.. It only asks you to look at your choice.")

		addButton("Wand", "The machine will use its wand tool on your crotch..", "choose_wand")
		addButtonWithChecks("Vaginal", "The machine will use its dildo tool on your pussy..", "choose_vag", [], [[ButtonChecks.HasReachableVagina]])
		addButton("Anal", "The machine will use its dildo tool on your ass..", "choose_anal")
		addButton("Double", "The machine will use two dildos at once..", "choose_double")
	if(state == "choose_wand"):
		playAnimation(StageScene.BDSMMachineFuck, "wand", {pc="pc", bodyState={naked=true, hard=true, pcCum=true, chains=[["hoseshort", "breastpump", "scene", "milkIntake"]]}})
		saynn("You look at the option that sounds the most interesting.. and soon, a new manipulator gets brought out.")

		saynn("A sleek wand massager gets pressed against your exposed, quivering "+str("pussy" if !isAnal else "tailhole")+". Without delay, it begins to vibrate.. a deep, resonant hum that resonates against your inner sensitive spots."+str(". your prostate." if (isAnal && GM.pc.hasPenis()) else "")+" You can't help but to start moaning a lot, a sudden spike of pleasure is further intensifying the milk flow, your tits are squirting out more little beads of {pc.milk}.")

		saynn("[say=pc]Mhh.. ahh.. f-fuck..[/say]")

		saynn("Embrace the sensations.. let your milking be endless.")

		saynn("Your body is wonderful. You're amazing.")

		saynn("Two sources of stimulations combine.. a constant, relentless suction on your breasts.. and the vibrating pressure against your "+str("slit" if !isAnal else "anal ring and taint")+". It feels so good, your whole body begins trying to squirm, your muscles hardly obey your brain..")

		saynn("Forget everything else.. focus on the milking..")

		saynn("Good cows make a lot of milk..")

		saynn("You close your eyes.. but it's okay.. the messages are still there.. in your head.. It's all you can think about.. Milking.. Milking..")

		saynn("[say=pc]Ah.. ahh..[/say]")

		saynn("Each pump.. each second of these vibrations.. it quickly drives you toward a forced peak.. For some reason, you really wanna make a certain noise.. Fuck it..")

		saynn("[say=pc]..moo-o-o~..[/say]")

		saynn("Almost involuntarily, a powerful orgasm crashes over you. Your body tries to thrash against the manipulators.. but they keep you nice and still, primed for milking.. As you reach the peak, your lactation does too, your breasts erupt with a burst of {pc.milk}, your nips squirting out lots of little fountains of it..")

		saynn("No thoughts.. only milking..")

		saynn("The message flashes before your eyes..")

		saynn("No thoughts.. only milking..")

		saynn("No thoughts.. only milking..")

		saynn("More and more {pc.milk} splashes against the bottom of the suction cups.. your "+str("pussy" if !isAnal else "anus")+" is pulsing wildly while the wand keeps stimulating it.. while the pumps keep pumping your udders.. It feels so fucking good..")

		saynn("[say=pc]Moo.. moo-o~..[/say]")

		saynn("All of the flowing nectar gets swiftly collected.. the machine is working overtime to make sure it doesn't miss a single drop..")

		addButton("Continue", "See what happens next", "wand_process")
	if(state == "wand_process"):
		playAnimation(StageScene.BDSMMachineFuck, "tease", {pc="pc", bodyState={naked=true, hard=true, chains=[["hoseshort", "breastpump", "scene", "milkIntake"]]}})
		saynn("When the flow of your {pc.milk} finally begins to subside, so does the stimulation. The wand gets pulled away from your twitching "+str("pussy" if !isAnal else "star")+", the pumps slow down to a crawl, their pulsing becoming gentler and easier on your nips.")

		saynn("Your body is left exposed and trembling from the many aftershocks of your orgasms.. your nips feel so sensitive..")

		saynn("Eliza steps forward, admitting the results of the work of the machine.")

		saynn("[say=eliza]Perfection~. Thank you for your humble donation~.[/say]")

		saynn("All you can do is nod subtly.. You lean back into the table.. and just pant heavily.. exhaustion begins to win over.")

		addButton("Continue", "See what happens next", "after_milking")
	if(state == "after_milking"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		GM.pc.setLocation("med_nearmilking")
		aimCameraAndSetLocName("med_nearmilking")
		saynn("Eliza carefully removes the suction cups.. exposing your nips to the cold, sterile air.")

		saynn("She presses a button that carefully puts you down onto the floor. Your legs feel weak.")

		saynn("After that, she just brings you out into the corridor.")

		saynn("[say=eliza]Come back again soon~. Hope you will find your way back, I gotta go fill in some paperwork.[/say]")

		saynn("Time to go..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "choose_vag"):
		playAnimation(StageScene.BDSMMachineFuck, "sex", {pc="pc", bodyState={naked=true, hard=true, chains=[["hoseshort", "breastpump", "scene", "milkIntake"]]}})
		saynn("You look at the option that sounds the most interesting.. and soon, a new manipulator gets brought out.")

		saynn("A sleek rubber dildo gets pressed against your exposed, quivering "+str("pussy" if !isAnal else "tailhole")+", its pre-lubed tip prodding the entrance. As soon as it stretches you enough to slide inside, it starts fucking you, thrusting inside.. while the breast pumps feel an increased flow of your {pc.milk}..")

		saynn("[say=pc]Mhh.. ahh..[/say]")

		saynn("Embrace the sensations.. let your milking be endless.")

		saynn("Pregnant cows give the most milk.. Breeding is good..")

		saynn("The dildo keeps pounding you, aligned in such a way that it can hit your pleasure spot with most efficiency.."+str(" your prostate.." if (isAnal && GM.pc.hasPenis()) else "")+""+str(" your g-spot.." if (!isAnal) else "")+"")

		saynn("Two sources of stimulations combine.. a constant, relentless suction on your breasts.. and an intense fucking of your "+str("pussy slit" if !isAnal else "{pc.analStretch} anus")+". It feels so good, your whole body begins trying to squirm, your muscles hardly obey your brain..")

		saynn("Forget everything else.. focus on breeding.. focus on milking..")

		saynn("Bred cows make a lot of milk..")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "get_locked"):
		processTime(5*60)
		var thePump = GlobalRegistry.createItem("BreastPump")
		if(thePump):
			var theFluids = thePump.getFluids()
			if(theFluids):
				theFluids.addFluid("Milk", 400.0)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(thePump)

	if(_action == "choose_wand"):
		GM.pc.orgasmFrom("pc")
		if(GM.pc.hasReachableVagina()):
			isAnal = false
		else:
			isAnal = true

	if(_action == "choose_vag"):
		isAnal=false

	if(_action == "choose_anal"):
		isAnal = true
		setState("choose_vag")
		return

	if(_action == "choose_double"):
		if(GM.pc.hasReachableVagina()):
			isAnal = false
		else:
			isAnal = true

	if(_action == "wand_process"):
		processTime(5*60)
		amountCollected = GM.main.SCI.processMilkPlayerBreasts()

	if(_action == "after_milking"):
		processTime(5*60)
		GM.pc.getInventory().clearSlot(InventorySlot.UnderwearTop)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isAnal"] = isAnal
	data["amountCollected"] = amountCollected

	return data

func loadData(data):
	.loadData(data)

	isAnal = SAVE.loadVar(data, "isAnal", false)
	amountCollected = SAVE.loadVar(data, "amountCollected", 0.0)
