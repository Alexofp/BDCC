extends SceneBase

var bratCounter = 0

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

		addButton("Move slightly", "Wiggle your butt slightly while he isn't watching", "2_brat")
		addButton("Stay still", "Do as he orders", "2_still")
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
	if(state == "2_still"):
		saynn("You do your best, freezing in place. Your hands are placed by your sides, your gaze directed exactly forward. No words leave your mouth.")

		saynn("You still see Alex in the corner of your vision. He scratches his chin slightly.")

		saynn("[say=alexrynard]Good. Let's see what we're working with.[/say]")

		addButton("Continue", "See what happens next", "3")
	if(state == "2_brat"):
		saynn("You freeze in place, your hands are placed by your sides, your gaze directed exactly forward. You still see Alex in the corner of your vision.. and that makes you wonder about how much you can get away with.")

		saynn("Alex scratches his chin slightly while you proceed to wiggle your {pc.masc} behind ever so slightly, just swaying it, following the imaginary wind.")

		saynn("Hah. He doesn't notice. Makes you smile softly as you taunt him more with your butt.")

		saynn("[say=alexrynard]Hm..[/say]")

		saynn("You freeze again when he approaches you. His gaze is drilling you..")

		saynn("Suddenly, he raises his hand.. and quickly brings it down on your butt.. before stopping at the last possible moment, avoiding spanking you.")

		saynn("[say=alexrynard]Next one is gonna be real.[/say]")

		saynn("Fair enough.. You are pouting a bit while standing still.")

		saynn("[say=alexrynard]Let's see what we're working with.[/say]")

		addButton("Continue", "See what happens next", "3")
	if(state == "3"):
		saynn("He stands in front of you. Arms crossed. Gaze focussed.")

		saynn("You can hear subtle humming as he examines your face features. Then, his palm boldly reaches out to cup your chin, making you raise your head a little.")

		saynn("[say=alexrynard]Mhm. Hm.[/say]")

		saynn("After checking out your face in great detail, he moves on to checking your {pc.masc} body too. His palm boldly travels over the curve of your shoulder, sending shivers through your muscles.. before slipping off.")

		saynn("Alex starts circling you, going out of your view, checking you out from the behind too. You don't dare to turn your head.. so you have no idea what he is doing behind you. Only his silent steps echo throughout the room.. along with your increased heart rate.")

		saynn("You can't shake off this thought.. Are you being judged? No, that's not it.. He said that you are in control here. And yet, right now you feel so..")

		saynn("Alex ends your train of thought early by taking a spot in front of you again.")

		saynn("[say=alexrynard]Pretty cute. I want you to forget that you are an inmate for now. You don't belong to this prison.[/say]")

		saynn("He cups your chin again, his other palm brushes over your cheek. While you are..")

		addButton("Allow it", "Let him do what he is doing", "3_allow")
		addButton("Stick tongue out", "", "3_brat")
		addButton("RED", "Say this", "3_red")
	if(state == "3_red"):
		saynn("..not having any of this.")

		saynn("[say=pc]Red.[/say]")

		saynn("Alex swiftly pulls his hands away.")

		saynn("[say=alexrynard]Did I make you uncomfortable?[/say]")

		saynn("He is clearly a bit sad. But his voice doesn't sound so.")

		saynn("[say=pc]A little bit, yes.[/say]")

		saynn("[say=alexrynard]My bad. Well, you got the taste of it at least. Want a hug maybe?[/say]")

		saynn("[say=pc]A hug?[/say]")

		saynn("[say=alexrynard]Just a friendly hug.[/say]")

		addButton("Get hugged", "Huggies!", "3_red_hug")
		addButton("It's fine", "No hug is fine", "3_red_nohug")
	if(state == "3_red_hug"):
		playAnimation(StageScene.Hug, "hug", {pc="alexrynard", npc="pc"})
		saynn("Might as well let him hug you..")

		saynn("You nod.. and then feel his warm embrace.")

		saynn("Feels nice..")

		saynn("After that little gesture, he helps you get back to the workshop.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "3_red_nohug"):
		saynn("[say=pc]I'm good.[/say]")

		saynn("Alex shrugs.")

		saynn("[say=alexrynard]Well, let's go back then.[/say]")

		saynn("He helps you get back to the workshop.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "3_brat"):
		saynn("..boldly sticking your tongue out at him. Alex raises a brow at you while you can't help but to smile.")

		saynn("Your smug attitude goes away very soon though as Alex suddenly catches your tongue with his claws, making it so you can't pull it back.")

		saynn("[say=pc]Oww-wh..[/say]")

		saynn("[say=alexrynard]You're free to brat, brat. As long as you are ready for the consequences.[/say]")

		saynn("You'd maybe say something but that's hard when you can't control your wet tongue. Your cheeks turn slightly red as you start drooling.")

		saynn("[say=alexrynard]Can I let go now?[/say]")

		saynn("You nod softly. And so Alex pulls his claws away from your wet tongue.")

		saynn("[say=alexrynard]Adorable.[/say]")

		saynn("He is smiling.")

		saynn("[say=alexrynard]Forget that you belong to this prison. During this very.. scene.. you belong to me and me only.[/say]")

		addButton("Continue", "See what happens next", "4")
	if(state == "3_allow"):
		saynn("..allowing him to do it, standing completely still, just like you were ordered. His touch is warm anyway, why would you deny it.")

		saynn("[say=alexrynard]For the duration of this very.. scene.. you belong to me now. And me only.[/say]")

		addButton("Continue", "See what happens next", "4")
	if(state == "4"):
		saynn("Alex leans in real close.. almost like he is about to kiss you.. just to take a step back moments later.")

		saynn("[say=alexrynard]If you understood it.. I want you to start addressing me as Sir from now on. Yes, Sir. With that exact intonation.[/say]")

		addButton("Yes, sir", "Say this", "4_brat")
		addButton("Yes, Sir", "Say this", "4_yessir")
		addButton("RED", "Say this", "4_red")
		if (false):
			addButton("Test", "You shouldn't see this", "4_brat")
	if(state == "4_red"):
		saynn("[say=pc]RED.[/say]")

		saynn("Alex puts away his drilling gaze.")

		saynn("[say=alexrynard]Too much for you?[/say]")

		saynn("You nod. Alex lowers his gaze.")

		saynn("[say=alexrynard]I understand. Want a hug?[/say]")

		saynn("[say=pc]A hug?[/say]")

		saynn("He nods.")

		addButton("Get hugged", "Huggies!", "3_red_hug")
		addButton("It's fine", "No hug is fine", "3_red_nohug")
	if(state == "4_yessir"):
		saynn("Short and snappy, shouldn't be too hard to remember..")

		saynn("[say=pc]Yes, Sir![/say]")

		saynn("You are still looking forward while exclaiming that.")

		saynn("Corners of Alex's mouth move up a bit. But then he catches himself, his face switching back to a neutral expression.")

		saynn("[say=alexrynard]Yes what?[/say]")

		saynn("[say=pc]I belong to you.. in this scene.. Sir.[/say]")

		saynn("He nods a few times softly.")

		addButton("Continue", "See what happens next", "5")
	if(state == "4_brat"):
		saynn("What was the assignment again?.. Oh right.")

		saynn("[say=pc]Yes, sir.[/say]")

		saynn("You stand still, puffing your chest out proudly, awaiting your reward.")

		saynn("[say=alexrynard]Try again.[/say]")

		saynn("You put on confused eyes.")

		saynn("[say=pc]Huh? But that's what you asked![/say]")

		saynn("[say=alexrynard]Is that what I asked?[/say]")

		saynn("[say=pc]Yes?[/say]")

		saynn("[say=alexrynard]Repeat after me.[/say]")

		saynn("So annoying!")

		saynn("[say=alexrynard]Yes.[/say]")

		saynn("[say=pc]Yes.[/say]")

		saynn("[say=alexrynard]Sir.[/say]")

		saynn("[say=pc]Sir.[/say]")

		saynn("[say=alexrynard]Yes, Sir.[/say]")

		saynn("[say=pc]Yes, sir.[/say]")

		saynn("Alex blinks many times. And then starts glaring. You bravely stare back. But that's when his hand suddenly smacks your bratty butt!")

		saynn("[say=pc]OW![/say]")

		saynn("[say=alexrynard]Ow who?[/say]")

		saynn("[say=pc]OW, SIR![/say]")

		saynn("[say=alexrynard]That's the enthusiasm I'm looking for. Knew you had it in you.[/say]")

		saynn("You pout.. while Alex smirks.")

		addButton("Continue", "See what happens next", "5")
	if(state == "5"):
		saynn("Alex is still crossing his arms, his stare still making you feel smaller than you are. And yet, you feel comfortable..")

		saynn("[say=alexrynard]I'd like to see what I have.[/say]")

		saynn("His eyes take note of your clothes.")

		saynn("[say=alexrynard]Fully.[/say]")

		addButton("Undress", "Start taking off your clothing for him", "5_undress")
		addButton("Turn around", "He clearly wants to see you from every angle!", "5_turnaround")
		addButton("RED", "Say this", "5_red")
	if(state == "5_undress"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", bodyState={naked=true}})

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "brought_intro_breakroom"):
		processTime(3*60)

	if(_action == "first_green"):
		bratCounter += 1

	if(_action == "first_red_no"):
		bratCounter += 1

	if(_action == "1_brat"):
		bratCounter += 1

	if(_action == "2"):
		processTime(5*60)

	if(_action == "2_brat"):
		bratCounter += 1

	if(_action == "3_brat"):
		bratCounter += 1

	if(_action == "3_red_hug"):
		processTime(3*60)
		GM.pc.addPain(-20)
		addMessage("Hugs are nice!")

	if(_action == "4_brat"):
		bratCounter += 1

	if(_action == "5_turnaround"):
		bratCounter += 1

	setState(_action)

func saveData():
	var data = .saveData()

	data["bratCounter"] = bratCounter

	return data

func loadData(data):
	.loadData(data)

	bratCounter = SAVE.loadVar(data, "bratCounter", 0)
