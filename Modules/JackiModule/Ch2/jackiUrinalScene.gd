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
		addButton("Question", "Get some extra info first. Ask why is Jacki cuffed to an urinal", "quesiton")
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
		addButton("Just leave", "Whatever. It's not your problem", "just_leave")
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

		saynn("[say=gymbully]So? Do you wish to use her? You can also buy her outright for 45 creds.[/say]")

		saynn("Jacki looks.. dry.. for now. Looks like nobody has used her yet.")

		addButton("Intimidate", "Tell them to free Jacki right now", "intimidate")
		addButtonWithChecks("Use Jacki", "Pay 10 credits and use Jacki", "pay10", [], [[ButtonChecks.HasCredits, 10]])
		addButtonWithChecks("Pay 45 creds", "Pay for Jacki's debt", "dec_payfordept", [], [[ButtonChecks.HasCredits, 45]])
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
			saynn("[say=jacki]Thanks. We're not on the best terms. But I can appreciate a good gesture. Wruff.[/say]")

			saynn("Looks like she doesn't mind being naked in front of you, this wolfie. She sticks her tongue out and casually walks out of the bathroom, probably to look for her clothes.")

		else:
			saynn("[say=jacki]Wruff.. Can you imagine what they would have done to me if you didn't save me?[/say]")

			saynn("[say=pc]Yeah, I can guess.[/say]")

			saynn("[say=jacki]I would have been forced to swallow so much cum and piss. And maybe not just swallow, they probably would be stuffing my dirty asshole too, covering my furr.. Marking me.. So much marking..[/say]")

			saynn("That took a turn. She looks kinda sad after saying all this. Such a naughty mind she has. She smooches you on the cheek.")

			saynn("[say=jacki]Either way, thanks~.[/say]")

			saynn("Looks like she doesn't mind being naked in front of you, this wolfie. She sticks her tongue out and casually walks out of the bathroom, probably to look for her clothes.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "dec_payfordept"):
		playAnimation(StageScene.Duo, "stand", {npc="gymbully3"})
		saynn("Paying some credits to save Jacki seems like the best solution in this situation. You produce a chip with 45 credits and hand it to that crazy girl who instantly puts it into her mouth and licks it sensually.")

		saynn("[say=gymbully3]Good little pay-piggy-slut~.[/say]")

		saynn("The leader gestures to the quiet guy to uncuff Jacki and remove her ring gag.")

		saynn("[say=gymbully]Pleasure doing business with you. Her debt has been paid.[/say]")

		saynn("So smug, these fuckers. But whatever. They casually step out of the bathroom after freeing Jacki. Which is all that matters.")

		addButton("Jacki", "Ask if she is okay", "ask_okay_after_free")
	if(state == "ask_okay_after_free"):
		removeCharacter("gymbully")
		removeCharacter("gymbully2")
		removeCharacter("gymbully3")
		playAnimation(StageScene.Hug, "hug", {npc="jacki", npcBodyState={naked=true}})
		saynn("Jacki gives you a hug after being saved, her body rubbing against yours.")

		if (anger > -0.1):
			saynn("[say=jacki]Thanks. We're not on the best terms. But I can appreciate a good gesture. Wruff.[/say]")

			saynn("Looks like she doesn't mind being naked in front of you, this wolfie. She sticks her tongue out and casually walks out of the bathroom, probably to look for her clothes.")

		else:
			saynn("[say=jacki]Wruff.. Can you imagine what they would have done to me if you didn't save me?[/say]")

			saynn("[say=pc]Yeah, I can guess.[/say]")

			saynn("[say=jacki]I would have been forced to swallow so much cum and piss. And maybe not just swallow, they probably would be stuffing my dirty asshole too, covering my furr.. Marking me.. So much marking..[/say]")

			saynn("That took a turn. She looks kinda sad after saying all this. Such a naughty mind she has. She smooches you on the cheek.")

			saynn("[say=jacki]Either way, thanks~.[/say]")

			saynn("Looks like she doesn't mind being naked in front of you, this wolfie. She sticks her tongue out and casually walks out of the bathroom, probably to look for her clothes.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "offerself"):
		playAnimation(StageScene.Duo, "stand", {npc="gymbully"})
		saynn("[say=pc]I wanna pay for her debt.[/say]")

		saynn("The leader raises a brow.")

		saynn("[say=gymbully]Sure. 45 creds.[/say]")

		saynn("[say=gymbully3]That's right, pay-piggy. Pay up~.[/say]")

		saynn("[say=pc]No. I mean like.. use me instead of her.[/say]")

		saynn("The girl bursts into laughter.")

		if (getFlag("JackiModule.BathroomBulliesSubmitted")):
			saynn("[say=gymbully3]Really?! HAH. Isn't that your second time? I guess you really love being used~.[/say]")

		else:
			saynn("[say=gymbully3]Really?! Hah. I guess you really love being used~.[/say]")

		saynn("The leader points at the quiet guy and then nods towards Jacki.")

		saynn("[say=gymbully]No shame in that. I don't care. As long as we get our credits.[/say]")

		saynn("After Jacki's ring gag and cuffs are removed, she walks up to you, still naked.")

		saynn("[say=jacki]You didn't have to.. I could have taken it..[/say]")

		saynn("[say=pc]It's okay.[/say]")

		saynn("[say=jacki]Wruff..[/say]")

		saynn("Now the quiet guy approaches you, the same restraints in his hands.")

		addButton("Continue", "See what happens next", "pc_gets_put_into_urinal")
	if(state == "pc_gets_put_into_urinal"):
		removeCharacter("jacki")
		playAnimation(StageScene.Urinal, "idle2", {bodyState={naked=true, hard=true}})
		saynn("Your arms and legs are chained to the urinal, meaning that you are now.. completely helpless. There is a firm metal ring in your mouth that prevents you from closing it.")

		saynn("[say=gymbully]Perfect. Thank you.[/say]")

		saynn("The quiet guy nods and stands aside after finishing with you.")

		saynn("[say=gymbully3]Since there are no customers yet.. I wanna be first-first![/say]")

		saynn("The leader looks at you.. and smiles.")

		saynn("[say=gymbully]Sure. Maybe the sight of a used meat toilet will attract some.[/say]")

		saynn("Looks like you are about to be used..")

		addButton("Continue", "See what happens next", "pc_used_first")
	if(state == "pc_used_first"):
		playAnimation(StageScene.UrinalPeeing, "peefemale", {pc="pc", npc="gymbully3", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("The female bully quickly pulls down her inmate shorts and positions herself near you, proudly displaying you her pussy slit as she starts rubbing it, her fingers focussing at playing with her clit at first.")

		saynn("[say=gymbully3]Look at me~.[/say]")

		saynn("You raise your chin.. just to receive a slap on the cheek, followed by her spitting directly into your face.")

		saynn("[say=gymbully3]Pathetic little bitch-{pc.boy}~.[/say]")

		saynn("Her free hand keeps playing with her pussy.. until she gets all wet and needy.")

		saynn("[say=gymbully3]Back to my cunt. Stare at it! Or I will spit again.[/say]")

		saynn("You do as told, watching her spreading her pussy folds and slipping two fingers inside. She catches some of her wetness and then lets you sniff her hand.")

		saynn("[say=gymbully3]See how wet am I? I'm fucking horny as fuck~.[/say]")

		saynn("She returns the palm to her slit and proceeds to finger herself, sliding her digits inside her wet pussy at a fast pace, hammering away at her g-spot so much that her legs soon begin to shake.")

		saynn("Soon after, a passionate moan escapes her lips. She pulls her digits away from her pulsing slit moments before a fountain of transparent female juices escapes from it. She squirts all over your face and body with some of her salty girlcum getting onto your tongue.")

		saynn("[say=gymbully3]There we fucking go~. Fuck me~.[/say]")

		saynn("You are now.. wet.. and marked with her horny scent.")

		if (OPTIONS.isContentEnabled(ContentType.Watersports)):
			saynn("But for some reason she is still standing there.. her pussy hovering near your face. A little smirk is shining on her face as she holds her folds spread with two digits.. What is she-?..")

			saynn("Not even a few seconds later, a golden stream erupts from the girl's little pisshole.. She moans as she begins pissing all over you. Oh no..")

			saynn("[say=gymbully3]Ah~. Don't turn your head away. Some of my stinky piss will get into your mouth either way~.[/say]")

			saynn("She is using you as a literal toilet now, her piss streaming down your face, {pc.masc} body, {pc.thick} legs.. Some of it gets flushed away into the urinal.. but most of it stays, marking you with the gross scent.")

			saynn("And indeed, you are forced to taste her urine. The ring gag makes it so you can't even spit it out. So gross.. and yet.. kinda arousing.")

			saynn("After using you, the girl giggles softly.")

		else:
			saynn("She was thinking about pissing all over you too.. but she sees it in your eyes that you are clearly not ready for that.")

			saynn("[say=gymbully3]My bladder is empty. Consider yourself lucky, whore~.[/say]")

		addButton("Continue", "See what happens next", "pc_used_second")
	if(state == "pc_used_second"):
		playAnimation(StageScene.UrinalPeeing, "stroke", {pc="pc", npc="gymbully", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("After the girl comes the leader.")

		saynn("[say=gymbully]Might as well.[/say]")

		saynn("He exposes his sheath and begins rubbing it in your clear view. Soon, his member begins inflating with blood, the pointy tip peeking out more and more.. until the whole shaft is nice and hard.")

		saynn("[say=gymbully]What? The view made me horny too. Your job is simple, don't look at me like that.[/say]")

		saynn("The guy strokes his {gymbully.penis} faster and faster. The knot near the base of his member begins to inflate as he does that. And soon enough, he cums.")

		saynn("His throbbing shaft starts covering your messy face with a new cum layer.. Strings of this sticky stuff are landing on your hair, nose, mouth, tongue.. You close one of your eyes as the cum lands there too.")

		saynn("[say=gymbully]Oh yeah.. Such a good meat toilet.[/say]")

		if (OPTIONS.isContentEnabled(ContentType.Watersports)):
			saynn("It looks like he is not done either.. After orgasming, he holds his cock and waits for something to happen..")

			addButton("Continue", "See what happens", "second_pees_too")
		else:
			saynn("After orgasming, he puts his cock away. He decides against peeing on you as well.")

			saynn("[say=gymbully]Let's see if this helps with the visibility.[/say]")

			addButton("Continue", "See what happens next", "after_first_two")
	if(state == "second_pees_too"):
		playAnimation(StageScene.UrinalPeeing, "pee", {pc="pc", npc="gymbully", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("And soon enough, a second stream of piss hits your face and body.. this time coming from a cock. The guy aims his dick to make sure he pisses all over your face and body, marking you with a new gross scent.. so many of those you have now..")

		saynn("[say=gymbully]Yeah.. take it all.[/say]")

		saynn("His urine streams down your face.. some getting into your mouth. You cough.. but are still forced to swallow some.")

		saynn("After using you fully, he puts his cock away.")

		saynn("[say=gymbully]Let's see if this helps with the visibility.[/say]")

		addButton("Continue", "See what happens next", "after_first_two")
	if(state == "after_first_two"):
		playRandomSexAnim()
		saynn("And so very soon inmates began taking note of you and the services that you provide.. Girls and guys, everyone was interested in a new meat toilet. The gang was sure to profit on that, taking some credits from each person who decided to cum on you.."+str(" Or use you as a piss toilet.." if(OPTIONS.isContentEnabled(ContentType.Watersports)) else "")+"")

		saynn("[say=gymbully]Don't pass up on this unique opportunity! A special toilet, eager to satisfy your most basic needs! Only 5 creds per use![/say]")

		saynn("Wow.. is he selling you cheaper than Jacki? Makes you feel humiliated each time someone decides to pay.. but even more humiliated when they pass.")

		saynn("The debt was clearly paid for by now.. But the business was booming.. An entire queue has formed! So you kept working until there was no one left to satisfy.")

		saynn("[say=gymbully]Good. Very good. Here is your slice.[/say]")

		saynn("He throws a credit chip at you.. It's a bit messy now.. but credits are credits..")

		saynn("[say=gymbully]Should we get {pc.him} out now?[/say]")

		saynn("[say=gymbully3]I'm not touching {pc.him}! Fuck that![/say]")

		saynn("[say=gymbully]Fair enough. Let's go then.[/say]")

		saynn("Wow.. They're gonna leave you like this?")

		saynn("At least the quiet guy decides to unchain you from the urinal.. but still leaving you cuffed up and gagged.")

		saynn("Oh well.. It was you or Jacki.")

		addButton("Continue", "See what happens next", "endthescene")
var randomSexIsPlaying = false
func playRandomSexAnim():
	if(randomSexIsPlaying):
		return

	while(true):
		var domID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [], InmateGenerator.new(), {NpcGen.Level: RNG.randi_range(1, 10)}, true)
		if(domID == null || domID == "" || getCharacter(domID) == null):
			return
		if(getCharacter(domID).hasPenis()):
			playAnimation(StageScene.UrinalPeeing, RNG.pick(["pee", "stroke"]), {pc="pc", npc=domID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		else:
			playAnimation(StageScene.UrinalPeeing, RNG.pick(["peefemale"]), {pc="pc", npc=domID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		randomSexIsPlaying = true
		yield(get_tree().create_timer(3.0 + RNG.randf_range(0.0, 4.0)), "timeout")
		if(!(state in ["after_first_two"])):
			randomSexIsPlaying = false
			return


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
		getModule("JackiModule").addAnger(-15)
		getModule("JackiModule").addCorruption(-5)

	if(_action == "pay10"):
		GM.pc.addCredits(-10)

	if(_action == "offerself"):
		processTime(5*60)
		getModule("JackiModule").addAnger(-20)
		getModule("JackiModule").addLust(-20)
		getModule("JackiModule").addCorruption(-20)
		getCharacter("jacki").removeAllRestraints()

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

	if(_action == "ask_okay_after_free"):
		processTime(3*60)
		getCharacter("jacki").removeAllRestraints()

	if(_action == "pc_gets_put_into_urinal"):
		processTime(10*60)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ringgag"))

	if(_action == "pc_used_first"):
		processTime(3*60)
		GM.pc.cummedOnBy("gymbully3", FluidSource.Vagina, RNG.randf_range(0.4, 0.8))
		GM.pc.cummedInMouthBy("gymbully3", FluidSource.Vagina, RNG.randf_range(0.4, 0.8))
		if(OPTIONS.isContentEnabled(ContentType.Watersports)):
			GM.pc.cummedOnBy("gymbully3", FluidSource.Pissing, RNG.randf_range(0.5, 1.0))
			GM.pc.cummedInMouthBy("gymbully3", FluidSource.Pissing, RNG.randf_range(0.2, 0.3))

	if(_action == "pc_used_second"):
		processTime(3*60)
		GM.pc.cummedOnBy("gymbully", FluidSource.Penis, RNG.randf_range(0.4, 0.8))
		GM.pc.cummedInMouthBy("gymbully", FluidSource.Penis, 1.0)

	if(_action == "second_pees_too"):
		GM.pc.cummedOnBy("gymbully", FluidSource.Pissing, RNG.randf_range(0.5, 1.0))
		GM.pc.cummedInMouthBy("gymbully", FluidSource.Pissing, RNG.randf_range(0.2, 0.3))

	if(_action == "after_first_two"):
		processTime(30*60)
		GM.pc.addCredits(5)
		addMessage("You got 5 credits for being a meat toilet..")

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
