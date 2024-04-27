extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false
var breastPumpID = ""
var penisPumpID = ""
var sybian = false
var breastMilking = false
var penisMilking = false
var isLact = false
var seedCollected = 0.0
var milkCollected = 0.0
var seedTotal = 0.0
var milkTotal = 0.0
var beganLactating = false
var announcedLact = false
var hadOrgasm = false

func _init():
	sceneID = "articaMilkingInCellScene"

func _run():
	if(state == ""):
		addCharacter("artica")
		isNaked = getFlag("ArticaModule.NoClothes", false)
		isCaged = getCharacter("artica").isWearingChastityCage()
		corruption = getModule("ArticaModule").getCorruption()
		isSlut = getModule("ArticaModule").isSlut()
		isVerySlut = getModule("ArticaModule").isVerySlut()
		isLusty = getModule("ArticaModule").isLusty()
		nakedAndShy = (isNaked && !isSlut)
		saynn("How do you want to milk Artica?")

		if (breastPumpID != "" && penisPumpID != ""):
			saynn("You will use a breast pump and a penis pump on her at the same time!")

		elif (breastPumpID != ""):
			saynn("You will use a breast pump on her!")

		elif (penisPumpID != ""):
			saynn("You will use a penis pump on her!")

		if (sybian):
			saynn("Artica will ride a sybian while being milked!")

		if (breastPumpID != "" || penisPumpID != ""):
			addButton("Start", "Commence milking", "prepare_milking")
		else:
			addDisabledButton("Start", "You need to select a breast pump or a penis pump")
		addButton("CANCEL", "You changed your mind", "endthescene")
		addButtonWithChecks("Breast pump", "Select which breast pump you want to use on Artica", "pick_breastpump", [], [[ButtonChecks.HasBreastPump]])
		if (!isCaged):
			addButtonWithChecks("Penis pump", "Select which penis pump you want to use on Artica", "pick_penispump", [], [[ButtonChecks.HasPenisPump]])
		else:
			addDisabledButton("Penis pump", "Can't make Artica wear a penis pump when her cock is caged!")
		if (getFlag("NpcSlaveryModule.hasSybian")):
			addButton("Sybian", "Toggle the usage of the sybian machine in the scene", "toggle_sybian")
		else:
			addDisabledButton("Sybian", "You don't have a sybian machine installed in your cell")
	if(state == "pick_breastpump"):
		saynn("Pick which breast pump is gonna be used during the scene.")

		addButton("None", "No pump is gonna be used", "do_pick_nobreastpump")
		addPumpButtons("do_pick_breastpump")
		if (false):
			addButton("Nope", "You shouldn't see this", "do_pick_breastpump")
	if(state == "pick_penispump"):
		saynn("Pick which penis pump is gonna be used during the scene.")

		addButton("None", "No pump is gonna be used", "do_pick_nopenispump")
		addPenisPumpButtons("do_pick_penispump")
		if (false):
			addButton("Nope", "You shouldn't see this", "do_pick_penispump")
	if(state == "prepare_milking"):
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.BreastGroping, "tease", {pc="pc", npc="artica", npcBodyState={naked=true, hard=true}})
		breastMilking = (breastPumpID != "")
		penisMilking = (penisPumpID != "")
		isLact = (getCharacter("artica").isLactating())
		if (breastMilking && penisMilking):
			saynn("Constantly watching Artica's "+str("swollen" if isLact else "non-lactating")+" tits.. and her hard cock.. makes you want to see how much milk and seed you will be able to.. extract.. out of her.")

		elif (breastMilking):
			saynn("Constantly watching Artica's "+str("swollen" if isLact else "non-lactating")+" tits.. makes you want to see how much milk you will be able to.. extract.. out of them.")

		else:
			saynn("Constantly watching Artica's hard cock.. makes you want to see how much seed you will be able to.. extract.. out of it.")

		if (!isNaked):
			saynn("[say=pc]I wanna do something with you, Artica..[/say]")

			saynn("Her ears perks.")

			saynn("[say=artica]Oh?[/say]")

			saynn("[say=pc]..but we will need to get those clothes removed first.[/say]")

			if (isVerySlut):
				saynn("[say=artica]Sure.. not even sure why I'm still wearing them.. haha..[/say]")

			elif (isSlut):
				saynn("[say=artica]Sure.. I don't mind being naked near you.. haha..[/say]")

			else:
				saynn("[say=artica]Oh.. umm.. I guess no one but us here.. okay..[/say]")

			saynn("You help Artica to remove her lilac shirt and shorts, uncovering her {artica.breasts}, {artica.penis} and a cute little cyan slit that is hiding behind her balls.")

			saynn("After that, you help her to sit on the floor.. where it would be easier for you to put the pump"+str("s" if breastMilking else "")+" on her.")

		else:
			saynn("[say=pc]I wanna do something with you, Artica..[/say]")

			saynn("Her ears perks.")

			saynn("[say=artica]Oh?[/say]")

			saynn("[say=pc]Yeah.. and it's perfect that you're naked already. Let me..[/say]")

			saynn("Artica doesn't resist as you help her to land on the floor.. where it would be easier for you to put the pump"+str("s" if breastMilking else "")+" on her.")

		if (breastMilking):
			addButton("Pumps", "Start securing them", "secure_pumps")
		else:
			addButton("Penis pump", "Start securing it on her cock", "secure_pumps")
	if(state == "secure_pumps"):
		if (sybian):
			playAnimation(StageScene.SybianOral, "idle", {pc="artica", npc="pc", chained=true, bodyState={naked=true, hard=true}})
			saynn("[say=pc]Oh yeah.. almost forgot.[/say]")

			saynn("You point at the small device in the corner of your cell.")

			saynn("[say=pc]Sit on that.[/say]")

			saynn("Artica's eyes go wider.")

			if (isVerySlut):
				saynn("[say=artica]Mmm.. of course..[/say]")

			elif (isSlut):
				saynn("[say=artica]Mmm.. why not.. I know better than to say no..[/say]")

			else:
				saynn("[say=artica]Mmm.. okay.. this is probably required.. I know better than to say no..[/say]")

			saynn("Artica takes a spot on the sybian machine, letting a small rubber dildo penetrate her slit while her clit and balls rest on a small ridged platform.")

			saynn("Her eyes watch with great interest.. as you grab a small leash and chain the fluff to the machine.. without questioning it much.")

		else:
			playAnimation(StageScene.BreastGroping, "tease", {pc="pc", npc="artica", npcBodyState={naked=true, hard=true}})
		if (breastMilking):
			saynn("You carefully position the breast pumps over Artica's"+str(" milky" if isLact else "")+" breasts, the soft suction cups creating a tight seal around her tender nipples.")

		if (penisMilking):
			saynn(""+str("After that, you" if breastMilking else "You")+" reach out for the penis pump before positioning it over Artica's canine cock. You slide it on without much hassle, the pleasure ring is now hugging that cyan shaft tightly.")

		addButton("Start", "Turn on the pumps", "start_pumps")
	if(state == "start_pumps"):
		showFightUI = true
		if (sybian):
			playAnimation(StageScene.SybianOral, "ride", {pc="artica", npc="pc", chained=true, bodyState={naked=true, hard=true}})
		else:
			playAnimation(StageScene.BreastGroping, "tease", {pc="pc", npc="artica", npcBodyState={naked=true, hard=true}})
		if (breastMilking):
			saynn("With a soft click, you activate each of the breast pumps. Gentle whirring sound is filling the room as they began trying to draw out Artica's sweet milk.."+str(" really trying.." if !isLact else " without much problem it seems, the girl's breasts are lactating quite nicely.")+"")

			if (penisMilking):
				saynn("You weren't done yet. With a grin shining on your face, you reach for the penis pump and press a button that makes it spring to life! The pleasure ring begins to travel along Artica's cyan shaft, trying to milk her balls while the other pumps are milking the breasts already.")

				saynn("Artica is being milked with two types of pumps at once! Here is hoping she doesn't break..")

		else:
			saynn("With a soft click, you activate the penis pump. The pleasure ring begins to travel along Artica's cyan shaft, trying to milk her balls for all the seed that they contain. Gentle whirring sound is filling the room.. as well as a sound of stroking..")

		addButton("Continue", "See what happens next", "next_milk_cycle")
	if(state == "next_milk_cycle"):
		var isArticaClose = (getCharacter("artica").getArousal() > 0.6)
		var isCumming = (getCharacter("artica").getArousal() >= 1.0)
		showFightUI = true
		if (sybian):
			if (isArticaClose):
				playAnimation(StageScene.SybianOral, "intense", {pc="artica", npc="pc", chained=true, bodyState={naked=true, hard=true}})
			else:
				playAnimation(StageScene.SybianOral, "ride", {pc="artica", npc="pc", chained=true, bodyState={naked=true, hard=true}})
		else:
			if (isArticaClose):
				if (penisMilking || isCaged):
					playAnimation(StageScene.BreastGroping, "grope", {pc="pc", npc="artica", npcBodyState={naked=true, hard=true}})
				else:
					playAnimation(StageScene.BreastGroping, "stroke", {pc="pc", npc="artica", npcBodyState={naked=true, hard=true}})
			else:
				if (penisMilking || isCaged):
					playAnimation(StageScene.BreastGroping, "grope", {pc="pc", npc="artica", npcBodyState={naked=true, hard=true}})
				else:
					playAnimation(StageScene.BreastGroping, "stroke", {pc="pc", npc="artica", npcBodyState={naked=true, hard=true}})
		if (sybian):
			saynn("The sybian buzzes underneath Artica, stimulating her clit and pussy. The chain is keeping her from squirming too much.")

		else:
			saynn("Your warm embrace keeps Artica's from squirming too much.")

		if (beganLactating && !announcedLact):
			announcedLact = true
			saynn("Artica's breasts suddenly [b]began lactating[/b]! She lets out a passionate moan as milk begins to freely flow her perky cyan nipples. She blushes as her breasts finally respond to the stimulation.")

		if (breastMilking):
			if (milkCollected >= 1.0):
				if (RNG.chance(100.0/5.0)):
					saynn("Artica's nipples throb from the milking, milk squirting into the awaiting pumps with each pull who work relentlessly.")

				elif (RNG.chance(100.0/4.0)):
					saynn("Milk flows from Artica's engorged dark-cyan nipples, the breast pumps rhythmically coaxing out every drop.")

				elif (RNG.chance(33)):
					saynn("Milk flows as Artica moans, succumbing to the pumps' relentless pull on her dark nips.")

				elif (RNG.chance(50)):
					saynn("Artica's body quivers as her breast milk gets drawn out by the pumps, her nipples getting tugged on at a steady rate.")

				else:
					saynn("With each suction, Artica's nipples yield creamy milk, her breasts swelling with pleasure.")

				saynn("The breast pumps managed to collect "+str(str(Util.roundF(milkCollected, 1)))+" ml of milk!")

			else:
				saynn("The breast pumps tease Artica's nipples, her breasts responding eagerly to their tugging.")

				if (RNG.chance(100.0/5)):
					saynn("Pleasure courses through Artica's body as the pump works its magic on her sensitive nipples.")

				elif (RNG.chance(100.0/4)):
					saynn("The pump teases Artica's sensitive nipples, drawing out delicate moans of pleasure from her.")

				elif (RNG.chance(33)):
					saynn("The pumps tease Artica's nipples, not drawing much milk from them but sending pleasurable twinges throughout her full body.")

				elif (RNG.chance(50)):
					saynn("The breast pumps didn't collect any milk, pumping Artica's breasts fruitlessly.")

		if (penisMilking):
			if (RNG.chance(100.0/5)):
				saynn("Each stroke of the pump elicits a shiver from Artica, pre dripping from her cock.")

			elif (RNG.chance(100.0/4)):
				saynn("Artica's cock pulses, the pump's movements sending waves of pleasure coursing through her.")

			elif (RNG.chance(100.0/3)):
				saynn("With each pump's stroke, Artica's knot swells slightly more, pre flowing freely from the tip of her cock.")

			elif (RNG.chance(100.0/2)):
				saynn("Artica's cock twitches, the pump's relentless rhythm making her moan passionately.")

			else:
				saynn("Artica's cock twitches as the pump's ring slides along its length, her balls tensing.")

		if (RNG.chance(30) && getCharacter("artica").getArousal() > 0.7):
			if (RNG.chance(25)):
				saynn("Artica's cute noises fill the air, her body shaking with pleasure as she approaches orgasm.")

			elif (RNG.chance(33)):
				saynn("Artica's hips buck with excitement, her breath coming in short gasps as she nears climax.")

			elif (RNG.chance(50)):
				saynn("Artica is getting very close, her panting is hypnotizing, her heart pounding hard..")

			else:
				saynn("Her body is shivering, toes curling, tail swishing wildly. She is about to cum..")

		if (isCumming):
			saynn("Artica is about to cum..")

			addButton("Orgasm", "See what happens next", "artica_orgasm")
		else:
			addButton("Continue", "Milk Artica more", "next_milk_cycle")
			addButton("Enough", "Stop milking Artica for now", "enough_milking")
	if(state == "artica_orgasm"):
		showFightUI = true
		saynn("A powerful orgasm rocks Artica's body. She arches her body and shivers as her muscles tense up uncontrollably.")

		saynn("[say=artica]"+str(RNG.pick(["AhHh-h!..", "Ah-h..ah..ahh..", "t-too much.. ahh-h.. ahh.. nnyah..", "G-gods.. ahh-h.."]))+"[/say]")

		if (breastMilking && milkCollected > 1.0):
			saynn("Her tits are squirting milk into the breast pumps during this climax.")

			saynn("The breast pumps managed to collect "+str(str(Util.roundF(milkCollected, 1)))+" ml of milk!")

		if (penisMilking):
			if (RNG.chance(25)):
				saynn("Artica's cock pulses eagerly as the pump drains her balls dry, her cries of pleasure echoing in the cell.")

			elif (RNG.chance(33)):
				saynn("Artica's cock spasms and jerks, filling the pump with spurts of seed.")

			elif (RNG.chance(50)):
				saynn("The penis pump is working overtime to collect every drop of her cum that's erupting from her throbbing canine cock.")

			else:
				saynn("Her cock releases a torrent of hot, sticky seed. The pump eagerly is collecting every drop as she rides the wave of ecstasy.")

			saynn("The penis pump managed to collect "+str(str(Util.roundF(seedCollected, 1)))+" ml of seed!")

		addButton("Milk more", "Milk the fluff more", "next_milk_cycle")
		addButton("Enough", "Stop milking Artica for now", "enough_milking")
	if(state == "enough_milking"):
		saynn("You remove the pumps from Artica and let her recover.")

		if (hadOrgasm):
			saynn("[say=artica]Ah.. ah-.. ahh-h.. g-gods.. ah..[/say]")

		else:
			saynn("[say=artica]T-that f-felt good..[/say]")

		saynn("In the end, you managed to milk Artica for.. "+str(str(Util.roundF(milkTotal, 1))+" ml of milk" if breastMilking else "")+""+str(" and " if (breastMilking && penisMilking) else "")+""+str(str(Util.roundF(seedTotal, 1))+" ml of seed" if penisMilking else "")+"")

		var totalSmart = milkTotal + seedTotal
		if (totalSmart >= 800.0):
			saynn("Wow.. that seems like a really good yield!")

		elif (totalSmart >= 500.0):
			saynn("That seems like a pretty good yield!")

		elif (totalSmart >= 300.0):
			saynn("Not bad of a yield.. even though you feel like Artica is capable of more.")

		elif (totalSmart >= 100.0):
			saynn("A little on the small side.. but still.. Better than nothing!")

		elif (totalSmart >= 1.0):
			saynn("That wasn't much at all.. Maybe you should let Artica rest more.")

		else:
			saynn("You didn't manage to get anything this time.. Maybe next time!")

		saynn("You bring her back into the main hall.")

		addButton("Continue", "See what happens next", "endthescene")
