extends SceneBase

func _init():
	sceneID = "VionFreed"

func _run():
	if(state == ""):
		addCharacter("vion")
		playAnimation(StageScene.Duo, "stand", {npc="vion"})
		saynn("You pull out the foxy's datapad and tap through the diagnostic tools he'd preinstalled.")
		saynn("[say=vion]What are you up to?[/say]")
		saynn("[say=pc]That's a surprise~[/say]")
		saynn("Alex said he'd manage in an hour without these tools. Surely you can match that time with them?")

		addButton("Hack", "How hard could it be?", "hack_cage")
		
	if(state == "hack_fail"):
		saynn("With a frustrated snort, you decide to abandon your efforts for now.")
		saynn("[say=vion]Everything okay?[/say]")
		saynn("[say=pc]Yeah, no, I'm fine. It's just a bit harder than I expected.[/say]")
		saynn("[say=vion]Well, whatever you're up to I'm sure you'll figure it out.[/say]")
		
		addButton("Leave", "You'll get it right next time.", "hack_fail_after")

	if(state == "hack_succeed"):
		saynn("Well that wasn't too bad. You click the confirm button with a flourish.")
		saynn("*click*")
		saynn("Both your and Vion's eyes are magnetized to his crotch. Its only a hearbeat later that a tent starts to form.")
		saynn("[say=vion]Did you just-[/say]")
		saynn("[say=pc]Yup. You can thank me later.[/say]")
		saynn("[say=vion]...I can thank you [i]now[/i].[/say]")
		saynn("The almost animalistic fierceness of that statement catches you somewhat off guard.")
		saynn("[say=vion]Unless you aren't interested, in which case I'd suggest you vacate this cell for the next few hours.[/say]")

		addButton("Bail", "This seems like your exit cue.", "bail")
		addButton("Ride it out", "What, and miss out on the price?", "ride_it_out")

	if(state == "bail"):
		saynn("[say=pc]I'll leave you to it. Have fun![/say]")
		saynn("[say=vion]Oh, I will.[/say]")

		saynn("Making sure to scoop up the cage first, you let yourself out, Vion hot on your heels. He leans out and flags down a passing lynx.")
		saynn("[say=vion]Hey! You up for a fuck?[/say]")
		saynn("The lynx barely has time to voice an affirmative before Vion drags him inside by his collar. You decide to give the two some privacy and make a hasty exit, though not fast enough to hear some quite excited noises behind you as you go.")

		addButton("Leave", "", "endthescene")

	if(state == "ride_it_out"):
		saynn("[say=pc]No, I'm up for it. So should we-[/say]")
		saynn("You're interrupted by Vion roughly grabbing you by the collar and pulling you close. Noses nearly touching, he stares you down.")
		saynn("[say=vion][b]Sleep.[/b][/say]")
		saynn("The authority in the command is irrefutable. Your thoughts shatter into a million pieces, your knees go weak, and you [i]drop[/i].")
		saynn("[say=vion]And [b]kneel.[/b][/say]")
		
		addButton("Kneel", "", "sex_1")

	if(state == "sex_1"):
		playAnimation(StageScene.SexOral, "fast", {npc="pc", pc="vion", bodyState={exposedCrotch=true, hard=true}})
		saynn("You sink to your knees before him, silenced and obedient, your vision a blur.")
		saynn("You are subdued, lost in a hazy fog, only distantly aware of what's happening.")
		
		addButton("Submit", "", "sex_2")

	if(state == "sex_2"):
		playAnimation(StageScene.SexStanding, "fast", {npc="pc", pc="vion", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true}})	
		saynn("At some point your clothes come off.")
		saynn("Vion does his best to make up for lost time, your body serving as the tool of his relief. Your mind is only along for the ride.")

		addButton("Obey", "", "sex_3")
		
	if(state == "sex_3"):
		playAnimation(StageScene.SexMissionary, "sex", {npc="pc", pc="vion", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("Your body experiences pure, distilled pleasure and bliss.")
		saynn("You mind drifts in a hazy, mindless, submissive trance, your thoughts silent, your will subdued.")
		
		addButton("Serve", "", "sex_4")

	if(state == "sex_4"):
		playAnimation(StageScene.SexAllFours, "fastflop", {npc="pc", pc="vion", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("Details are lost to time, your focus too dedicated to pleasure to remember anything else.")
		saynn("The one thought you do manage to think is... [i]Totally[/i] worth it.")	
		
		addButton("...", "", "sex_after")

	if(state == "sex_after"):
		playAnimation(StageScene.Sleeping, "sleep", {npc="vion", pc="pc", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("A few hours later...")
		
		saynn("[say=vion]Hey. Hey {pc.name}.[/say]")
		saynn("[say=pc]Mmh?[/say]")
		saynn("[say=vion]That wasn't too intense, I hope? Are you still with me?[/say]")
		saynn("You manage to slur out a response.")
		saynn("[say=pc]Nnh. I'm... I'm fi-ine.[/say]")
		saynn("[say=vion]Well. That's good. Hope you don't mind, but I'm going to nap for a while.[/say]")
		saynn("[say=pc]Nnnah tha's... all good.[/say]")
		
		addButton("Get up", "", "get_up")
		
	if(state == "get_up"):
		playAnimation(StageScene.Solo, "stand", {pc="pc", bodyState={naked=true}})
		saynn("You slowly untangle yourself from Vion's arms. As your thoughts slowly surface, you remember to collect Vion's cage. He's certainly not going to miss it. It's only after you stumble out of his cell that you consider that you should probably dress yourself.")
		addButton("Leave", "", "endthescene")

func _react_scene_end(_tag, _result):
	if(_tag == "computerhack"):
		if(_result[0] == true):
			setState("hack_succeed")
			setFlag("HypnokinkModule.Vion_FreedFromCage", true)
			setFlag("HypnokinkModule.VionTopicKnown_Backstory", true) # in case didnt see this yet somehow
		else:
			setState("hack_fail")
		
func _react(_action: String, _args):
	if(_action == "hack_cage"):
		runScene("ComputerSimScene", ["DatapadHackComputer"], "computerhack")
	
	if(_action == "ride_it_out"):
		GM.pc.addLust(80)
		
	if(_action == "sex_1"):
		GM.pc.addLust(20)
		HypnokinkUtil.raiseSuggestibilityTo(GM.pc, 75)
		
	if(_action == "sex_2"):
		HypnokinkUtil.raiseSuggestibilityTo(GM.pc, 75)
		
	if(_action == "sex_2"):
		HypnokinkUtil.raiseSuggestibilityTo(GM.pc, 75)
		processTime(30 * 60)
		GM.pc.cummedInMouthBy("vion")
		
	if(_action == "sex_3"):
		GM.pc.orgasmFrom("vion")
		GM.pc.addLust(100)
		HypnokinkUtil.raiseSuggestibilityTo(GM.pc, 75)
		processTime(30 * 60)
		if(GM.pc.hasReachableAnus()):
			GM.pc.cummedInAnusBy("vion")
		elif(GM.pc.hasReachableVagina()):
			GM.pc.cummedInVaginaBy("vion")
		else:
			GM.pc.cummedOnBy("vion")
			
	if(_action == "sex_4"):
		GM.pc.orgasmFrom("vion")
		GM.pc.addLust(100)
		HypnokinkUtil.raiseSuggestibilityTo(GM.pc, 75)
		processTime(30 * 60)
		if(GM.pc.hasReachableVagina()):
			GM.pc.cummedInVaginaBy("vion")
		elif(GM.pc.hasReachableAnus()):
			GM.pc.cummedInAnusBy("vion")
		else:
			GM.pc.cummedOnBy("vion")
		
	if(_action == "sex_after"):
		GM.pc.addLust(-80)
		HypnokinkUtil.raiseSuggestibilityTo(GM.pc, 75)
		processTime(30 * 60)
		GM.pc.cummedOnBy("vion")
		
	if(_action == "get_up"):
		HypnokinkUtil.changeSuggestibilityBy(GM.pc, -125)
		HypnokinkUtil.raiseSuggestibilityTo(GM.pc, 30)
		
	if(_action == "hack_fail_after"):
		runScene("VionRepeatConversation")
		endScene()
		return
		
	if(_action == "endthescene"):
		setFlag("HypnokinkModule.Vion_HaveDatapad", false)
		setFlag("HypnokinkModule.Vion_HaveCage", true)
		endScene()
		return

	setState(_action)
