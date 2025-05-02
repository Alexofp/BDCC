extends SceneBase

func _init():
	sceneID = "ElizaDrugTestHuCowScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("[say=pc]Why not try this one? You like milking, don't you?[/say]")

		saynn("Eliza raises a brow.")

		saynn("[say=eliza]I'm usually the one doing it.[/say]")

		saynn("[say=pc]So? Do you hate it?[/say]")

		saynn("[say=eliza]Well, no, obviously.. lactation is hot..[/say]")

		saynn("She looks down at her chest.")

		saynn("[say=eliza]I think my breasts are okay as they are.[/say]")

		saynn("[say=pc]But they could be so much bigger.[/say]")

		saynn("[say=eliza]That's a lot of extra weight. I need to stay nimble, I'm a cat![/say]")

		saynn("You put on the most pleading eyes that you can, your lips shivering like you're about to start crying in front of her.")

		saynn("Eliza sees it.. and sighs.")

		saynn("[say=eliza]Doesn't hurt to try it. I already forgot, doesn't it come with other side-effects?[/say]")

		saynn("[say=pc]I don't think so-o-o-o?[/say]")

		saynn("You look away, innocently.")

		saynn("Eliza puts the fresh pill onto her tongue.. and lets it dissolve.")

		saynn("Doesn't take long for it to start taking effect.")

		saynn("A warm wave rushes through Eliza's body. Her spine arches as her blue top suddenly becomes a little too tight for her, straining at the seams.")

		saynn("[say=eliza]Oops..[/say]")

		addButton("Continue", "See what happens next", "eliza_tfs")
	if(state == "eliza_tfs"):
		addCharacter("eliza", ["naked"])
		playAnimation(StageScene.TFLook, "breasts", {pc="eliza", bodyState={exposedChest=true, hard=true}})
		saynn("Her breasts swell beneath the fabric, getting bigger and bigger until the top gets ripped to shreds!")

		saynn("[say=eliza]I didn't think it would happen so fast![/say]")

		saynn("Her bra is still holding.. but not for long. With a loud PLING, one of the clasps fails and flies off, setting her melons free.")

		saynn("[say=eliza]AH! My top![/say]")

		saynn("While her tits are blossoming outward, the rest of her body changes to accommodate for that new weight, becoming thicker and curvier, her ass sticking out more, thighs getting wider.")

		saynn("Eliza's breath hitches as she struggles to stand still, her new chest swaying and bouncing, nips growing stiff and milky. Little rivers of her milk already begin trailing down her new curves, her breasts overflowing with that stuff.")

		saynn("[say=eliza]Mmhh..[/say]")

		saynn("She cups her own chest, feeling its weight.")

		saynn("[say=eliza]So heavy.. hah..[/say]")

		saynn("Her paws squeeze the fun bags slightly, making them squirt milk.")

		saynn("[say=eliza]Ah.. Feels kinda good.[/say]")

		saynn("She bites her lip.")

		saynn("[say=pc]Need the blue pill?[/say]")

		saynn("Her ears perk towards you.")

		saynn("[say=eliza]Oh.. well.. uh.. what does the blue one do again.. mmh.. doesn't matter.. maybe we can..[/say]")

		saynn("She sways her hips slightly, presenting her enormous chest.")

		saynn("[say=eliza]No.. What was I thinking about.. before.. Something about my blue top.. I can't think straight for some reason.[/say]")

		saynn("[say=pc]Why not?[/say]")

		saynn("Her paws keep cupping and kneading her chest.")

		saynn("[say=eliza]Because of these.. huge.. milky.. tits.. So heavy.. nips are itching..[/say]")

		saynn("She looks at you with needy eyes, cheeks blushing.")

		saynn("[say=eliza]Could you help drain the milk out of them maybe?.. Please.. mmhh..[/say]")

		saynn("Poor kitty, desperate for some milking now.")

		saynn("[say=pc]It looks like it will take hours.[/say]")

		saynn("[say=eliza]Please![/say]")

		saynn("Right. You think about it for a second.")

		saynn("[say=pc]I guess we could use the pumps. Let's go.[/say]")

		saynn("You use her amulet as a make-shift leash, pulling her out of the lab and towards the milking room. Nurses look at Eliza's tits with big open eyes.")

		saynn("[say=eliza]Hello.. d-don't mind us..[/say]")

		addButton("Lock her in", "Prepare Eliza for milking", "lock_eliza_in")
	if(state == "lock_eliza_in"):
		playAnimation(StageScene.MilkingStallSolo, "milking", {pc="eliza", bodyState={naked=true, hard=true, chains=[["hoseshort", "breastpump", "scene", "milktank"]]}})
		aimCameraAndSetLocName("med_milkingroom")
		saynn("You guide Eliza towards the stalls, entering one that is equipped with the industrial breast pumps setup.")

		saynn("With gentle firmness, you help Eliza to bend forward, before locking her wrists to a long pipe.")

		saynn("In this position, her massive breasts are hanging below her chest, like udders.")

		saynn("[say=eliza]Milk me.. please..[/say]")

		saynn("[say=pc]One moment.[/say]")

		saynn("After making sure she is properly secured, you grab the two suction cups that are connected to the big milk tank with flexible tubes. You secure those around Eliza's areolas with a satisfying hiss, some of the air getting sucked out already.")

		saynn("You flick a switch.. and the pumps spring to life with a low rumble, alternating between strong draws and then slow releases.")

		saynn("[say=eliza]Ah~..[/say]")

		saynn("Milk jets through the clear tubing as Eliza's breasts begin to produce.. produce a lot. Each suction sends jolts of electric pleasure across her nerves. Her large, sensitive nips throb inside the cups, spawning lots of little beads of milk.")

		addButton("Continue", "See what happens next", "milk_fast")
	if(state == "milk_fast"):
		playAnimation(StageScene.MilkingStallSolo, "fast", {pc="eliza", bodyState={naked=true, hard=true, chains=[["hoseshort", "breastpump", "scene", "milktank"]]}})
		saynn("Eliza's breath comes in ragged pants, her spine arches involuntarily, her legs shivering. The pumps keep alternating between fierce suctions and gentle releases, keeping the flow nice and steady, milk spattering against the walls of the pump cups before streaming down into the tubes.")

		saynn("[say=eliza]Ah.. ah.. feels so good.. more.. mo-..-re..[/say]")

		saynn("Her moans grow louder and hotter. Every breath is a whisper of need. You're glad that you don't have to do it yourself, those pumps are working hard, each suction is making her tits bounce and jiggle.")

		saynn("Standing behind her.. is quite a view. Her tail is pulled to the side, giving you access to her holes, just as needy as the rest of her body, her slick juices dripping down her inner thighs.")

		saynn("[say=eliza]I'm g-gonna cum.. ah.. f-fuck.. I'm g-gonna..[/say]")

		saynn("Eliza's legs shake, her fists clenching.. Then, without warning, the pumps increase onslaught, tugging on the girl's nips with extra pressure. It becomes too much..")

		addButton("Continue", "See how she cums", "eliza_cums")
	if(state == "eliza_cums"):
		playAnimation(StageScene.MilkingStallSolo, "cum", {pc="eliza", bodyState={naked=true, hard=true, chains=[["hoseshort", "breastpump", "scene", "milktank"]]}})
		saynn("[say=eliza]Moo-o-o~..[/say]")

		saynn("A cute animal noise escapes from the kitty as a tidal wave of pleasure begins flowing through her. Her body squirms hard as her nipples squirt high-pressure jets of milk directly into the cups, almost overwhelming the system.")

		saynn("Little geysers of the white, creamy fluid escape from her swollen nips as the pump motors whine, sucking down every drop.")

		saynn("[say=eliza]Moo.. moo-o~..[/say]")

		saynn("Eliza's noises echo around the stall while her legs buckle, hips trembling, the aftershocks rippling through her. The pumps keep on pumping, hungrily drawing out the rest of the milk from her udders with mechanical pressure.")

		addButton("Continue", "See what happens next", "after_milking")
	if(state == "after_milking"):
		playAnimation(StageScene.MilkingStallSolo, "milking", {pc="eliza", bodyState={naked=true, hard=true, chains=[["hoseshort", "breastpump", "scene", "milktank"]]}})
		saynn("When Eliza returns from her peak, she is left panting, her udders now slightly less voluminous.. but still looking heavy.")

		saynn("You turn off the pumps, letting her rest.")

		saynn("[say=eliza]..mhh.. hh-hhah.. ah..[/say]")

		saynn("[say=pc]Felt good, huh?[/say]")

		saynn("[say=eliza]Ye-ess..[/say]")

		saynn("[say=pc]Good cow.[/say]")

		saynn("[say=eliza]Moo~..[/say]")

		saynn("You let her recover her breath before proceeding to remove the pumps and unlock the restraints.")

		addButton("Lab", "Get back to the lab with her", "back_to_the_lab")
	if(state == "back_to_the_lab"):
		aimCameraAndSetLocName(GM.pc.getLocation())
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcBodyState={exposedChest=true}})
		saynn("You bring Eliza back to the lab.")

		saynn("[say=pc]Wanna stay like this?[/say]")

		saynn("She hums while staring at her giant tits.")

		saynn("[say=eliza]They're cool.. but.. they require a lot of looking after them. You know..[/say]")

		saynn("[say=pc]Milking.[/say]")

		saynn("[say=eliza]Yeah. If I wasn't a doctor, I'd probably stay a milky cow.. why not..[/say]")

		saynn("She finds a blue pill and eats it.")

		saynn("Her ample forms begin to get less impressive, gradually losing their volume. Her udders don't sag as much anymore, reaching Eliza's normal size.")

		saynn("[say=eliza]Ah.. much better.[/say]")

		saynn("Some milk still drips from the perky nips.")

		saynn("[say=eliza]I guess I'm left lactating for a while.. Free milk for my coffee, hah.[/say]")

		saynn("You nod and watch Eliza go back to her spot.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "eliza_tfs"):
		processTime(3*60)
		setFlag("ElizaModule.elizatf_body", "hucow")
		getCharacter("eliza").updateBodyparts()
		getCharacter("eliza").induceLactation()
		getCharacter("eliza").fillBreasts()
		getCharacter("eliza").fillBreasts()

	if(_action == "lock_eliza_in"):
		processTime(5*60)
		var thePump = GlobalRegistry.createItem("BreastPump")
		var theFluids = thePump.getFluids()
		theFluids.addFluid("Milk", 400.0)
		getCharacter("eliza").getInventory().forceEquipStoreOtherUnlessRestraint(thePump)

	if(_action == "milk_fast"):
		processTime(5*60)
		var thePump = getCharacter("eliza").getInventory().getEquippedItem(InventorySlot.UnderwearTop)
		if(thePump):
			var theFluids = thePump.getFluids()
			if(theFluids):
				theFluids.addFluid("Milk", 1200.0)

	if(_action == "eliza_cums"):
		processTime(3*60)
		var thePump = getCharacter("eliza").getInventory().getEquippedItem(InventorySlot.UnderwearTop)
		if(thePump):
			var theFluids = thePump.getFluids()
			if(theFluids):
				theFluids.addFluid("Milk", 8200.0)
		GM.main.SCI.processMilkCharacterCustom(getCharacter("eliza"), BodypartSlot.Breasts)

	if(_action == "after_milking"):
		processTime(3*60)

	if(_action == "back_to_the_lab"):
		processTime(3*60)
		getCharacter("eliza").getInventory().clearSlot(InventorySlot.UnderwearTop)
		setFlag("ElizaModule.elizatf_body", "")
		getCharacter("eliza").updateBodyparts()
		if(!getFlag("ElizaModule.tfcan_hucow", false)):
			setFlag("ElizaModule.tfcan_hucow", true)
			addMessage("Eliza can grow big udders if you tell her to.")

	setState(_action)
