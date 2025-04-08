extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "MentalGhostHands1"

func _run():
	if(state == ""):
		addCharacter("eliza")
		
	if(state == ""):
		saynn("Eliza steps into your cell, looking official, as usual. She casually drinks some coffee while looking at her tablet, not even paying much attention to you yet. After reading something for a bit she finally looks at you.")

		saynn("[say=eliza]Oh, I have a great one for you. We need to test a new drug. Apparently it has a side effect of causing partial blindness. But we need more data to figure out what ‘partial’ means.[/say]")

		addButton("Blind?", "Question the safety of such drug", "blind?")
		addButton("Obey", "(Behavior+) Let the doctor know that you agree to anything", "obey")


	if(state == "blind?"):
		saynn("[say=pc]Blindness? I don’t wanna be blind, can’t you test it on someone else.[/say]")

		saynn("Eliza sips more coffee out of her personal mug and fixes her reading glasses before getting closer to you and reaching her paw out to ruffle the hair.")

		# (if low behaviour)
		if(getModuleFlag("MedicalModule", "Mental_PCBehavior", 0.0) <= 0.4):
			saynn("[say=eliza]Your behavior so far wasn’t the best, patient. I’d suggest you to be a good test subject and let others decide what should and should not be done.[/say]")

			saynn("You feel strictness in her voice, the doctor is being quite serious. Though, after seeing your suppressed look, a cunning smile returns to her face.")

		# (if high behaviour)
		else:
			saynn("[say=eliza]Hmm. It says the effect is temporary. You should be fine, cutie pie.[/say]")

			saynn("The doctor is quite kind to you. Although you still feel some cunning tones in her speech, is she being honest or just trying to calm you down.")

		saynn("[say=eliza]No other questions? Good, let me prepare you.[/say]")

		saynn("Eliza puts out a loud chain leash and clips it to your collar before tugging you out the cell.")

		addButton("Follow", "See where she brings you", "follow")

	if(state == "obey"):
		saynn("You don’t question the legality or safety of such drugs and just tilt your head down, showing your submissive side.")

		saynn("[say=pc]Uh.. Yes, doctor Quinn. I’m here to be experimented on..[/say]")

		saynn("Eliza puts on a wide smile and pats you on the head.")

		saynn("[say=eliza]Great, that’s exactly what I wanna hear~. Do you even need sight if I’m just gonna walk you everywhere.[/say]")

		saynn("Doctor puts the tablet away and produces a chain leash. You raise your chin, letting her leash you, before standing up and follow her steps like a good test subject.")

		addButton("Follow", "See where she brings you", "follow")

