extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false
var waterSkill = 0
var usedItemName = ""
var lastItemUniqueID = ""
var drankOnlyPiss = false

func _init():
	sceneID = "Ch6TaviWatersportsSkillScene"

func _run():
	if(state == ""):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("You tell Tavi that you want to train her to enjoy pee more because.. you want that.")

		saynn("Tavi blushes softly.")

		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		waterSkill = getModule("TaviModule").getSkillScore("taviSkillWatersports")
		addButton("Lesson 1", "Introduce Tavi to watersports", "lesson1")
		if (waterSkill > 0):
			addButton("Lesson 2", "See if Tavi is still up for more watersports", "lesson2")
		if (waterSkill > 1):
			addButton("Bathroom", "Bring Tavi to the bathroom for some watersports fun", "bathroom")
			if (waterSkill > 3):
				addButton("Swallowing", "You feel like peeing now", "swallowing")
			else:
				addDisabledButton("Swallowing", "Tavi needs to be more confident in watersports")
		addButton("Cancel", "You changed your mind", "cancel_lesson")
	if(state == "lesson1"):
		saynn("Tavi never really showed much interest towards watersports. Sure, she can use it as a form of humiliation.. But you're kinda curious if you can mold Tavi to become a piss slut herself.")

		saynn("Her cell isn't really the best place because of how messy this activity can get. So you invite Tavi to follow you somewhere. A bathroom is a safe choice.")

		saynn("[say=tavi]Where are we going?[/say]")

		saynn("You grab her hand and tug her out of her cell.")

		saynn("[say=tavi]I guess I will find out soon..[/say]")

		addButton("Bathrooms", "Bring Tavi to the room with the toilet stalls", "les1_stalls")
	if(state == "les1_stalls"):
		aimCameraAndSetLocName("main_bathroom1")
		saynn("You bring Tavi into the prison's bathroom. It's a long, wide corridor-like room where one of the walls has a row of sinks with one big mirror above it while the other wall has a row of stalls followed by a few urinals.")

		saynn("You bring Tavi into one of the stalls and stand near the door. Each stall only has enough space for a cheap-looking metal toilet.")

		saynn("Tavi looks around, seeing nothing unusual about this place. Then she directs her attention towards you, her gaze shows that she has her suspicions already.")

		saynn("[say=tavi]A toilet? You want me to pee?[/say]")

		saynn("What a smart kitty. You nod and keep staring at her.")

		saynn("[say=tavi]Alright. Well, can you maybe..[/say]")

		saynn("You shake your head.")

		saynn("[say=pc]It's the first step, Tavi. To get you more comfortable with this stuff.[/say]")

		saynn("Tavi tilts her head slightly.")

		saynn("[say=tavi]But.. why? It's extremely humiliating and gross. I can understand when..[/say]")

		saynn("Your hand lands on her cheek, your touch gently and understanding. Tavi stops talking and just holds onto your wrist.")

		saynn("[say=pc]It can also be extremely hot. The ultimate form of submission. Can you do this for me? I won't force you.[/say]")

		saynn("You say that while blocking the only exit. Tavi looks you into the eyes.. and thinks.")

		saynn("[say=tavi]I'm not sure..[/say]")

		saynn("Well, forcing her now would break any trust.. so, you just nod and step out of the stall. Maybe she will agree some other time.")

		saynn("[say=pc]I will wait for you outside.[/say]")

		addButton("Wait", "Wait until Tavi is done peeing", "les1_taviagrees")
	if(state == "les1_taviagrees"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="sit"})
		saynn("A few seconds after walking out, you hear Tavi's voice again.")

		saynn("[say=tavi]Come back..[/say]")

		saynn("Huh? You step into the stall and notice Tavi hovering just above the toilet seat with her shorts down, her neat"+str(" virgin" if getModule("TaviModule").isVirgin() else "")+" pussy out on display.")

		saynn("You close the door behind. A smile appears on your face from such a cute display. A smile that makes Tavi blush deeply.")

		saynn("[say=tavi]Don't you dare to laugh..[/say]")

		saynn("Tavi's heart is clearly racing so you decide to let her do her thing. She takes a deep breath and spreads her pussy open for you with her digits. Then she closes her eyes and tries to force the urge, her cheek flush with embarrassment.")

		saynn("A few seconds later, a small cute noise escapes from Tavi as her pussy suddenly releases a small stream of urine into the toilet. Such a simple act and yet.. so kinky. The sound of the flowing yellow liquid echoes in the small stall, creating a strange but intimate moment.")

		saynn("As the stream subsides, Tavi opens her eyes, meeting your gaze and then instantly looking away. You reach your hand out and give your pet a few headpats of encouragement.")

		saynn("[say=pc]You did very well. Thank you.[/say]")

		saynn("She grabs a piece of toilet paper and rubs her pussy clean before flushing it down the toilet.")

		saynn("[say=pc]How did it feel?[/say]")

		saynn("[say=tavi]Exactly how it looked like..[/say]")

		saynn("Seems like she is not ready to admit anything. Tavi pulls her shorts up and follows you back to her cell.")

		saynn("Still, not everything went wrong.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "lesson2"):
		saynn("Some time has passed since the last lesson but the feeling of curiosity still lingers in the air. You notice a subtle shift in Tavi's appearance. Nothing too drastic, her eyes just look slightly more.. confident?")

		saynn("[say=tavi]You know.. I've been thinking..[/say]")

		saynn("Intriguing. Tavi slowly walks up to you, her tail gently swaying behind her.")

		saynn("[say=tavi]I think I'd like to explore what we did.. a little more.[/say]")

		saynn("She leans in closer to your ear before whispering..")

		saynn("[say=tavi]I wanna pee so much.. I might just wet my shorts if you don't do something about it..[/say]")

		saynn("It's a nice offer.. but you'd rather not make Tavi's cell smell of urine. Better to take her to the bathroom again. You grab her paw and make her follow.")

		addButton("Continue", "See what happens next", "les2_taviproblem")
	if(state == "les2_taviproblem"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="struggle"})
		aimCameraAndSetLocName("cellblock_nearcells")
		saynn("As soon as you step out of the high-security cellblock wing, Tavi suddenly stops and puts her paws on her crotch, her gaze extremely concerned.")

		saynn("[say=pc]Something is wrong, Tavi?[/say]")

		saynn("Tavi squirms a lot before doing small short steps towards you.")

		saynn("[say=tavi]I think I drank too much water.. I wanted it to be a big one..[/say]")

		saynn("Heck.")

		saynn("[say=pc]Can you last until the bathroom?[/say]")

		saynn("Tavi nods subtly. Well, the best you can do is walk faster. You grab Tavi's paw more firmly and help her.")

		addButton("Bathrooms", "Walk to the bathrooms with Tavi", "les2_rip")
	if(state == "les2_rip"):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {pc="alexrynard", npc="tavi", npcAction="struggle"})
		aimCameraAndSetLocName("main_hallroom3")
		saynn("As you approach the bathrooms.. Tavi gasps.")

		saynn("The door is locked shut with a yellow hologram ribbon spinning around it.. a ribbon that says 'maintenance in progress'. Near the door are a few engineers working on something and also Alex who is looking into his datapad.")

		saynn("[say=pc]What's happening? We kinda need to use this room.[/say]")

		saynn("The foxy pulls his gaze away from the pad and looks at you two.")

		saynn("[say=alexrynard]We're doing some quick maintenance. Shouldn't take that long.[/say]")

		saynn("Are they serious.. Now of all times? Tavi whines softly while rubbing her legs against each other.")

		saynn("[say=pc]How long will it take?[/say]")

		saynn("Foxy looks at the other engineers.")

		saynn("[say=alexrynard]We're almost done. About 15 minutes.[/say]")

		saynn("Oh no. You begin whispering to Tavi.")

		saynn("[say=pc]Can you do 15 minutes?[/say]")

		saynn("Her eyes look wide and sorry, her ears drooping, her tail covering her crotch. She listens to your question and then shakes her head, almost panicking by this point..")

		saynn("[say=alexrynard]The other bathroom still works, can use that one.[/say]")

		saynn("Tavi leans closer to your ear.")

		saynn("[say=tavi]That's too far..[/say]")

		saynn("What now..")

		addButton("Think more", "Try to come up with a solution for this situation", "les2_solution")
	if(state == "les2_solution"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("What a pickle, huh? Literally everything that could go wrong went wrong this time. Tavi whines softly.")

		saynn("Hm. You begin to think about how you can solve this problem. Maybe there is some other place that's closer and that has a toilet. You look around.. Nah, not really. You can't think of anything. Tavi is squirming a lot.")

		saynn("Hmm.. Maybe someone here has a bottle.. How would you ask for it even? 'Hey, my pet here is thirsty, do you have some water?'. Nah, that would be extremely suspicious. Tavi carefully steps out of your vision cone, leaning against some wall.")

		saynn("Hmmm.. Here is a good idea. Yard. Tavi can pee behind some bush where no one can see her. Yes. Time to tell her.")

		saynn("[say=tavi]Ah..[/say]")

		saynn("That was Tavi's moan. You turn your head towards her and see her bracing the concrete wall tightly while her face shows embarrassment.. You can tell why. Her eyes are closed while the cloth around her crotch region quickly becomes damp.. She tries to cover it with her paws but a few seconds later a little stream of yellow piss emerges from under her shorts, flowing down her thighs, making the fur there look wet too..")

		saynn("Alex produces an audible sigh.")

		saynn("[say=alexrynard]Really?[/say]")

		saynn("Seems you weren't the only one who saw that. Tavi realizes that she got spotted.. but she can't stop herself. She is blushing deeply while a puddle of piss under her gets bigger and bigger..")

		saynn("After she is finally done, Tavi realizes how many eyes are glued to her.. and takes off somewhere, her paws covering her face.")

		addButton("Follow", "See where Tavi went", "les2_laundry")
	if(state == "les2_laundry"):
		removeCharacter("alexrynard")
		aimCameraAndSetLocName("main_laundry")
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}})
		saynn("You run after Tavi. Using all your senses you realize that she went hiding in the laundry room.")

		saynn("Entering it, you see Tavi, completely naked, rubbing the fur on her thighs dry with some random blanket before throwing it into the washing machine, together with her uniform.")

		saynn("She sees you and lowers her gaze, her paws covering herself.")

		saynn("[say=tavi]That was.. very awkward..[/say]")

		saynn("[say=pc]Aw. You should calm down, Tavi. Not much we could have done there..[/say]")

		saynn("She nods and then stays silent for a few seconds while the machine washes her uniform clean.")

		saynn("[say=tavi]I know.. Although.. It was.. kinda..[/say]")

		saynn("You raise a brow and approach Tavi.")

		saynn("[say=tavi]Kinda.. kinky? I don't know..[/say]")

		saynn("You hug her from behind and rest your chin on her shoulder. Tavi purrs softly.")

		saynn("[say=pc]It was very kinky. Wetting yourself in public? That's one hell of a stunt. Requires some serious confidence.[/say]")

		saynn("Tavi chuckles.")

		saynn("[say=tavi]That's not something I thought I would ever do.[/say]")

		saynn("You leave a smooch on her shoulder.")

		saynn("[say=pc]We can do so much more..[/say]")

		saynn("[say=tavi]With less eyes.. preferably..[/say]")

		saynn("[say=pc]I can always blindfold you~.[/say]")

		saynn("Tavi smiles. The washing machine beeps as it finishes cleaning and drying Tavi's uniform. She grabs it and starts putting it on.")

		saynn("It wasn't really a lesson.. But Tavi still learned something it seems. Time to go back to her cell.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "bathroom"):
		aimCameraAndSetLocName("main_bathroom1")
		saynn("You grab Tavi's paw and invite her to follow you.")

		saynn("[say=tavi]Where are we..?[/say]")

		saynn("[say=pc]Bathroom.[/say]")

		saynn("Tavi can already probably guess why.")

		saynn("You and Tavi step into one of the prison's bathrooms. It's pretty spacious. One of the walls has a row of sinks, the other one has toilet stalls and urinals. If you'd walk further, you'd enter the dressing room and the showering area.")

		saynn("What do you want Tavi to do?")

		if (GM.pc.getInventory().getItemsWithTag(ItemTag.CanPeeInto).size() > 0):
			addButton("Fill container", "Make Tavi pee into one of your fluid containers", "bathroom_fill_pick")
		else:
			addDisabledButton("Fill container", "You don't have any items that Tavi can pee into")
		addButton("Watch her pee", "Watch Tavi pee", "bathroom_watch_pee")
		addButton("Golden shower", "Pee on Tavi", "bathroom_goldenshower")
	if(state == "bathroom_fill_pick"):
		saynn("Pick what container you want Tavi to pee into?")

		addPeeIntoButtons()
		addButton("Back", "Never mind", "bathroom")
		if (false):
			addButton("Nope", "You shouldn't see this", "bathroom_fill")
	if(state == "bathroom_fill"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="sit", npcBodyState={naked=true}})
		saynn("You give Tavi a "+str(usedItemName)+". She looks at you while tilting her head slightly.")

		saynn("[say=tavi]And?..[/say]")

		saynn("[say=pc]I want you to fill it.[/say]")

		saynn("Tavi blinks many times.")

		saynn("[say=tavi]Sure..[/say]")

		saynn("Tavi steps into one of the stalls. And obviously you follow her, closing the stall door behind.")

		saynn("[say=tavi]You're gonna watch?[/say]")

		saynn("[say=pc]You don't want me to?[/say]")

		saynn("Tavi shrugs.")

		saynn("[say=tavi]You can watch..[/say]")

		saynn("The feline pulls her shorts down and hovers her pussy above the toilet. Then she brings the "+str(usedItemName)+" close to her pisshole and starts waiting for something.")

		saynn("A few seconds later, Tavi produces a cute moan and bites her lip as a strong stream of her piss begins to fill the container. She looks pretty cute while doing her best not to spill any of her pee.")

		saynn("[say=tavi]Ah..[/say]")

		saynn("After she is done pissing, Tavi hands you the filled "+str(usedItemName)+".")

		saynn("[say=tavi]Here..[/say]")

		addButton("Take it", "Grab the container back", "bathroom_fill_take")
		addButton("Order to drink", "Order Tavi to drink her piss", "bathroom_fill_orderdrink")
	if(state == "bathroom_fill_take"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("You grab your "+str(usedItemName)+" back and pat Tavi on the head, making her purr.")

		saynn("[say=pc]Good job, let's go back.[/say]")

		saynn("She nods and prepares to follow you.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "bathroom_fill_orderdrink"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		if (waterSkill <= 5):
			saynn("Hmm.. This could be a great way to test Tavi. You don't take the "+str(usedItemName)+" back, instead letting Tavi hold it.")

			saynn("[say=pc]I want you to drink it.[/say]")

			saynn("Tavi's eyes became big, it was clearly an unexpected request.")

			saynn("[say=tavi]What?..[/say]")

			saynn("[say=pc]Something is not clear?[/say]")

			saynn("Tavi looks down at the "+str(usedItemName)+", that's filled with her piss"+str(" and who knows what else.." if !drankOnlyPiss else "..")+" She hesitates a lot.")

			saynn("[say=pc]If you don't wanna do it, just tell me.[/say]")

			saynn("Tavi takes a deep breath, her emotions and feelings conflicting within her. She gazes into your eyes, silently.. until nodding and lifting the "+str(usedItemName)+" to her lips.")

			saynn("As Tavi takes a small sip, she starts coughing.")

			saynn("[say=pc]Is it that bad? You can stop if..[/say]")

			saynn("But then Tavi suddenly parts her lips wide and raises the bottle high, swallowing her piss"+str(" and whatever else was in that container" if !drankOnlyPiss else "")+" at a high rate, trying to avoid thinking about the taste.")

			saynn("Wow, she empties it. She has to suppress her urge to gag after but she just about manages. Talk about power of will.")

			saynn("[say=pc]Wow.[/say]")

			saynn("Tavi is panting softly, her eyes.. lusty.")

			saynn("[say=tavi]That tasted fucking gross..[/say]")

			saynn("She hands you the empty container.")

			saynn("[say=tavi]But wouldn't mind repeating some other time..[/say]")

			saynn("Well, after this powerful performance, it's time to go back to her cell.")

		else:
			saynn("You don't take the "+str(usedItemName)+" back, instead letting Tavi hold it.")

			saynn("[say=pc]I want you to drink it.[/say]")

			saynn("Tavi puts on a cute smile.")

			saynn("[say=tavi]Drink my own piss~? Watch it.[/say]")

			saynn("Tavi takes a deep breath and then brings the "+str(usedItemName)+" up to her mouth before raising it high and proceeding to eagerly swallow her piss"+str(" and whatever else was in that container" if !drankOnlyPiss else "")+". For some reason, it's quite.. hot.. to see her do this.")

			saynn("And wow, she empties it. And even licks her lips after doing it.")

			saynn("[say=tavi]See, easy~.[/say]")

			saynn("She hands you the empty container.")

			saynn("[say=tavi]Proud to be your piss-slut.[/say]")

			saynn("Well, after this performance, it's time to go back to her cell.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "bathroom_watch_pee"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="sit", npcBodyState={naked=true}})
		saynn("You bring Tavi into one of the toilet stalls.")

		saynn("[say=pc]I wanna watch you.[/say]")

		if (waterSkill <= 5):
			saynn("Tavi's gaze meets yours, her cheeks blushing, her heart probably beating a little faster than before.")

			saynn("[say=tavi]Watch me pee?[/say]")

			saynn("You nod. And so Tavi swallows her nerves and slowly pulls down her shorts before positioning herself above the toilet, making sure not to sit on the dirty seat. She feels your gaze on her and gets all shy and cute. And then, after a few seconds of silence, she produces a cute moan while her pussy releases a small stream of urine.")

			saynn("The sound of the yellow liquid hitting the water echoes through the whole bathroom while Tavi's cheeks burn with embarrassment. But she pushes through and empties her bladder in front of you completely.")

			saynn("As the stream subsides, Tavi flushes the toilet and pulls her shorts back up.")

			saynn("[say=pc]Good job, proud of you.[/say]")

			saynn("[say=tavi]Thank you..[/say]")

			saynn("That was pretty cute. But it's time to go back to her cell.")

		else:
			saynn("Tavi's ears perk up, curiosity dancing in her eyes as she meets your gaze.")

			saynn("[say=tavi]Watch me pee~?[/say]")

			saynn("You nod. And so Tavi eagerly pulls her shorts down, exposing her cute pussy to you before positioning it above the toilet, making sure not to sit on the dirty seat. Tavi takes a deep breath, her paw reaches down to her slit and spreads the folds aside, one of the claws is tickling the little pisshole.. until a powerful stream of urine spawns from it.")

			saynn("[say=tavi]Ah~..[/say]")

			saynn("Tavi looks you in the eyes again and bites her lip. She seems to be enjoying your company. She keeps pissing for a while, the sound of her pee hitting the water echoing through the whole bathroom.")

			saynn("When the stream begins to subside, Tavi catches some of the gross fluid onto her digits and then pulls them to her mouth before licking them thoroughly. She became such a piss slut.. and so fast.. Like she always wanted it.")

			saynn("[say=tavi]Nya~.[/say]")

			saynn("[say=pc]Thank you Tavi.[/say]")

			saynn("She pulls her shorts up and flushes before receiving a few headpats from you.")

			saynn("That was pretty lewd. But it's time to go back to her cell.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "bathroom_goldenshower"):
		aimCameraAndSetLocName("main_shower1")
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("[say=pc]Wanna experience a golden shower, Tavi?[/say]")

		if (waterSkill <= 5):
			saynn("[say=tavi]Um..[/say]")

			saynn("Tavi blushes deeply.")

			saynn("[say=pc]Won't force you.[/say]")

			saynn("[say=tavi]It's okay. I'm curious how it feels.[/say]")

			saynn("Probably best not to leave any mess. And so you bring her to the dressing room where you both undress and store your clothing. After that, you step into the showering area and make sure that it's empty.")

			saynn("[say=tavi]Should be good..[/say]")

			saynn("Tavi stands over one of the drain vents and slowly gets on her knees. You approach her and give her scritches behind the ear.")

			saynn("[say=tavi]Piss all over me..[/say]")

			saynn("Sounds like an invitation.")

		else:
			saynn("[say=tavi]Sure~.[/say]")

			saynn("That was.. too easy. Tavi sees your confusion and smiles.")

			saynn("[say=tavi]Piss on me, please~.[/say]")

			saynn("Probably best not to leave any mess. And so you bring her to the dressing room where you both undress and store your clothing. After that, you step into the showering area and make sure that it's empty.")

			saynn("[say=tavi]I wouldn't mind getting that bathroom messy.. But oh well..[/say]")

			saynn("Tavi stands over one of the drain vents and slowly gets on her knees. You approach her and give her scritches behind the ear.")

			saynn("[say=tavi]Piss all over your slut~.[/say]")

			saynn("Sounds like an invitation.")

		addButton("Do it", "Make her real messy", "bathroom_goldenshower_pee")
	if(state == "bathroom_goldenshower_pee"):
		playAnimation(StageScene.SexOral, "start", {npc="tavi", npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		if (GM.pc.isWearingChastityCage()):
			saynn("You stand near Tavi, waiting for the urge to happen. And so, after some time, a stream of piss emerges from the little hole in your chastity cage!")

		elif (GM.pc.hasReachablePenis()):
			saynn("You stand near Tavi, waiting for the urge to happen. And so, after some time, a stream of piss emerges from your {pc.penis}!")

		elif (GM.pc.hasReachableVagina()):
			saynn("You stand near Tavi, waiting for the urge to happen. And so, after some time, a stream of piss emerges from the little hole of your pussy!")

		else:
			saynn("You stand near Tavi, waiting for the urge to happen. And so, after some time, a stream of piss emerges from you!")

		saynn("You begin pissing all over Tavi's body.")

func taviSpeak(normalSpeak, corruptSpeak, pureSpeak):
	if(isCorrupt):
		return corruptSpeak
	if(isPure):
		return pureSpeak
	return normalSpeak

func addPeeIntoButtons():
	var items = GM.pc.getInventory().getItemsWithTag(ItemTag.CanPeeInto)
	for item in items:
		if(item.getFluids().isFull()):
			addDisabledButton(item.getStackName(), item.getVisisbleDescription())
		else:
			addButton(item.getStackName(), item.getVisisbleDescription(), "bathroom_fill", [item])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "lesson1"):
		getModule("TaviModule").advanceSkill("taviSkillWatersports")

	if(_action == "lesson2"):
		getModule("TaviModule").advanceSkill("taviSkillWatersports")

	if(_action == "bathroom"):
		getModule("TaviModule").advanceSkill("taviSkillWatersports")

	if(_action == "swallowing"):
		getModule("TaviModule").advanceSkill("taviSkillWatersports")

	if(_action == "cancel_lesson"):
		increaseFlag("TaviModule.Ch6Tiredness", -1)
		endScene()
		return

	if(_action == "les1_stalls"):
		processTime(4*60)

	if(_action == "les1_taviagrees"):
		processTime(2*60)

	if(_action == "les2_taviproblem"):
		processTime(2*60)

	if(_action == "les2_rip"):
		processTime(2*60)

	if(_action == "les2_solution"):
		processTime(2*60)

	if(_action == "les2_laundry"):
		processTime(3*60)

	if(_action == "bathroom_watch_pee"):
		processTime(5*60)

	if(_action == "bathroom_goldenshower"):
		processTime(5*60)

	if(_action == "bathroom_fill"):
		processTime(5*60)
		var item = _args[0]
		if(item != null):
			var howMuch = getCharacter("tavi").cumInItem(item, FluidSource.Pissing)
			usedItemName = item.getVisibleName()
			lastItemUniqueID = item.getUniqueID()
			addMessage("Tavi filled the "+usedItemName+" with "+str(Util.roundF(howMuch, 1))+" ml of her piss")

	if(_action == "bathroom_fill_take"):
		processTime(5*60)

	if(_action == "bathroom_fill_orderdrink"):
		processTime(2*60)
		var item = GM.pc.getInventory().getItemByUniqueID(lastItemUniqueID)
		if(item == null):
			return
		var fluids = item.getFluids()
		
		drankOnlyPiss = true
		if(fluids.getFluidAmountByType().keys().size() > 1):
			drankOnlyPiss = false
		
		fluids.transferTo(getCharacter("tavi").getBodypart(BodypartSlot.Head), 1.0)

	if(_action == "bathroom_goldenshower_pee"):
		processTime(2*60)
		getCharacter("tavi").pissedOnBy("pc")

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin
	data["waterSkill"] = waterSkill
	data["usedItemName"] = usedItemName
	data["lastItemUniqueID"] = lastItemUniqueID
	data["drankOnlyPiss"] = drankOnlyPiss

	return data

func loadData(data):
	.loadData(data)

	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
	waterSkill = SAVE.loadVar(data, "waterSkill", 0)
	usedItemName = SAVE.loadVar(data, "usedItemName", "")
	lastItemUniqueID = SAVE.loadVar(data, "lastItemUniqueID", "")
	drankOnlyPiss = SAVE.loadVar(data, "drankOnlyPiss", false)
