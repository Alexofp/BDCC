extends SceneBase

func _init():
	sceneID = "AlexTrustExercise1Scene"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("The idea of a trust exercise seems interesting to you. And now seems like as good of a time as any to do one. So, you walk up to Alex and wait for a good moment to ask.")

		saynn("[say=pc]I wanna try to do that trust exercise with you.[/say]")

		if (GM.pc.hasBoundArms() || GM.pc.hasBlockedHands() || GM.pc.hasBoundLegs() || GM.pc.isBlindfolded() || GM.pc.isGagged()):
			saynn("Alex notices your restraints and hums")

			saynn("[say=alexrynard]Kinky. But I need your body to be fully free.[/say]")

			saynn("Huff, what a buzzkill. Looks like you have to struggle out of your restraints first.")

			addButton("Oh well", "Was worth a try", "endthescene")
		elif (GM.pc.isFullyNaked()):
			saynn("Alex sees your naked body and hums.")

			saynn("[say=alexrynard]Please cover up yourself with something first. Clothing will be important for this first one.[/say]")

			saynn("Huff, what a buzzkill. Looks like you have to be wearing something before asking this.")

			addButton("Oh well", "Was worth a try", "endthescene")
		elif (GM.pc.hasEffect(StatusEffect.CoveredInCum)):
			saynn("Alex notices how messy you are and sighs.")

			saynn("[say=alexrynard]Please clean yourself first. You're way too messy.[/say]")

			saynn("Huff, what a buzzkill. Looks like you will have to take a shower first.")

			addButton("Oh well", "Was worth a try", "endthescene")
		else:
			saynn("Alex puts his current project away and looks at you, his eyes quickly checking your clothed clean body out.")

			saynn("[say=alexrynard]Are you sure? This will be very different from what everyone else does here. What I'm saying is, be ready to be disappointed.[/say]")

			saynn("That only fuels the intrigue more..")

			saynn("[say=pc]Yes.[/say]")

			saynn("[say=alexrynard]Well then. Time for a little break then. Follow me, inmate.[/say]")

			addButton("Follow", "See where he brings you", "brought_intro_breakroom")
	if(state == "brought_intro_breakroom"):
		aimCameraAndSetLocName("eng_breakroom")
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard"})
		saynn("Alex brings into a staff-only break room, the one that you are slightly familiar with already.")

		saynn("It's not the biggest, but it is quite cozy here. Sofa, carpet, few chairs, a small tv, a vending machine, a little shower and even a bed. Why have different rooms when you can put everything you would ever need into one? Engineers sure know how to make any place 'their-own'.")

		saynn("[say=alexrynard]Take a seat.[/say]")

		saynn("You drop your butt onto the soft furniture and look up at Alex.")

		saynn("[say=alexrynard]Some rules are in order before we start. I'm not the most experienced person myself so cut me some slack. But we might get somewhere.[/say]")

		saynn("He grabs an energy drink from the vending machine and starts sipping from it. Huh, he didn't even have to pay for it.")

		saynn("[say=alexrynard]I will take the dominant position. I'm a 'dom'. But that doesn't mean that you have no say in what's happening here. You're not 'forced' to listen to my words. And you're also free to make me stop at any point.[/say]")

		saynn("Alex sips some more life juice before placing the can away for now.")

		saynn("[say=alexrynard]Let's say.. Red. If I hear 'Red' I stop what I'm doing immediately.[/say]")

		saynn("[say=pc]A safeword.[/say]")

		saynn("[say=alexrynard]Yeah, sure. If everything is okay, you can say 'Green'. And I will trust your word even if your whole body is resisting during that moment, okay?[/say]")

		addButton("Yes", "Say this", "first_yes")
		addButton("Green", "Say this", "first_green")
		addButton("RED", "Say this", "first_red")
	if(state == "first_yes"):
		saynn("You nod softly.")

		saynn("[say=pc]Yes, you will trust my word.[/say]")

		saynn("[say=alexrynard]And, hopefully, you will trust mine.[/say]")

		saynn("A two-way street..")

		addButton("Continue", "See what happens next", "alex_explains_more")
	if(state == "first_green"):
		saynn("You put on a little smile and say..")

		saynn("[say=pc]Green.[/say]")

		saynn("Alex tilts his head slightly.")

		saynn("[say=alexrynard]You could have just said yes.[/say]")

		saynn("[say=pc]But that would have been boring.[/say]")

		saynn("Alex sighs.")

		saynn("[say=alexrynard]Anyway..[/say]")

		addButton("Continue", "See what happens next", "alex_explains_more")
	if(state == "first_red"):
		saynn("You have an urge that you can not fight anymore..")

		saynn("[say=pc]RED![/say]")

		saynn("Your loud exclamation even makes Alex recoil back.")

		saynn("[say=alexrynard]But we didn't even start yet. Are you being serious?[/say]")

		addButton("Yes", "Say this", "first_red_yes")
		addButton("No", "Say this", "first_red_no")
		addButton("RED", "Say this", "first_red_red")
	if(state == "first_red_yes"):
		saynn("[say=pc]Yeah.[/say]")

		saynn("Alex shrugs.")

		saynn("[say=alexrynard]Well, I don't know what I did that made you bail so fast. But I respect your decision.[/say]")

		saynn("He lets you out of the room.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "first_red_no"):
		saynn("[say=pc]No, I'm just joking.[/say]")

		saynn("Alex crosses his arms and rolls his eyes.")

		saynn("[say=alexrynard]Very funny.[/say]")

		saynn("[say=pc]I know.[/say]")

		saynn("[say=alexrynard]Anyway..[/say]")

		addButton("Continue", "See what happens next", "alex_explains_more")
	if(state == "first_red_red"):
		saynn("For some reason the urge has only gotten stronger.. You just can't hold back anymore..")

		saynn("[say=pc]RED!![/say]")

		saynn("[say=alexrynard]Alright, you know what..[/say]")

		saynn("He grabs you by the collar and pulls you out of the room.")

		saynn("[say=alexrynard]Come back when you stop acting like a child.[/say]")

		saynn("Fair enough..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "alex_explains_more"):
		saynn("[say=alexrynard]I will start slow. But then I will purposefully try to make you safeword. You understand? You have to safeword at some point.[/say]")

		saynn("[say=pc]Okay.[/say]")

		saynn("Alex inhales and exhales audibly.")

		saynn("[say=alexrynard]Alright. Let's start then. Take my current spot and stand still.[/say]")

		saynn("He takes a few steps to the side, inviting you to stand roughly in the middle of the room.")

		addButton("Stand in middle", "Stand where he ordered you to stand", "1_middle")
		addButton("Stand on his toes", "Stand EXACTLY where Alex is standing right now", "1_brat")
		addButton("RED", "Say this", "first_red")
	if(state == "1_brat"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("You get up.. but instead of standing where he showed you, you decide to get up real close in his personal space and stand on his toes! Suddenly seeing your smug face from so close sure catches him off guard.")

		saynn("[say=pc]Here~.[/say]")

		saynn("[say=alexrynard]Wha..[/say]")

		saynn("[say=pc]You did say to stand on your current spot. So here I am~.[/say]")

		saynn("He sighs and pushes you back into the right spot.")

		saynn("[say=alexrynard]Brat.[/say]")

		saynn("You pout and finally take the spot in the middle of the room. You even rotate to face the same direction.")

		saynn("[say=pc]What? Formulate your orders better.[/say]")

		addButton("Continue", "See what happens next", "2")
	if(state == "1_middle"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("You get up and stand exactly where he was standing before, facing the same direction that he was facing before. Your eyes are looking at him")

		saynn("Alex rubs his chin.. and then nods.")

		saynn("[say=alexrynard]Good.[/say]")

		saynn("You can't help but to smile a little. You are following his orders..")

		addButton("Continue", "See what happens next", "2")
	if(state == "2"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("Alex watches you silently for some time, his arms crossed, feet placed wide. He is not saying much for now but that is what makes you feel a little nervous, your gaze keeps slipping towards him.")

		saynn("Finally, he breaks the silence.")

		saynn("[say=alexrynard]Stay completely still, hands by your sides, look exactly forward.[/say]")

		saynn("Seems doable..")

		addButton("Stay still", "Do as he orders", "2_still")
		addButton("Move slightly", "Wiggle your butt slightly while he isn't watching", "2_brat")
		addButton("RED", "Say the safeword", "2_red")
	if(state == "2_red"):
		saynn("[say=pc]Red.[/say]")

		saynn("Alex lowers his arms and walks up closer.")

		saynn("[say=alexrynard]Was it something I said?[/say]")

		addButton("Boring", "Say that it's just boring", "2_red_boring")
		addButton("Too much", "Say that it's just too much", "2_red_toomuch")
	if(state == "2_red_boring"):
		saynn("[say=pc]It was just.. kinda boring..[/say]")

		saynn("[say=alexrynard]Well, sorry. Like I said before, if you're looking for instant rough sex, you should look somewhere else.[/say]")

		saynn("He brings you back into the workshop.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "2_red_toomuch"):
		saynn("[say=pc]It was just.. too much.[/say]")

		saynn("Alex tilts his head.")

		saynn("[say=alexrynard]Was it? Alright, well, my bad. Wanna rest?[/say]")

		saynn("[say=pc]I'm good.[/say]")

		saynn("He brings you back into the workshop.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "brought_intro_breakroom"):
		processTime(3*60)

	if(_action == "2"):
		processTime(5*60)

	setState(_action)