#ACEPREGEXPAC - ghost hands scene 1, belly rubs

	if(state == "follow"):
		# (launches a walking scene first)
		aimCameraAndSetLocName("med_researchlab")
		playAnimation(StageScene.Solo, "sit")

		saynn("Eliza brings you into the lab and leashes you to the testing table. The leash is short enough for you not to be able to reach any equipment. You take a seat on the edge of the table and get cozy in your straitjacket while Eliza turns away and walks up to her chemistry station.")

		saynn("[say=eliza]Science is such a complicated field. Hard to find test subjects for. Hard to explain the importance. No one believes you until you solve all their problems.[/say]")

		saynn("Eliza starts prepping, she puts on a respirator mask and some latex gloves. Then she grabs some vial with unknown black substance and mixes it with water and some powder inside another vial. Doctor then puts it into some machine that starts to spin the vials at a very fast speed.")

		saynn("[say=eliza]Everything must be a business, everything must bring money. I’m here because it's fun, money is secondary. But I guess without money there wouldn’t be any science. And without science we wouldn’t be where we are today.[/say]")

		saynn("You just nod to her ramblings and watch her carefully filling a syringe with the resulting gray fluid. Doctor makes sure there aren’t any bubbles before walking up to you. More concerns start to flood your mind.")

		saynn("[say=eliza]I’ve come a long way since blowing up my parent’s lab. Don’t be afraid~[/say]")

		saynn("She did what.")

		addButton("Get drugged", "Let her inject you and see what happens", "get_drugged")

	if(state == "get_drugged"):
		removeCharacter("eliza")
		addCharacter("ghostHands")
		
		saynn("You close your eyes and feel the syringe needle piercing your skin just above the collar. Then you feel some pressure as the doctor starts injecting the unknown substance into your bloodstream.")

		saynn("[say=eliza]Let me know if you feel something. Can open your eyes.[/say]")

		saynn("[say=pc]Sure..[/say]")

		saynn("You obey and slowly open your eyes. The doctor is not anywhere to be seen even though you swear she was there a second ago. You look around but all you see is the bright lab room and lots of equipment.")

		saynn("[say=pc]Uhh.. Doctor? Did I pass out?[/say]")

		saynn("[say=eliza]No, you didn’t.[/say]")

		saynn("The voice startles you. There was nothing strange about it instead for the fact that there is no one standing in the direction it came from. You squint at a white wall and see just that, a wall.")

		saynn("[say=eliza]Very peculiar reaction~[/say]")

		saynn("[say=pc]I can’t see you, doctor.[/say]")

		saynn("Slight panic settles into you, you frantically shake your head but can’t find the source of that voice.")

		saynn("[say=eliza]Can you see yourself?[/say]")

		saynn("You look down at yourself. Yeah, everything seems to be there. Your {pc.masc} body, your straitjacket,"+str(" your growing belly," if GM.pc.isVisiblyPregnant() else "")+" a chain leash, the testing table that you’re sitting on, everything.")

		saynn("[b]Suddenly, a hand touches your chin[/b]. You jump, making the chain rattle, the hand is half-transparent, lacks any color, and is not attached to anything, just floating! And just as suddenly, the hand disappears into nothingness as it gets pulled away from you.")

		saynn("[say=pc]Uhhhh.. I might be seeing ghosts. One just touched me..[/say]")

		saynn("You hear Eliza’s chuckle but you still can’t see her. As far as you’re concerned, you’re alone in this room.")

		saynn("[say=eliza]Ghosts you say? Very interesting~. Let me conduct an experiment[/say]")

		addButton("Continue", "Spooky", "continue")

	if(state == "continue"):
		saynn("You sit still and try to stay calm as the ghost paw returns, now sliding over your cheek, caressing. At the same time, another ghostly paw materializes out of nothing and slides over the latex of your straitjacket before landing on your {pc.breasts}.")

		saynn("[say=pc]Uhh.. Doctor?[/say]")

		saynn("This time there is no response. Instead, the ghost paws get more eager. One of them slides over your lips and tries to invite itself in. Unsure of what to do, you slightly open your mouth and feel two transparent digits sneak inside and rest on your tongue. The sensations are quite strange even if somewhat arousing. The second paw boldy gropes your {pc.breasts} and tugs on the nipples before letting go, causing a pleasure spike. For being the ghost hands, these feel quite real.")

		saynn("[say=pc]Hh-h!..[/say]")

		saynn("The paw shushes you and wiggles its digits inside your mouth. Unsure why, you start suckling on them while the second ghost paw reaches down to your chastity belt and unlocking it, exposing more of your privates.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			if(GM.pc.isWearingChastityCage()):
				saynn("Your {pc.cock} is already leaking precum after it was released. The ghost paw gets a hold of the balls and kneads them, causing you to let out a muffled moan and try to close your legs. The cage puts so much nice-feeling pressure on your shaft.")
			else:
				saynn("Your {pc.cock} swiftly springs up after it was released, already leaking precum. The ghost paw gets a hold of the balls and kneads them, causing you to let out a muffled moan and try to close your legs.")

			# (if cock and also pussy)
			if(GM.pc.hasVagina()):
				saynn("The paw also gives some attention to your hidden pussy, giving its folds a little rub and spreading it, showing off how much it drips arousal.")

		# (else if has pussy)
		elif(GM.pc.hasVagina()):
			saynn("Your pussy slit is looking wet and needy after it was released, dripping arousal onto the table. The ghost paw spreads its folds open and gives the clit a rub, causing you to let out a muffled moan and try to close your legs.")

		if(GM.pc.isHeavilyPregnant()):
			saynn("The paw on your bits traces up over your hips and onto your very obvious pregnancy, feeling over it and massaging all strained and tender curves of your belly. You might've protested if it didnt feel kind of good. And if there weren't fingers in your mouth...")

			saynn("Suddenly feeling the small twinges of movement in your tummy brings you back to what's happening. The paw massaging your gravid form freezes for a second as one of the kicks presses up against it. Once everything dies back down, you are free to receive more belly rubs...")

		elif(GM.pc.isVisiblyPregnant()):
			saynn("The paw on your bits traces up over your hips and onto your rounded out belly bringing attention your early pregnancy, rubbing down the side of your midriff before reaching down and feeling the weight of it. The paw entirely free to give you a belly rub...")

		else:
			saynn("The paw on your bits traces up over your hips and giving your midriff a rub, pressing into you as you feel the ghostly force behind it...")
		
		saynn("You have no idea what’s going on, the ghostly paws do whatever they want to your body and all you can do is squirm on the table and drop muffled moans. Suddenly you feel someone’s lips closing around your nipple and teasing it by squeezing between the fangs. You look down and find nothing, except for a pair of ghostly lips and the teeth.")

#Just because this is a preg expansion doesnt mean I can't add milky tits too
#"Eliza" is the milking lady, she's gotta know how to suck on some tiddy
#also I gotta lay off the amount of commas in my writing
		if(GM.pc.canBeMilked()):
			saynn("Your nipples respond to the ghastly mouth latched to them by leaking fresh milk directly into the semi-transparent maw. A nice surprise that is happily sucked down and disappeared before your eyes. Feeling the strange tongue graze and lap at one of your now swollen nubs stimulating more milk from it... The lips wrapping around your {pc.breasts} and drinking freely in large sucks that seem to stimulate you more than actually draw milk from you. ")
			saynn("Detaching with a little pop the lips pull away. Not drawing enough milk to make your nipples sore and making all the leftovers run down your milky chest...")

		saynn("[say=pc]Wh-h..a..[/say]")

		# (if cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("The paw gags you by sliding its digits in and out, forcing you to focus on sucking them. All the while the second paw wraps its digits around your chastity cage and starts tugging and pushing on it, attempting to stimulate your member.")
		elif(GM.pc.hasPenis()):
			saynn("The paw gags you by sliding its digits in and out, forcing you to focus on sucking them. All the while the second paw wraps its digits around your shaft and starts stroking it.")

		# (if pussy)
		elif(GM.pc.hasVagina()):
			saynn("The paw gags you by sliding its digits in and out, forcing you to focus on sucking them. All the while the second paw slides some digits into your sex and proceeds to finger you.")

		saynn("The combined sensations are insane, you arch your back and let out more noises of pleasure. You feel like you won't be able to endure this for long. The ghostly paws and lips hear your noises and only increase their onslaught, eagerly pleasuring you and forcing you over your peak.")

		addButton("Cum!", "This is so strange!", "cum!")

	if(state == "cum!"):
		saynn("You squirm and wiggle on the table uncontrollably while the paws keep you still. More moans escape from your mouth while a powerful orgasm overwhelms you.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("The paws feel your cock throbbing and just hold onto your chastity cage, letting your dick shoot many strings of your {pc.cum} through it all over the floor underneath.")
		elif(GM.pc.hasPenis()):
			saynn("The paws feel your cock throbbing and switch to a very slow pace, letting your dick shoot many strings of your {pc.cum} all over the floor underneath without overstimulating it.")

		# (else if has pussy)
		elif(GM.pc.hasVagina()):
			saynn("The digits focus on your pleasure spot and hammer at it relentlessly, causing your slick pussy walls to start clenching around them. You squirt from so much stimulation, creating a little puddle of your femcum on the floor underneath.")

		# (else)
		else:
			saynn("The orgasm is strong, you arch your back harder and can’t stop licking the digits in your mouth.")

		saynn("Many orgasmic waves later, you’re left a panting wet mess. All the paws and the ghostly lips disappear.")

		saynn("[say=pc]Wha-a.. kh-h..[/say]")

		saynn("The Doctor's voice returns but you still can’t see her.")

		saynn("[say=eliza]Very good~.[/say]")

		saynn("[say=pc]What happened..[/say]")

		saynn("[say=eliza]What do you think happened~?..[/say]")

		saynn("You catch your breath and watch how the ghostly paws return just to lock the chastity belt on you again. Then the same paws grab the leash and pull on it, inviting you to get up.")

		saynn("[say=eliza]We might need more data later~. Thanks for your cooperation, test subject.[/say]")

		saynn("The same ghost paw then parades you back into your cell before leaving you there, all confused.")

		# (scene ends)
		
		addButton("Continue", "What was that", "endthescene")

func _react(_action: String, _args):
	if(_action == "follow"):
		runScene("ParadedOnALeashScene", ["eliza", GM.pc.getLocation(), "med_researchlab", [
			"Almost there, patient",
			"Today's experiment should be interesting",
			"Smile to the nurses",
		]])
	
	if(_action == "obey"):
		MedicalModule.addPCBehavior(0.1)
		
	if(_action == "get_drugged"):
		GM.pc.addIntoxication(0.8)
		
	if(_action == "cum!"):
		GM.pc.orgasmFrom("eliza")
		GM.pc.addSkillExperience(Skill.SexSlave, 20)
		GM.pc.addCredits(1)
		addMessage("You received 1 work credit!")
		
		setModuleFlag("MedicalModule", "Mental_ExpGhostHands", Util.maxi(1, getModuleFlag("MedicalModule", "Mental_ExpGhostHands", 0)))

	if(_action == "endthescene"):
		endScene()
		return

	
	setState(_action)

func getDevCommentary():
	return "Ghost hands is kinda an interesting concept. But it doesn't really fit the sci-fi setting because ghosts.. But I made it fit anyway x3. I had an idea for such drug a loooong time ago, even before I started writing this game. I hope it was interesting to read at least. Basically it just makes you blind for anything that's not static. But you still see anything that touches you and only it. Or maybe you feel the heat or something. And then your brain visualizes that as transparent ghost-like entities"

func hasDevCommentary():
	return true

