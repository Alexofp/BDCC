extends SceneBase

var anger = 0.0
var corruption = 0.0
var lust = 0.0
var buttScore = 0
var waterScore = 0
var sawBefore = false
var wasRektBefore = false

func _init():
	sceneID = "jackiUrinalScene"

func _reactInit():
	getCharacter("jacki").updateBodyparts()

func _run():
	if(state == ""):
		anger = getFlag("JackiModule.jackiAnger", 0.0)
		corruption = getFlag("JackiModule.jackiCorruption", 0.0)
		lust = getFlag("JackiModule.jackiLust", 0.0)
		buttScore = getModule("JackiModule").getSkillScore("jackiSkillButtslut")
		waterScore = getModule("JackiModule").getSkillScore("jackiSkillWatersports")
		sawBefore = (getFlag("JackiModule.BathroomBulliesSceneHappened", false) || getFlag("GymModule.Gym_BullyGangIntroduced", false))
		wasRektBefore = (getFlag("JackiModule.BathroomBulliesBecameCumToilet", false) || getFlag("JackiModule.BathroomBulliesBecamePissToilet", false))
		saynn("You thought you saw Jacki here.. but no.. her yoga mat is unoccupied.")

		saynn("Is she in trouble again? That wolfie is quite unlucky, huh.")

		saynn("You look around. No, she is not being a punching bag this time. You do hear some noises coming from the bathroom though..")

		addButton("Investigate", "See what is it about", "investigate")
	if(state == "investigate"):
		aimCameraAndSetLocName("main_bathroom2")
		GM.pc.setLocation("main_bathroom2")
		addCharacter("jacki", ["naked"])
		addCharacter("gymbully")
		addCharacter("gymbully2")
		addCharacter("gymbully3")
		playAnimation(StageScene.UrinalPeeing, "idle", {pc="jacki", npc="gymbully", bodyState={naked=true}})
		saynn("You walk in on quite a scene. Jacki is chained to one of the urinals while a group of 3 gang members stand nearby.. "+str("Quite a familiar group in fact.." if sawBefore else "")+""+str(" You remember them chaining you to one of those urinals too.." if wasRektBefore else "")+"")

		saynn("One of them is clearly the leader of the group. He advertises Jacki to inmates that are passing by while Jacki is doing her best to try to escape.")

		saynn("[say=gymbully]Don't pass up on this unique opportunity! A special toilet, eager to satisfy your most basic needs! Only 10 creds per use. Look at how cute her muzzle is.[/say]")

		saynn("Jacki growls and tries to shake off her ring gag harness.")

		if (wasRektBefore):
			saynn("The leader notices you.")

			saynn("[say=gymbully]Oh. Wait a minute. I remember you. You were in her spot at some point. Hah~.[/say]")

			saynn("Jacki tilts her head while she hears that, her tight ring gag makes it hard to say anything.")

			saynn("Beside the main guy, there are also two other gang members. One of them seems to be quiet while the second is that annoying girl.")

			saynn("[say=gymbully3]Wowies! The meat toilet pay piggy has come back for more!?[/say]")

		elif (sawBefore):
			saynn("The leader notices you.")

			saynn("[say=gymbully]Familiar face. I think I saw you before. What do you think, guys?[/say]")

			saynn("Beside the main guy, there are also two other gang members. One of them seems to be quiet while the second is that annoying girl.")

			saynn("[say=gymbully3]Wowies! Yes, I remember this little bitch-{pc.boy}~.[/say]")

			saynn("[say=gymbully]Don't be an ass and we won't have any problems with each other.[/say]")

		else:
			saynn("The leader notices you.")

			saynn("[say=gymbully]Hey there. Looks like you are interested. Fancy relieving yourself using this meat toilet?[/say]")

			saynn("Beside the main guy, there are also two other gang members. One of them seems to be quiet while the second is a girl.")

			saynn("[say=gymbully3]Yeah. This bitch is really eager for some piss or cum![/say]")

		saynn("Looks like they are running a business here.")

		addButton("Intimidate", "Tell them to free Jacki right now", "intimidate")
		addButton("Question", "Ask why is Jacki cuffed to an urinal", "quesiton")
	if(state == "intimidate"):
		playAnimation(StageScene.Duo, "stand", {npc="gymbully3"})
		saynn("You must get Jacki out of there as fast as possible.")

		saynn("[say=pc]Let her go. Now. Or you will regret it.[/say]")

		saynn("You walk towards their leader.. but the annoying girl blocks your path.")

		saynn("[say=gymbully3]Nu huh, bitch-{pc.boy}~. Cool down, you look pathetic for a hero~.[/say]")

		saynn("[say=gymbully]Gym is our territory. And this little slut thought she could use the equipment there without paying.[/say]")

		saynn("[say=pc]It's not your territory.[/say]")

		saynn("The leader shrugs and smiles, ignoring your words.")

		saynn("[say=gymbully]She has accumulated quite a debt by now. 45 creds. And so she isn't walking away until I see them. One way or another.[/say]")

		saynn("[say=gymbully3]Yeah, pay up, little piggy~.[/say]")

		saynn("[say=gymbully]Otherwise.. You really think you can win against the three of us?[/say]")

		saynn("The lady shows you her subtle muscles and sticks her tongue out at you.")

		saynn("Looks like Jacki silently appreciates your braveness. Means you can't back away now.. But are you sure you're gonna win 3 fights in a row?..")

		addButton("Fight", "Start a fight with all three", "dec_fight")
		addButtonWithChecks("Pay 45 creds", "Pay for Jacki's debt", "dec_payfordept", [], [[ButtonChecks.HasCredits, 45]])
	if(state == "quesiton"):
		saynn("[say=pc]So.. Why did you cuff her to the urinal? Just for fun?[/say]")

		saynn("The leader raises a brow.")

		saynn("[say=gymbully]Fun? Why would we punish someone just for fun.[/say]")

		if (corruption > 0.8):
			saynn("You can't stop yourself from coughing a few times for some reason. Jacki lowers her gaze.")

		else:
			saynn("Jacki lowers her gaze.")

		saynn("[say=gymbully]This girl used the equipment here. Without paying us. Multiple times.[/say]")

		saynn("The annoying girl walks up to Jacki and starts tickling her. Jacki huffs and squirms.")

		saynn("[say=gymbully3]And now she is paying with her body~.[/say]")

		saynn("[say=gymbully]So? Do you wish to use her?[/say]")

		saynn("Jacki looks.. dry.. for now.")

		addButton("Intimidate", "Tell them to free Jacki right now", "intimidate")
		addButtonWithChecks("Use Jacki", "Pay 10 credits and use Jacki", "pay10", [], [[ButtonChecks.HasCredits, 10]])
		addButton("Offer self", "Offer them to cuff you to the urinal instead", "offerself")
		addButton("Just leave", "Whatever. It's not your problem", "just_leave")
	if(state == "just_leave"):
		saynn("[say=pc]No. I'm good.[/say]")

		saynn("The leader shrugs.")

		saynn("[say=gymbully3]What are you looking at then, stupid. GO AWAY.[/say]")

		saynn("Jacki's eyes become wide as she sees you walk away.")

		saynn("But at least you saved your credits and your face.")

		addButton("Continue", "See what happens next", "endthescene_removerestraints")
	if(state == "dec_fight"):
		playAnimation(StageScene.Duo, "stand", {npc="gymbully3"})
		saynn("Well.. Looks like you will have to fight all of them. First one is the girl. You take the combat stance while she just giggles.")

		saynn("[say=gymbully3]So serious. Fine, let's fuck around~.[/say]")

		addButton("Fight", "Start the fight", "first_fight")
	if(state == "won_firstfight"):
		playAnimation(StageScene.Duo, "stand", {npc="gymbully2"})
		saynn("The annoying girl is down on her knees. Next is the quiet guy.")

		saynn("[say=pc]What? You're not gonna say anything even now?[/say]")

		saynn("His lips silently say 'fuck you'.")

		addButton("Fight", "Start the fight", "second_fight")
	if(state == "won_secondfight"):
		playAnimation(StageScene.Duo, "stand", {npc="gymbully"})
		saynn("The silent guy got beaten by you. Only their leader is left. Jacki actually begins to have hope for you.")

		saynn("[say=gymbully]It's not over yet.[/say]")

		addButton("Fight", "Start the fight", "third_fight")
	if(state == "won_thirdfight"):
		removeCharacter("gymbully3")
		removeCharacter("gymbully2")
		removeCharacter("gymbully")
		playAnimation(StageScene.Urinal, "idle2", {pc="jacki", bodyState={naked=true}})
		saynn("You defeat all of the gang members! The last one has kneeled before you, unable to continue fighting.")

		saynn("[say=gymbully3]Lucky bitch! Enjoy your sad little victory![/say]")

		saynn("They quickly leave the bathroom, supporting each other.")

		saynn("Now it's just you and Jacki.")

		if (anger > -0.1):
			saynn("[say=jacki]Don't know why.. But thanks![/say]")

		else:
			saynn("[say=jacki]Thank you. Don't know what I would do..[/say]")

		saynn("Hard to understand what she is saying.")

		saynn("She looks so vulnerable.. huh.. Makes you wonder if she gets into these situations on purpose.")

		addButton("Free her", "Free the wolfie", "free_jacki_afterwin")
		addButton("Use her", "There are a few ways to use her in her current position..", "use_jacki")
	if(state == "free_jacki_afterwin"):
		playAnimation(StageScene.Hug, "hug", {npc="jacki", npcBodyState={naked=true}})
		saynn("It takes you a while but you manage to remove Jacki's restraints. Then you carefully get her out of that precarious position. Her clothes are nowhere in sight though.")

		saynn("[say=jacki]I think they're stolen.. It's okay. I will find new ones.[/say]")

		saynn("She offers you a warm hug, wrapping her arms around you while her {jacki.breasts} are brushing against your {pc.masc} chest.")

		if (anger > -0.1):
			saynn("[say=jacki]I almost don't mind you. Wouldn't even be mad if you used me.[/say]")

		else:
			saynn("[say=jacki]You're a good friend. I wouldn't be that mad if you used me though~.[/say]")

		saynn("So.. bold. Jacki is really opening up after everything you two did together.")

		saynn("Oh well. It's hard to be a hero. Time to go.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "investigate"):
		processTime(5*60)
		getCharacter("jacki").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))
		getCharacter("jacki").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ringgag"))

	if(_action == "intimidate"):
		processTime(3*60)
		getModule("JackiModule").addAnger(-1)

	if(_action == "quesiton"):
		processTime(3*60)

	if(_action == "dec_fight"):
		processTime(3*60)

	if(_action == "dec_payfordept"):
		GM.pc.addCredits(-45)

	if(_action == "pay10"):
		GM.pc.addCredits(-10)

	if(_action == "just_leave"):
		getModule("JackiModule").makeJackiBusy()
		getModule("JackiModule").addAnger(30)
		getModule("JackiModule").addCorruption(5)

	if(_action == "endthescene_removerestraints"):
		getCharacter("jacki").removeAllRestraints()
		endScene()
		return

	if(_action == "first_fight"):
		runScene("FightScene", ["gymbully3"], "first_fight")
		return

	if(_action == "second_fight"):
		runScene("FightScene", ["gymbully2"], "second_fight")
		return

	if(_action == "third_fight"):
		runScene("FightScene", ["gymbully"], "third_fight")
		return

	if(_action == "free_jacki_afterwin"):
		processTime(10*60)
		getCharacter("jacki").removeAllRestraints()
		getModule("JackiModule").addAnger(-20)
		getModule("JackiModule").addCorruption(-20)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "first_fight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_firstfight")
			addExperienceToPlayer(50)
		else:
			setState("lost_to_bullies")
			addExperienceToPlayer(5)

	if(_tag == "second_fight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_secondfight")
			addExperienceToPlayer(50)
		else:
			setState("lost_to_bullies")
			addExperienceToPlayer(5)

	if(_tag == "third_fight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_thirdfight")
			addExperienceToPlayer(50)
		else:
			setState("lost_to_bullies")
			addExperienceToPlayer(5)

func saveData():
	var data = .saveData()

	data["anger"] = anger
	data["corruption"] = corruption
	data["lust"] = lust
	data["buttScore"] = buttScore
	data["waterScore"] = waterScore
	data["sawBefore"] = sawBefore
	data["wasRektBefore"] = wasRektBefore

	return data

func loadData(data):
	.loadData(data)

	anger = SAVE.loadVar(data, "anger", 0.0)
	corruption = SAVE.loadVar(data, "corruption", 0.0)
	lust = SAVE.loadVar(data, "lust", 0.0)
	buttScore = SAVE.loadVar(data, "buttScore", 0)
	waterScore = SAVE.loadVar(data, "waterScore", 0)
	sawBefore = SAVE.loadVar(data, "sawBefore", false)
	wasRektBefore = SAVE.loadVar(data, "wasRektBefore", false)
