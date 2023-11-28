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

		if (GM.pc.hasBoundArms() || GM.pc.hasBlockedHands() || GM.pc.hasBoundLegs() || GM.pc.isBlindfolded() || GM.pc.isGagged() || GM.pc.isWearingPortalPanties()):
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
	if(state == "5_red"):
		saynn("Asking for you to take off your clothes.. is clearly too much.")

		saynn("[say=pc]RED.[/say]")

		saynn("So you draw the line there.")

		saynn("Alex stops and takes a step back.")

		saynn("[say=alexrynard]Made you uncomfortable?[/say]")

		saynn("[say=pc]Yeah..[/say]")

		saynn("He nods a few times.")

		saynn("[say=alexrynard]I understand. Can just watch tv for a bit if you want.[/say]")

		saynn("[say=pc]TV?[/say]")

		saynn("[say=alexrynard]Yeah, just to relax.[/say]")

		addButton("Sure", "TV sounds good", "5_red_tv")
		addButton("It's fine", "You'd rather leave now", "5_red_notv")
	if(state == "5_red_notv"):
		saynn("[say=pc]It's fine.[/say]")

		saynn("Alex scratches behind his head.")

		saynn("[say=alexrynard]Well. Hope it was at least somewhat fun then.[/say]")

		saynn("After that, he helps you to get back to the workshop.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "5_red_tv"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Might as well.")

		saynn("[say=pc]Sure. I hate the news though.[/say]")

		saynn("Alex shrugs and pulls out a cassette from under one of the tables.")

		saynn("[say=alexrynard]We can watch this.[/say]")

		saynn("You sit on a couch while Alex is inserting it into the tv.")

		saynn("[say=pc]What is it?[/say]")

		saynn("[say=alexrynard]Galaxy at Peace.[/say]")

		saynn("Huh, you never saw that.")

		saynn("[say=alexrynard]I'm not a fan of the fantasy genre myself but you gotta work with what you have.[/say]")

		saynn("Oh well. You just relax and turn your brain off for the next 90 minutes. Alex is sitting near, occasionally producing a sigh.")

		saynn("The movie is.. honestly.. trash. There is no conflict, all the characters are sickeningly-kind and everything always works out for them. But at least there is no corporate propaganda in this one. At least you think so. Lots of empty space though.")

		saynn("And yet, Alex was still invested.")

		saynn("[say=pc]Why do you like it?[/say]")

		saynn("He shrugs.")

		saynn("[say=alexrynard]I like the ship design.[/say]")

		saynn("Ship design? You can't help but to look confused. Alex sees your confusion and smiles.")

		saynn("[say=alexrynard]Why do you think I became an engineer?[/say]")

		saynn("One childhood movie later, it was time to go back..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "5_turnaround"):
		saynn("He clearly wants to see all of you from all angles! So you do exactly what he wants and take a few steps back so you can fit in his vision cone before doing a few twirls, becoming a little dizzy in the process.")

		saynn("[say=pc]There you go, sir~. You like what you see?[/say]")

		saynn("Alex sighs.")

		saynn("[say=alexrynard]That's not what I meant.[/say]")

		saynn("[say=pc]Huh? What did you mean then?[/say]")

		saynn("He starts gesturing to you to come closer.")

		saynn("[say=pc]What?[/say]")

		saynn("[say=alexrynard]You know what.[/say]")

		saynn("You tilt your head slightly.")

		saynn("[say=pc]Pussy grab move?[/say]")

		saynn("Alex facepalms.. and then approaches you himself, his palm swiftly reaching your ass, spanking it! You yelp as more spanks follow soon after, forcing you to get back to the middle of the room.")

		saynn("[say=pc]Ow![/say]")

		saynn("[say=alexrynard]Don't tell me that's not what you wanted.[/say]")

		saynn("[say=pc]What if it wasn't though?[/say]")

		saynn("[say=alexrynard]Then you would have safeworded.[/say]")

		saynn("Alex puts on a cheeky smile. As much as you don't wanna publicly admit it, he might be right..")

		saynn("[say=alexrynard]Now, it would be nice for you to do what I wanted this time.[/say]")

		saynn("Fine-e-e..")

		addButton("Undress", "Start taking off your clothing for him", "5_undress")
	if(state == "5_undress"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", bodyState={naked=true}})
		saynn("It's not hard to understand what he wants from you. And since you belong to him.. at least for the duration of this scene.. you proceed to obey.")

		saynn("[say=pc]Yes, Sir.[/say]")

		saynn("You {pc.undressMessage}. Alex's gaze follows the fluid motions of your hands as you do that. When you're done, there is no clothing left on you.. just your bulky metal collar.")

		saynn(""+str("Your {pc.breasts} are now on full display. You're not sure if you're allowed to cover yourself up with your hands.. probably not." if GM.pc.hasNonFlatBreasts() else "Your {pc.breasts} are now visible but that's okay.")+" "+str("Your {pc.penis} is also out, just like your {pc.pussyStretch} pussy." if (GM.pc.hasPenis() && GM.pc.hasVagina()) else "")+""+str("Your {pc.penis} is also out.." if (GM.pc.hasPenis() && !GM.pc.hasVagina()) else "")+""+str("Your {pc.pussyStretch} pussy is also not hidden anymore.." if (!GM.pc.hasPenis() && GM.pc.hasVagina()) else "")+"")

		addButton("Continue", "See what happens next", "6")
	if(state == "6"):
		saynn("Foxy's gaze.. so possessive. Alex begins another round of closely inspecting your body. He slowly circles around you, his eyes surely checking out your {pc.thick} butt in the process.")

		saynn("[say=alexrynard]Good {pc.girl}. Nothing to be ashamed of.[/say]")

		saynn("Yeah.. you've been naked many times. But this feels different. Alex limits his touches to gentle caressing, his palm landing on your body and carefully tracing its curves, sending shivers throughout..")

		saynn("Occasionally, his fingers pass over your"+str(" rich" if GM.pc.hasBigBreasts() else " modest")+" chest too, his claws finding your perky nips and just slightly poking them.."+str(" Until some {pc.milk} comes out.." if GM.pc.canBeMilked() else "")+"")

		if (GM.pc.isWearingChastityCage()):
			saynn("Obviously, his hands also reach out to play with your chastity cage a bit. His claws catch onto the metal frame.. and tug on it, testing how tightly it sits. One of his paws gently cups your balls.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Obviously, his hands also reach out down to your crotch. His hands slide over the surface of your {pc.penis}, testing how easy it is to cause a reaction. One of his paws gently cups your balls.")

		elif (GM.pc.hasReachableVagina()):
			saynn("Obviously, his hands also reach out down to your crotch. His hands don't dare to get too close, just gently brushing over the inner side of your thighs, caressing them.")

		saynn("[say=alexrynard]Do you like that?[/say]")

		addButton("Rougher", "Ask why isn't he being rougher", "6_brat")
		addButton("Yes Sir", "Say this", "6_yessir")
		addButton("RED", "Say this", "6_red")
	if(state == "6_red"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("It becomes a little too uncomfortable for you..")

		saynn("[say=pc]RED.[/say]")

		saynn("Alex immediately takes a step back, giving you all the space. He nods.")

		saynn("[say=alexrynard]Good job.[/say]")

		saynn("You grab your clothes and quickly put them back on.")

		saynn("[say=pc]Good job? Why? I safeworded.[/say]")

		saynn("[say=alexrynard]Exactly, you knew where your limits are. And you didn't let me push past them. As a good submissive should.[/say]")

		saynn("Submissive huh.")

		saynn("[say=alexrynard]Now.. Do you wanna chill maybe? You know, just rest, watch some tv maybe. No is completely fine.[/say]")

		addButton("Sure", "You don't mind watching some TV", "6_red_sure")
		addButton("Nah", "You'd rather leave now", "6_red_leave")
	if(state == "6_red_leave"):
		saynn("[say=pc]It's fine, I will be going now..[/say]")

		saynn("He nods.")

		saynn("[say=alexrynard]Okay, well. Hope it was fun.[/say]")

		saynn("He guides you back to the workshop after this.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "6_red_sure"):
		playAnimation(StageScene.Cuddling, "idle", {pc="alexrynard", npc="pc"})
		saynn("Might as well.")

		saynn("[say=pc]Sure. I hate the news though.[/say]")

		saynn("Alex shrugs and pulls out a cassette from under one of the tables.")

		saynn("[say=alexrynard]We can watch this.[/say]")

		saynn("You sit on a couch while Alex is inserting it into the tv.")

		saynn("[say=pc]What is it?[/say]")

		saynn("[say=alexrynard]Galaxy at Peace.[/say]")

		saynn("Huh, you never saw that.")

		saynn("[say=alexrynard]I'm not a fan of the fantasy genre myself but you gotta work with what you have.[/say]")

		saynn("Oh well. Alex is carefully pulling you in for some light cuddles. You just relax and turn your brain off for the next 90 minutes. Alex sighs occasionally.")

		saynn("The movie is.. honestly.. trash. There is no conflict, all the characters are sickeningly-kind and everything always works out for them. But at least there is no corporate propaganda in this one. At least you think so. Lots of empty space though.")

		saynn("And yet, Alex was still invested.")

		saynn("[say=pc]Why do you like it?[/say]")

		saynn("He shrugs.")

		saynn("[say=alexrynard]I like the ship design.[/say]")

		saynn("Ship design? You can't help but to look confused. Alex sees your confusion and smiles.")

		saynn("[say=alexrynard]Why do you think I became an engineer?[/say]")

		saynn("One childhood movie later, it was time to go back..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "6_brat"):
		saynn("[say=pc]I'd like it more if you were rougher![/say]")

		saynn("You feel your sense of control gradually fading away as Alex establishes direct eye contact.")

		saynn("[say=alexrynard]I thought you would never ask.[/say]")

		saynn("[say=pc]What you mean?[/say]")

		saynn("You try to take one step away from him.. but his hands kindly return you back to your spot. He is holding you in place.. while being as careful as possible with you.. and that is scary.. His voice is so sly..")

		saynn("[say=alexrynard]No need to worry about anything.[/say]")

		saynn("He stands to the side of you before bringing his maw close to your ear. His warm breath is making your body tingle..")

		saynn("His hand finds your hair. He whispers..")

		saynn("[say=alexrynard]Slave.[/say]")

		addButton("Continue", "See what happens next", "7")
	if(state == "6_yessir"):
		saynn("[say=pc]Yes, Sir..[/say]")

		saynn("You feel your sense of control gradually fading away each time you say it.. You willingly give it away to Alex.. And it feels good. Because it's not just a one-way transaction.. His hands keep exploring your body, his touch authoritative. All the while.. you just stand still.")

		saynn("[say=alexrynard]Yeah. No need to worry about anything. All you have to do is.. obey my words.[/say]")

		saynn("He stands to the side of you before bringing his maw close to your ear. His warm breath is making your body tingle..")

		saynn("His hand finds your hair. He whispers..")

		saynn("[say=alexrynard]..like a slave that you are.[/say]")

		addButton("Continue", "See what happens next", "7")
	if(state == "7"):
		playAnimation(StageScene.Duo, "hurt", {npc="alexrynard", bodyState={naked=true}})
		saynn("..before increasing the grip on your hair and pulling back, forcing a painful noise out of you.")

		saynn("[say=pc]Agh..[/say]")

		saynn("Your chin is looking high up, your whole naked body is trembling. And yet, you don't dare to resist.")

		saynn("[say=alexrynard]Say it. Are you a slave?[/say]")

		saynn("Is it time?.. Is this him going full out, trying to make you safeword?")

		addButton("Yes Sir", "Say this", "7_yessir")
		addButton("It", "Say it", "7_brat")
		addButton("RED", "Say this", "6_red")
	if(state == "7_brat"):
		saynn("[say=pc]It![/say]")

		saynn("Alex gets confused by you saying that. His hand is still gripping your hair tightly while his other hand lands on your neck, making you feel even more helpless.")

		saynn("[say=alexrynard]What? I'm asking you to say it fully.[/say]")

		addButton("I'm a slave", "Admit that you are a slave", "8_imslave")
		addButton("It fully!", "Say exactly what he ordered you to say", "8_brat")
		addButton("RED", "Say this", "6_red")
	if(state == "7_yessir"):
		saynn("But you don't give up that easily.. You're gritting your teeth and standing as still as possible.")

		saynn("[say=pc]H-h.. Yes, Sir![/say]")

		saynn("Alex sees your braveness.. and doesn't let go too, his grip on your hair only gets tighter while his other hand lands on your neck, making you feel even more helpless.")

		saynn("[say=alexrynard]Yes what? Say it fully.[/say]")

		addButton("I'm a slave", "Admit that you are a slave", "8_imslave")
		addButton("It fully!", "Say exactly what he ordered you to say", "8_brat")
		addButton("RED", "Say this", "6_red")
	if(state == "8_brat"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", bodyState={naked=true,hard=true}})
		saynn("Such an easy task!")

		saynn("[say=pc]It fully![/say]")

		saynn("Alex quickly understands what you did. And he isn't exactly happy about it.")

		saynn("[say=alexrynard]No, little brat. You're nothing but a slave. Worthless little slave that needs to be shown her place.[/say]")

		saynn("You keep enduring his painful grip even if an occasional groan escapes from your mouth. You feel degraded.. but why does it feel so good to hear these words then?"+str(" Your pussy is soaking wet even though he didn't touch it.." if GM.pc.hasReachableVagina() else "")+""+str(" Your {pc.penis} is rock hard, dripping precum non-stop.." if GM.pc.hasReachablePenis() else "")+"")

		saynn("[say=alexrynard]That's right, you are mine to play with. Mine to order around.[/say]")

		saynn("He brings his maw to your ear again.")

		saynn("[say=alexrynard]Mine to humiliate.[/say]")

		saynn("He lets go of your neck and hair.. before producing a little black sharpie.")

		saynn("Alex flicks off the pen cap and presses it against your skin.")

		saynn("If there ever was a time to safeword.. it's probably now..")

		addButton("Let him", "Let Alex draw something on you", "9_let")
		addButton("Steal it!", "Steal the sharpie", "9_brat")
		addButton("RED", "Say it", "6_red")
	if(state == "8_imslave"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", bodyState={naked=true,hard=true}})
		saynn("He is not gonna break you that easily.")

		saynn("[say=pc]Yes, Sir! I'm a slave! I'm your slave![/say]")

		saynn("You keep enduring his painful grip even if an occasional groan escapes from your mouth. You feel degraded.. but why does it feel so good to say these words then?"+str(" Your pussy is soaking wet even though he didn't touch it.." if GM.pc.hasReachableVagina() else "")+""+str(" Your {pc.penis} is rock hard, dripping precum non-stop.." if GM.pc.hasReachablePenis() else "")+"")

		saynn("[say=alexrynard]That's right, you are mine to play with. Mine to order around.[/say]")

		saynn("He brings his maw to your ear again.")

		saynn("[say=alexrynard]Mine to humiliate.[/say]")

		saynn("He lets go of your neck and hair.. before producing a little black sharpie.")

		saynn("Alex flicks off the pen cap and presses it against your skin.")

		addButton("Let him", "Let Alex draw something on you", "9_let")
		addButton("Steal it!", "Steal the sharpie", "9_brat")
		addButton("RED", "Say it", "6_red")
	if(state == "9_brat"):
		saynn("Just before the sharpie starts drawing something on you, your hands manage to steal it and draw some dirty stuff on him first! Take that!")

		saynn("[say=pc]Get humiliated![/say]")

		saynn("You knew that this wouldn't end well. Humiliating your sir.. it was obvious that the consequences were gonna come fast.. So you better just put on an innocent smile and hope they will be fun!")

		saynn("Alex sighs.. and then disarms you with one swift motion before wrenching your arm behind your back and proceeding to scribble things all over you..")

		saynn("[say=pc]Ow!..[/say]")

		saynn("[say=alexrynard]Indeed, ow.[/say]")

		saynn("After he is done, he takes a step back and admires you again.")

		saynn("[say=alexrynard]Great. You know how you look right now?[/say]")

		addButton("Whore", "Tell him that you look like a whore", "10_whore")
		if (GM.pc.getFemininity() >= 50):
			addButton("Princess", "Tell him that you look like a princess!", "10_brat")
		else:
			addButton("Prince", "Tell him that you look like a prince!", "10_brat")
		addButton("RED", "Say this", "6_red")
	if(state == "9_let"):
		saynn("He didn't ask you to do anything.. but you still feel like you should say it..")

		saynn("[say=pc]Yes, Sir..[/say]")

		saynn("And so Alex begins writing various humiliating words on you, testing how much dirty stuff can he fit before you'd safeword.")

		saynn("But you don't, you stand still, your posture straight, your gaze directed forward. All the while Alex covers your body with black ink..")

		saynn("After he is done, he takes a step back and admires you again.")

		saynn("[say=alexrynard]Great. You know how you look right now?[/say]")

		addButton("Whore", "Tell him that you look like a whore", "10_whore")
		if (GM.pc.getFemininity() >= 50):
			addButton("Princess", "Tell him that you look like a princess!", "10_brat")
		else:
			addButton("Prince", "Tell him that you look like a prince!", "10_brat")
		addButton("RED", "Say this", "6_red")
	if(state == "10_brat"):
		playAnimation(StageScene.Hug, "hug", {npc="pc", pc="alexrynard", npcBodyState={naked=true}})
		saynn("Your body says everything about who you are right now. And yet.. There is still only one correct answer..")

		if (GM.pc.getFemininity() >= 50):
			saynn("[say=pc]Bitch, I'm a princess.[/say]")

		else:
			saynn("[say=pc]Bitch, I'm a prince.[/say]")

		saynn("Alex smiles, hearing your bold answer.")

		saynn("[say=alexrynard]A very cute one, yeah~.[/say]")

		saynn("Did he really just call you cute?!")

		saynn("[say=pc]Yes, I'm.. no.. no you! I'm.. a..[/say]")

		saynn("He walks up close again and gives you a tight hug.")

		if (GM.pc.getFemininity() >= 50):
			saynn("[say=alexrynard]My spoiled little princess~.[/say]")

		else:
			saynn("[say=alexrynard]My spoiled little prince~.[/say]")

		saynn("His warm embrace coupled with his words make you all fuzzy inside..")

		saynn("[say=alexrynard]This will be enough for today.[/say]")

		saynn("Aww..")

		saynn("[say=alexrynard]But I'm not done with you yet.[/say]")

		addButton("Continue", "See what happens next", "aftercare")
	if(state == "10_whore"):
		playAnimation(StageScene.Hug, "hug", {npc="pc", pc="alexrynard", npcBodyState={naked=true}})
		saynn("With so many dirty things written on you there is only one right answer..")

		saynn("[say=pc]A whore..[/say]")

		saynn("Alex smiles, seeing you blush so hard.")

		saynn("[say=alexrynard]What was that? A little louder please.[/say]")

		saynn("[say=pc]I look like a slut. A whore.[/say]")

		saynn("He walks up close again and gives you a tight hug.")

		saynn("[say=alexrynard]My whore~.[/say]")

		saynn("His warm embrace makes you all fuzzy inside..")

		saynn("[say=alexrynard]This will be enough for today.[/say]")

		saynn("Aww..")

		saynn("[say=alexrynard]But I'm not done with you yet.[/say]")

		addButton("Continue", "See what happens next", "aftercare")
	if(state == "aftercare"):
		setFlag("AlexRynardModule.1TrustCompleted", true)
		playAnimation(StageScene.Cuddling, "idle", {pc="alexrynard", npc="pc", npcBodyState={naked=true}})
		saynn("Instead of just ending the scene abruptly, he pulls you onto the couch for some light cuddling, his caring hands gently kneading your muscles, calming you down. Your mind slowly recovers from what just happened..")

		if (bratCounter >= 10):
			saynn("[say=alexrynard]I was keeping notes. You were a brat.. exactly "+str(bratCounter)+" times. Wow. You don't play by the rules, do you?[/say]")

			saynn("You put your cute innocent eyes on, pretending to not understand what he is talking about.")

		elif (bratCounter <= 0):
			saynn("[say=alexrynard]I was keeping notes. You were a brat.. oh wow, you didn't brat even once. Such an obedient inmate.[/say]")

			saynn("You can't help but to blush again, hearing him praise you.")

		else:
			saynn("[say=alexrynard]I was keeping notes. You were a brat.. exactly "+str(bratCounter)+" times. You like being cheeky sometimes, right? But you also don't mind obeying.[/say]")

			saynn("You can't help but to blush again, hearing him describe you.")

		saynn("[say=alexrynard]So yeah, that's it. Scene is over, you can stop calling me sir. Did you like it?[/say]")

		addButton("It was fun", "Say this", "aftercare_fun")
		addButton("Yes Sir", "Say this", "aftercare_yessir")
		addButton("Okay-ish", "Say this", "aftercare_okayish")
		addButton("Rougher!", "Ask him to be rougher next time", "aftercare_rougher")
	if(state == "aftercare_fun"):
		saynn("[say=pc]It was fun.[/say]")

		saynn("Alex smiles and gently pats you on the head.")

		saynn("[say=alexrynard]I'm glad you liked it. We could try some other things in the future.[/say]")

		saynn("He spends some more time with you, cuddling.")

		saynn("But at some time, all good things come to an end. Alex helps you to get back to the workshop at least.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "aftercare_yessir"):
		saynn("[say=pc]Yes, Sir![/say]")

		saynn("Alex sighs.. but pats you on the head anyway.")

		saynn("[say=alexrynard]You're not my slave or pet or sub. Don't say that.[/say]")

		saynn("Aww.")

		saynn("[say=alexrynard]Glad you liked it though.[/say]")

		saynn("He spends some more time with you, cuddling.")

		saynn("But at some time, all good things come to an end. Alex helps you to get back to the workshop at least.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "aftercare_okayish"):
		saynn("You try to find the best words for this.")

		saynn("[say=pc]It was okay-ish.[/say]")

		saynn("Alex shrugs.")

		saynn("[say=alexrynard]Fair enough. We both probably learned something today so I'm not mad.[/say]")

		saynn("He spends some more time with you, cuddling.")

		saynn("But at some time, all good things come to an end. Alex helps you to get back to the workshop at least.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "aftercare_rougher"):
		saynn("[say=pc]You totally could have been rougher![/say]")

		saynn("Alex chuckles and pats you on the head.")

		saynn("[say=alexrynard]You think so? Then I guess I have to step up my game for the next time, huh.[/say]")

		saynn("[say=pc]Yeah! You also said that you will push me to safeword no matter what, what's up with that?[/say]")

		saynn("Alex shrugs.")

		saynn("[say=alexrynard]I said that to make sure you weren't afraid to safeword.[/say]")

		saynn("[say=pc]So you lied?[/say]")

		saynn("[say=alexrynard]To make you feel better.[/say]")

		saynn("[say=pc]It was still a lie though..[/say]")

		saynn("[say=alexrynard]You feel betrayed?[/say]")

		saynn("You'd say yes but his serious tone makes you want to turn down your bratiness for a bit..")

		saynn("[say=pc]Not really.[/say]")

		saynn("[say=alexrynard]Then.. I don't think it was a lie.[/say]")

		saynn("He spends some more time with you, cuddling.")

		saynn("But at some time, all good things come to an end. Alex helps you to get back to the workshop at least.")

		addButton("Continue", "See what happens next", "endthescene")

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

	if(_action == "6_brat"):
		bratCounter += 1

	if(_action == "7_brat"):
		bratCounter += 1

	if(_action == "8_brat"):
		bratCounter += 1

	if(_action == "9_let"):
		for _i in range(5):
			GM.pc.addBodywritingRandom()

	if(_action == "9_brat"):
		for _i in range(8):
			GM.pc.addBodywritingRandom()
		getCharacter("alexrynard").addBodywritingRandom()
		bratCounter += 1

	if(_action == "10_brat"):
		bratCounter += 1

	if(_action == "aftercare"):
		processTime(30*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["bratCounter"] = bratCounter

	return data

func loadData(data):
	.loadData(data)

	bratCounter = SAVE.loadVar(data, "bratCounter", 0)
