extends SceneBase

var anger = 0.0
var corruption = 0.0
var lust = 0.0
var buttScore = 0
var waterScore = 0
var sawBefore = false
var wasRektBefore = false
var onlyOne = false
var didAnything = false
var swallowedCum = false
var swallowedPiss = false

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
		addButtonWithChecks("Use Jacki", "Pay 10 credits and use Jacki", "pay10", [], [[ButtonChecks.HasCredits, 10], ButtonChecks.HasReachablePenisOrVaginaOrHasStrapon])
		addButtonWithChecks("Pay 45 creds", "Pay for Jacki's debt", "dec_payfordept", [], [[ButtonChecks.HasCredits, 45]])
		addButton("Offer self", "Offer them to cuff you to the urinal instead", "offerself")
		addButton("Just leave", "Whatever. It's not your problem", "just_leave")
	if(state == "pay10"):
		saynn("You decide to give them ten creds, enough to use Jacki once.")

		saynn("[say=gymbully]Have fun.[/say]")

		saynn("You approach Jacki.. Her eyes become wider as she understands that she isn't getting out of her position any time soon..")

		saynn("Let's see..")

		addButton("Continue", "See what happens next", "pick_what_do")
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
	if(state == "lost_to_bullies"):
		playAnimation(StageScene.Solo, "defeat")
		saynn("You lost.. unfortunately. You can't fight anymore so you drop to your knees before the 3 gang members.")

		saynn("[say=gymbully]Since you are so eager to save this inmate.. We might as well free her. And put her debt on you.[/say]")

		saynn("[say=gymbully3]Yeah, you're gonna be the meat toilet, bitch![/say]")

		saynn("After Jacki's ring gag and cuffs are removed, she walks up to you, still naked.")

		saynn("[say=jacki]You didn't have to.. I could have taken it..[/say]")

		saynn("[say=pc]It's okay.[/say]")

		saynn("[say=jacki]Wruff..[/say]")

		saynn("Now the quiet guy approaches you, the same restraints in his hands.")

		addButton("Continue", "See what happens next", "pc_gets_put_into_urinal")
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
		addButtonWithChecks("Use her", "There are a few ways to use her in her current position..", "use_jacki_afterwin", [], [ButtonChecks.HasReachablePenisOrVaginaOrHasStrapon])
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
	if(state == "use_jacki_afterwin"):
		playAnimation(StageScene.UrinalPeeing, "idle", {pc="jacki", npc="pc", bodyState={naked=true}})
		saynn("Well. Since you won.. You might as well claim your prize.. mark it, you know?")

		saynn("Jacki tilts her head slightly, seeing your mischievous stare.")

		saynn("[say=jacki]Oh.. You aren't planning on saving me, are you.. What kinky stuff are you gonna do to me..[/say]")

		saynn("Let's see..")

		addButton("Continue", "See what you can do with Jacki", "pick_what_do")
	if(state == "pick_what_do"):
		playAnimation(StageScene.UrinalPeeing, "idle", {pc="jacki", npc="pc", bodyState={naked=true}})
		saynn("What do you wanna do with Jacki?")

		if (onlyOne):
			saynn("You will only be able to do one thing with her.")

		addButtonWithChecks("Stroke cock", "Cum all over her face", "pick_stroke", [], [ButtonChecks.HasReachablePenis])
		addButtonWithChecks("Rub pussy", "Squirt all over her face", "pick_rubpussy", [], [ButtonChecks.HasReachableVagina])
		addButtonWithChecks("Fuck her ass", "It would be a little awkward.. but nothing is impossible", "pick_fuckass", [], [ButtonChecks.HasReachablePenis])
		addButtonWithChecks("Strapon her ass", "It would be a little awkward.. but nothing is impossible", "pick_straponass_pick", [], [ButtonChecks.HasStraponAndCanWear])
		if (!onlyOne):
			addButton("Enough", "Enough fun", "pick_enoughfun")
	if(state == "pick_enoughfun"):
		if (didAnything):
			saynn("You properly used Jacki as the meat toilet. Her mind got so corrupted by now that she doesn't even mind it.")

			saynn("But.. should you free her now?")

		else:
			saynn("After seeing what you can do.. you decided you'd rather not do anything with Jacki. Fair enough.")

			saynn("But.. should you free her now?")

		addButton("Free Jacki", "Remove her restraints", "enough_free")
		addButton("Walk away", "She will be fine there", "enough_justwalk")
	if(state == "enough_justwalk"):
		playAnimation(StageScene.Solo, "stand")
		saynn("Whatever. You saved Jacki from bullies. But that doesn't mean you should save her from her current precarious situation. Urinals are dirty too, rather not get all that stuff on you.")

		saynn("So you give Jacki a little nod and proceed to walk away.")

		saynn("[say=jacki]Umm.. What about.. cuffs..[/say]")

		saynn("She will find a way to escape them, she is a smart girl.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "enough_free"):
		playAnimation(StageScene.Duo, "stand", {npc="jacki", npcBodyState={naked=true}})
		saynn("It takes you some time. But you manage to remove Jacki's cuffs and gag.")

		saynn("She wants to hug you at first.. but then decides against it, considering where and who she was not that long ago.")

		saynn("[say=jacki]Well.. thank you. Wruff![/say]")

		saynn("Thank you? After what you did?")

		if (swallowedPiss):
			saynn("[say=jacki]I still have the taste of your piss in my mouth..[/say]")

			saynn("She stays silent for a few seconds.. licking her lips.")

			saynn("[say=jacki]Gross~.[/say]")

		elif (swallowedCum):
			saynn("[say=jacki]I still have the taste of your.. jizz.. in my mouth..[/say]")

			saynn("She stays silent for a few seconds.. licking her lips.")

			saynn("[say=jacki]Salty~.[/say]")

		else:
			saynn("[say=jacki]I was getting kinda thirsty in there.. sad you didn't decide to fix that.. oh well.[/say]")

		saynn("Jacki looks around. Her clothes are nowhere in sight.")

		saynn("[say=jacki]I can go now, right?..[/say]")

		saynn("[say=pc]Sure.[/say]")

		saynn("[say=jacki]Gonna have to find my clothes.. Let's hope I won't get blackmailed~.[/say]")

		saynn("And so Jacki walks away, still naked.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "after_once_use"):
		playAnimation(StageScene.Duo, "stand", {npc="gymbully"})
		saynn("Well, you used Jacki for her intended purpose. But now it's time to go.")

		saynn("[say=gymbully]Tell your friends.[/say]")

		saynn("[say=gymbully3]Thank you for the creds~. Baaai.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "pick_stroke"):
		playAnimation(StageScene.UrinalPeeing, "stroke", {pc="jacki", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You expose your {pc.penis} and quickly get it hard, rubbing it right in front of Jacki while she is forced to offer you her blushy face, her eyes directed away.")

		saynn("[say=pc]Look at my cock, slut.[/say]")

		saynn("She sees a drop of precum dripping off the tip of your member.. and looks away again. So you grab her by the hair and make her look at you before smacking her cheek with your member. So humiliating..")

		saynn("[say=pc]Like that. Stare at it, whore.[/say]")

		saynn("She nods and proceeds to carefully watch as you stroke your cock in front of her face, your hand motions getting faster and faster. The closer you are to your orgasm, the more Jacki flinches from every random motion.")

		saynn("[say=pc]Take it all..[/say]")

		addButton("Cum", "Leave a mess on that cute face of hers", "pick_stroke_cum")
	if(state == "pick_stroke_cum"):
		playAnimation(StageScene.UrinalPeeing, "stroke", {pc="jacki", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You grunt as your {pc.penis} starts throbbing and shooting thick strings of {pc.cum} all over Jacki's face, leaving quite a mess. Some of your seed lands on her hair and face.. but some goes directly into her mouth, forcing her to taste you.")

		saynn("[say=pc]Swallow, bitch.[/say]")

		saynn("She can't really close her mouth with that metal ring.. so you see quite clearly how her throat opens to accept your slimy load.")

		saynn("[say=pc]Good little cum dumpster.[/say]")

		saynn("Her cheeks blush brightly.")

		addButton("Continue", "See what happens next", "return_back_or_enough")
		addButtonWithChecks("Piss on", "Use her as a piss toilet too", "pick_stroke_piss", [], [[ButtonChecks.ContentEnabled, ContentType.Watersports]])
	if(state == "pick_stroke_piss"):
		playAnimation(StageScene.UrinalPeeing, "pee", {pc="jacki", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You're not done yet.. After that last orgasm, a different kind of urge quickly rises in your body.")

		saynn("One of Jacki's eyes is closed because of the {pc.cum}.. but she can see quite clearly with the other one that you are gearing to do something else..")

		saynn("And yeah, after a few seconds, a stream of your golden piss suddenly hits her face, washing all over her fur.")

		saynn("[say=jacki]Nhhhh!![/say]")

		saynn("She coughs as some of it lands on her tongue.. forcing her to taste your gross urine. After filling her mouth, you guide the stream to wash over her body too, giving her small tits and slim body a golden shower.")

		saynn("[say=pc]Shut up, piss toilet.[/say]")

		saynn("Jacki is blushing deeply as you mark her fur with your scent. She looks like such a wet mess now..")

		saynn("Feels so good to just let it out though.")

		addButton("Continue", "See what happens next", "return_back_or_enough")
	if(state == "pick_rubpussy"):
		playAnimation(StageScene.UrinalPeeing, "peefemale", {pc="jacki", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You quickly expose your {pc.pussyStretch} pussy and move your body closer, making it so your pussy hovers close near Jacki's muzzle. So close that you can feel her hot breath on your sensitive flesh, making you oh so horny..")

		saynn("[say=pc]Sniff it.[/say]")

		saynn("Jacki guides her eyes away.. so you slap her face and make her look at your pussy.")

		saynn("[say=pc]Now.[/say]")

		saynn("The wolfie's nose twitches as she does as ordered, sniffing your wet cunt as you spread it.")

		saynn("[say=pc]Good bitch.[/say]")

		saynn("Your digits slide a little higher and begin rubbing your little clit with side-to-side motions. It feels good and Jacki's breath makes it so much more kinky. Little moans escape from you as you pleasure yourself in front of that meat toilet.")

		saynn("After getting your slit sufficiently moist, you spread the folds again and slide two digits inside, stretching the pussy hole itself. You wiggle them a bit and then proceed to move them in and out, fingering yourself.")

		saynn("[say=pc]Bet you wish you would be able to do that, right~? Are you desperate, slut?[/say]")

		saynn("Jacki huffs at you pussy.. soon followed by you slapping her face again.")

		saynn("[say=pc]What a slut~.[/say]")

		saynn("Your digits keep hammering away at your pleasure spot faster and harder.. causing your slit to make wet noises. Your moans grow hotter..")

		addButton("Cum", "Make that slut wet", "pick_rubpussy_squirt")
	if(state == "pick_rubpussy_squirt"):
		playAnimation(StageScene.UrinalPeeing, "peefemale", {pc="jacki", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("And so you throw your head back and let out a passionate cry as you push yourself over the edge.. and even further.. overstimulating your pussy slit to the point of it suddenly gushing out a torrent of girlcum on that wolfie's face!")

		saynn("You make that slut's fur wet with your juices.. but some of it also lands onto her tongue, making her taste your lewd fluids.")

		saynn("[say=pc]Good.. Such a good meat toilet.[/say]")

		saynn("Your legs are shaking a little after that orgasm. Feels good..")

		addButton("Continue", "See what happens next", "return_back_or_enough")
		addButtonWithChecks("Piss on", "Use her as a piss toilet too", "pick_pussrub_piss", [], [[ButtonChecks.ContentEnabled, ContentType.Watersports]])
	if(state == "pick_pussrub_piss"):
		playAnimation(StageScene.UrinalPeeing, "peefemale", {pc="jacki", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("After that orgasm.. you still have an urge to satisfy.. a different kind of urge.")

		saynn("Jacki tilts her head slightly as you don't pull your pussy away, instead just hovering it near her face for some reason, your digits holding it spread. But the reasoning quickly becomes obvious..")

		saynn("A strong stream of your piss emerges from your urethra and hits Jacki's fur. It begins streaming down her hair, face, shoulders, tits, belly.. Some of it gets into Jacki's mouth, causing her to cough from the gross taste.")

		saynn("[say=pc]Gulp it up, piss slut.[/say]")

		saynn("Jacki tries to keep her mouth away from the stream.. but that only makes you purposely piss directly into it, forcing the wolfie to swallow at least some of it.")

		saynn("[say=pc]Good toilet.[/say]")

		saynn("Soon, your stream of piss begins to die down, leaving Jacki.. drenched.. in your gross smelly fluids. She is now marked by them. Good.")

		saynn("Jacki looks at you with big puppy eyes after that, her cheeks still red.")

		addButton("Continue", "See what happens next", "return_back_or_enough")
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
		onlyOne = true

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

	if(_action == "use_jacki_afterwin"):
		processTime(10*60)
		#if(!getModule("JackiModule").doBetray()):
		#	getModule("JackiModule").addAnger(20)

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

	if(_action == "pick_stroke"):
		didAnything = true
		swallowedCum = true

	if(_action == "pick_rubpussy"):
		didAnything = true
		swallowedCum = true

	if(_action == "pick_fuckass"):
		didAnything = true

	if(_action == "pick_straponass_pick"):
		didAnything = true

	if(_action == "enough_free"):
		processTime(10*60)
		getCharacter("jacki").removeAllRestraints()
		getModule("JackiModule").addAnger(-5)

	if(_action == "enough_justwalk"):
		getModule("JackiModule").makeJackiBusy()
		getModule("JackiModule").addAnger(10)
		getCharacter("jacki").removeAllRestraints()

	if(_action == "pick_stroke_cum"):
		processTime(5*60)
		getCharacter("jacki").cummedOnBy("pc", FluidSource.Penis, RNG.randf_range(0.6, 0.8))
		getCharacter("jacki").cummedInMouthBy("pc", FluidSource.Penis)
		GM.pc.orgasmFrom("jacki")
		getModule("JackiModule").addCorruption(5)

	if(_action == "return_back_or_enough"):
		if(onlyOne):
			setState("after_once_use")
			getModule("JackiModule").makeJackiBusy()
		else:
			setState("pick_what_do")
		return

	if(_action == "pick_stroke_piss"):
		processTime(5*60)
		getCharacter("jacki").cummedOnBy("pc", FluidSource.Pissing, RNG.randf_range(0.5, 1.0))
		getCharacter("jacki").cummedInMouthBy("pc", FluidSource.Pissing, RNG.randf_range(0.2, 0.3))
		getModule("JackiModule").advanceSkill("jackiSkillWatersports")
		swallowedPiss = true

	if(_action == "pick_rubpussy_squirt"):
		processTime(5*60)
		getCharacter("jacki").cummedOnBy("pc", FluidSource.Vagina, RNG.randf_range(0.6, 0.8))
		getCharacter("jacki").cummedInMouthBy("pc", FluidSource.Vagina, RNG.randf_range(0.2, 0.4))
		GM.pc.orgasmFrom("jacki")
		getModule("JackiModule").addCorruption(5)

	if(_action == "pick_pussrub_piss"):
		processTime(5*60)
		getCharacter("jacki").cummedOnBy("pc", FluidSource.Pissing, RNG.randf_range(0.5, 1.0))
		getCharacter("jacki").cummedInMouthBy("pc", FluidSource.Pissing, RNG.randf_range(0.2, 0.3))
		getModule("JackiModule").advanceSkill("jackiSkillWatersports")
		swallowedPiss = true

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
			getModule("JackiModule").addAnger(-20)
			getModule("JackiModule").addLust(-20)
			getModule("JackiModule").addCorruption(-20)
			getCharacter("jacki").removeAllRestraints()

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
	data["onlyOne"] = onlyOne
	data["didAnything"] = didAnything
	data["swallowedCum"] = swallowedCum
	data["swallowedPiss"] = swallowedPiss

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
	onlyOne = SAVE.loadVar(data, "onlyOne", false)
	didAnything = SAVE.loadVar(data, "didAnything", false)
	swallowedCum = SAVE.loadVar(data, "swallowedCum", false)
	swallowedPiss = SAVE.loadVar(data, "swallowedPiss", false)
