extends SceneBase

var amountCollected = 0.0

func _init():
	sceneID = "ElizaMilkingBreastsPumpsScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		aimCameraAndSetLocName("med_milkingroom")
		playAnimation(StageScene.Grope, "tease", {pc="pc", npc="eliza", milkTank=true, bodyState={exposedChest=true}})
		saynn("You ask the doctor to milk you. She nods and brings you into the special room. She picks a stall that has some milking equipment installed..")

		saynn("You expose your {pc.breasts} and wait for her orders. You feel excited..")

		saynn("[say=eliza]Perfect. Let's put your breasts to work~.[/say]")

		saynn("She gestures for you to get into the right spot.. in front of a long pipe.. that has some cuff-like restraints attached to it. Your eyes also notice the two prepared devices that consist of transparent funnel-like cups with a pump each.. both of them are connected to the big milk tank with some flexible tubes.")

		saynn("Doctor's paw lands on your back and starts putting pressure on it, inviting you to bend forward.")

		addButton("Bend forward", "Do what she wants you to do", "get_locked")
	if(state == "get_locked"):
		playAnimation(StageScene.MilkingStallSolo, "start", {pc="pc", npc="eliza", bodyState={exposedChest=true, hard=true, chains=[["hoseshort", "breastpump", "scene", "milktank"], ["short", "neck", "scene", "bottompipe"]]}})
		saynn("You follow the guidance of that paw, slowly bending forward and assuming the final position. You place your wrists in the offered holes for them in the restraints.. and watch as the doctor locks them up. Then, she also pulls out a short chain leash, attaching one end to your collar and the other to the sturdy pipe..")

		saynn("[say=eliza]We don't want our cow to run off unmilked, do we~.[/say]")

		saynn("Fair enough.. You can't help to notice.. that your position is quite.. vulnerable.. your {pc.breasts} dangling invitingly underneath you.")

		saynn("Eliza then knees in front of you, her paws reaching out to gently cup your mounds, feeling their weight. Her touch makes your nips go stiff..")

		saynn("Carefully, she grabs the two industrial-grade breast pumps and begins to attach each one to your sensitive, milky breasts, aligning the soft suction cups perfectly over your hardened nips. The negative pressure inside allows them to hold on to your breasts without any problems..")

		saynn("For some reason, seeing this contraption attached to your chest.. makes you shiver a little.. Eliza bites her lip, admiring your reaction.")

		addButton("Continue", "See what happens next", "do_milk_start")
	if(state == "do_milk_start"):
		playAnimation(StageScene.MilkingStallSolo, "milking", {pc="pc", npc="eliza", bodyState={exposedChest=true, hard=true, chains=[["hoseshort", "breastpump", "scene", "milktank"], ["short", "neck", "scene", "bottompipe"]]}})
		saynn("Eliza quickly makes sure that everything is tightly secured.. before flicking the activation switch.")

		saynn("Almost immediately, a soft, rhythmic hum fills the stall as the pumps begin their work. They're not exactly gentle.. the first tugs on your sensitive nips make you gasp softly.. You look down at your chest and see your nipples getting pulled on by the machine.. again and again.. until the first drops of your {pc.milk} begin to pool at the bottom of the suction cups.. At some point enough gets collected for it to start flowing through the attached tubing..")

		saynn("Your gazes collide with the smiling doctor.")

		saynn("[say=eliza]Good little cow. You like being milked, don't you?[/say]")

		saynn("Her words make you blush hard. It's hard to deny it though.. your body is squirming ever so slightly against the chain and the restraints.. while the pumps increase their rhythmic pulses, sending ripples of pleasurable shivers along your chest.. your breasts respond by keeping the flow nice and steady, each suction adds some lewd jiggle to them..")

		saynn("[say=eliza]Don't worry about me, just focus on your body.. Focus on the pumps tugging away at your nips.. focus on your udders, little cow.. Feel them being milked..[/say]")

		saynn("Her words are so arousing.. It's hard not to part your lips a bit and start panting.. little subtle noises of pleasure escaping your lips.. muffled by the mechanical noises of the pumps pumping away. Streams of your {pc.milk} fill the transparent tubes, leaving little creamy smears along its length..")

		addButton("Continue", "See what happens next", "do_milk_faster")
	if(state == "do_milk_faster"):
		playAnimation(StageScene.MilkingStallSolo, "fast", {pc="pc", npc="eliza", bodyState={exposedChest=true, hard=true, chains=[["hoseshort", "breastpump", "scene", "milktank"], ["short", "neck", "scene", "bottompipe"]]}})
		saynn("The pumps work relentlessly.. tirelessly.. pulling out more and more {pc.milk} from your swollen nips.. The sensations are both electrifying and hypnotic.. every nerve of your sensitive buds gets triggered all at once by the machine.")

		saynn("[say=eliza]Just let it all go.. Make any noises that you want, holding back will only lower the milk quality~.[/say]")

		saynn("[say=pc]Mh..[/say]")

		saynn("Your eyes close.. any other thought slowly drifts away.. any worries.. any stress.. any problems.. none of it matters. There is only milking.. your only purpose.. to make as much milk as you can..")

		saynn("Breathy moans slip from your lips.. on their own.. Your body is squirming more.."+str(" Your neglected pussy is soaked with juices, making your inner thighs wet.." if GM.pc.hasReachableVagina() else "")+""+str(" Your {pc.penis} is throbbing lightly.." if GM.pc.hasPenis() else "")+"")

		saynn("[say=pc]..moo..[/say]")

		saynn("A strange animalistic noise slips by.. without you even acknowledging its nature.. it just felt right..")

		saynn("[say=eliza]Perfect.[/say]")

		saynn("The milking continues for a while.. pushing you further into this abyss of constant pleasure.. Feels so good..")

		addButton("Continue", "See what happens next", "do_milk_process")
	if(state == "do_milk_process"):
		playAnimation(StageScene.MilkingStallSolo, "start", {pc="pc", npc="eliza", bodyState={exposedChest=true, hard=true, chains=[["hoseshort", "breastpump", "scene", "milktank"], ["short", "neck", "scene", "bottompipe"]]}})
		saynn("Eventually, the flow begins to subside.. a constant flow becomes a slow, tedious dribble..")

		saynn("Eliza slowly disengages the pumps. When the stimulation is gone, your eyes open..")

		saynn("[say=eliza]Welcome back~.[/say]")

		saynn("She reaches her paw out and gently scritches you behind the ear.")

		saynn("[say=eliza]You made so much.. good job.. love it. You need some rest now.[/say]")

		saynn("You nod.. your whole body is still tingly from the aftershocks.. at least your breasts don't feel as heavy..")

		addButton("Continue", "See what happens next", "after_milking")
	if(state == "after_milking"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		GM.pc.setLocation("med_nearmilking")
		aimCameraAndSetLocName("med_nearmilking")
		saynn("Eliza carefully removes the suction cups.. exposing your nips to the cold, sterile air.")

		saynn("She helps you to get up, unclipping the leash. Feels weird to be standing straight again.")

		saynn("After that, she just brings you out into the corridor.")

		saynn("[say=eliza]Hope you will find your way back, I gotta go fill in some paperwork.[/say]")

		saynn("Time to go..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "get_locked"):
		processTime(5*60)
		var thePump = GlobalRegistry.createItem("BreastPump")
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(thePump)

	if(_action == "do_milk_start"):
		processTime(5*60)
		var thePump = GM.pc.getInventory().getEquippedItem(InventorySlot.UnderwearTop)
		if(thePump):
			var theFluids = thePump.getFluids()
			if(theFluids):
				theFluids.addFluid("Milk", 400.0)

	if(_action == "do_milk_faster"):
		processTime(5*60)
		var thePump = GM.pc.getInventory().getEquippedItem(InventorySlot.UnderwearTop)
		if(thePump):
			var theFluids = thePump.getFluids()
			if(theFluids):
				theFluids.addFluid("Milk", 400.0)

	if(_action == "do_milk_process"):
		processTime(5*60)
		amountCollected = GM.main.SCI.processMilkPlayerBreasts()

	if(_action == "after_milking"):
		processTime(3*60)
		GM.pc.getInventory().clearSlot(InventorySlot.UnderwearTop)

	setState(_action)

func saveData():
	var data = .saveData()

	data["amountCollected"] = amountCollected

	return data

func loadData(data):
	.loadData(data)

	amountCollected = SAVE.loadVar(data, "amountCollected", 0.0)