func addPumpButtons(go_id):
	var pumps = GM.pc.getInventory().getItemsWithTag(ItemTag.BreastPump)
	for pump in pumps:
		addButton(pump.getVisibleName(), pump.getVisibleDescription(), go_id, [pump])

func addPenisPumpButtons(go_id):
	var pumps = GM.pc.getInventory().getItemsWithTag(ItemTag.PenisPump)
	for pump in pumps:
		addButton(pump.getVisibleName(), pump.getVisibleDescription(), go_id, [pump])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "toggle_sybian"):
		sybian = !sybian
		return

	if(_action == "do_pick_nobreastpump"):
		breastPumpID = ""
		setState("")
		return

	if(_action == "do_pick_breastpump"):
		var pump = _args[0]
		breastPumpID = pump.getUniqueID()
		#GM.pc.getInventory().removeItem(pump)
		#getCharacter("artica").getInventory().forceEquipRemoveOther(pump)
		setState("")
		return

	if(_action == "do_pick_nopenispump"):
		penisPumpID = ""
		setState("")
		return

	if(_action == "do_pick_penispump"):
		var pump = _args[0]
		penisPumpID = pump.getUniqueID()
		#GM.pc.getInventory().removeItem(pump)
		#getCharacter("artica").getInventory().forceEquipRemoveOther(pump)
		setState("")
		return

	if(_action == "secure_pumps"):
		if(breastPumpID!=""):
			var pump = GM.pc.getInventory().getItemByUniqueID(breastPumpID)
			if(pump != null):
				GM.pc.getInventory().removeItem(pump)
				getCharacter("artica").getInventory().forceEquipRemoveOther(pump)
		if(penisPumpID!=""):
			var pump = GM.pc.getInventory().getItemByUniqueID(penisPumpID)
			if(pump != null):
				GM.pc.getInventory().removeItem(pump)
				getCharacter("artica").getInventory().forceEquipRemoveOther(pump)

	if(_action == "start_pumps"):
		getCharacter("artica").addLust(5)
		getCharacter("artica").addArousal(getCharacter("artica").getLustLevel()*0.1)

	if(_action == "next_milk_cycle"):
		processTime(1*60)
		milkCollected = 0.0
		getCharacter("artica").addLust(RNG.randi_range(8, 12))
		getCharacter("artica").addArousal(getCharacter("artica").getLustLevel()*0.2)
		if(breastMilking):
			var beganLactatingNow = getCharacter("artica").stimulateLactation()
			if(beganLactatingNow):
				beganLactating = true
			var pumpItem = getCharacter("artica").getInventory().getItemByUniqueID(breastPumpID)
			if(pumpItem != null):
				var howMuchToExtract = RNG.randf_range(pumpItem.getMilkSpeedPerMinuteMin(), pumpItem.getMilkSpeedPerMinuteMax()) / (6.0 - getCharacter("artica").getArousal()*4.0)
				var howMuchCollected = getCharacter("artica").getBodypart(BodypartSlot.Breasts).getFluids().transferAmountTo(pumpItem, howMuchToExtract)
				milkCollected = howMuchCollected
		milkTotal += milkCollected

	if(_action == "artica_orgasm"):
		hadOrgasm = true
		processTime(60)
		seedCollected = 0.0
		getCharacter("artica").addLust(-int(getCharacter("artica").getLust() * 0.5))
		getCharacter("artica").setArousal(0.0)
		if(getCharacter("artica").getWornPenisPump() != null):
			seedCollected = getCharacter("artica").cumInItem(getCharacter("artica").getWornPenisPump())
		seedTotal += seedCollected
		getCharacter("artica").orgasmFrom("pc")
		
		milkCollected = 0.0
		if(breastMilking):
			var pumpItem = getCharacter("artica").getInventory().getItemByUniqueID(breastPumpID)
			if(pumpItem != null):
				var howMuchToExtract = RNG.randf_range(pumpItem.getMilkSpeedPerMinuteMin(), pumpItem.getMilkSpeedPerMinuteMax())
				var howMuchCollected = getCharacter("artica").getBodypart(BodypartSlot.Breasts).getFluids().transferAmountTo(pumpItem, howMuchToExtract)
				milkCollected = howMuchCollected
		milkTotal += milkCollected

	if(_action == "enough_milking"):
		getCharacter("artica").setArousal(0.0)
		if(breastPumpID != ""):
			var pump = getCharacter("artica").getInventory().getItemByUniqueID(breastPumpID)
			if(pump != null):
				getCharacter("artica").getInventory().removeEquippedItem(pump)
				GM.pc.getInventory().addItem(pump)
		if(penisPumpID != ""):
			var pump = getCharacter("artica").getInventory().getItemByUniqueID(penisPumpID)
			if(pump != null):
				getCharacter("artica").getInventory().removeEquippedItem(pump)
				GM.pc.getInventory().addItem(pump)
		var totalSmart = milkTotal + seedTotal
		if(totalSmart >= 500.0):
			GM.pc.addSkillExperience(Skill.Milking, 50)
			getModule("ArticaModule").addCorruption(0.02)
		if(breastMilking):
			getCharacter("artica").addEffect(StatusEffect.SoreNipplesAfterMilking)
		getModule("ArticaModule").makeLusty()

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
	data["breastPumpID"] = breastPumpID
	data["penisPumpID"] = penisPumpID
	data["sybian"] = sybian
	data["breastMilking"] = breastMilking
	data["penisMilking"] = penisMilking
	data["isLact"] = isLact
	data["seedCollected"] = seedCollected
	data["milkCollected"] = milkCollected
	data["seedTotal"] = seedTotal
	data["milkTotal"] = milkTotal
	data["beganLactating"] = beganLactating
	data["announcedLact"] = announcedLact
	data["hadOrgasm"] = hadOrgasm

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
	breastPumpID = SAVE.loadVar(data, "breastPumpID", "")
	penisPumpID = SAVE.loadVar(data, "penisPumpID", "")
	sybian = SAVE.loadVar(data, "sybian", false)
	breastMilking = SAVE.loadVar(data, "breastMilking", false)
	penisMilking = SAVE.loadVar(data, "penisMilking", false)
	isLact = SAVE.loadVar(data, "isLact", false)
	seedCollected = SAVE.loadVar(data, "seedCollected", 0.0)
	milkCollected = SAVE.loadVar(data, "milkCollected", 0.0)
	seedTotal = SAVE.loadVar(data, "seedTotal", 0.0)
	milkTotal = SAVE.loadVar(data, "milkTotal", 0.0)
	beganLactating = SAVE.loadVar(data, "beganLactating", false)
	announcedLact = SAVE.loadVar(data, "announcedLact", false)
	hadOrgasm = SAVE.loadVar(data, "hadOrgasm", false)
