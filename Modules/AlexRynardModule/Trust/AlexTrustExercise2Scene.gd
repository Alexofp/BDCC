extends SceneBase

var bratCounter = 0

func _init():
	sceneID = "AlexTrustExercise2Scene"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("You walk up to Alex and wait for a good moment to ask.")

		saynn("[say=pc]Can we do a trust exercise? Second one?[/say]")

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
			saynn("Alex quickly checks you and your outfit out before nodding.")

			saynn("[say=alexrynard]Sure, we can try something interesting today.[/say]")

			saynn("[say=pc]You're gonna push me?[/say]")

			saynn("He smiles.")

			saynn("[say=alexrynard]Not how it works. Follow me.[/say]")

			addButton("Follow", "See where he brings you", "brought_intro_breakroom")
	if(state == "brought_intro_breakroom"):
		aimCameraAndSetLocName("eng_breakroom")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("He brings you into the staff-only break room, the same one as before. Looks just as cozy as before.")

		saynn("[say=alexrynard]We're gonna do the same thing, seeing where your limits lie. If I hear 'RED', I stop what I'm doing immediately. If I don't hear it, even your tears won't stop me.. Well, tears probably would too. Got it?[/say]")

		saynn("Alex points at the center of the room. You take your spot and watch Alex rummage through some of his equipment, big boxes of it.")

		addButton("Yes", "You understand", "1_yes")
		addButton("Cry", "Shed a tear", "1_brat")
		addButton("RED", "Say this", "1_red")
	if(state == "1_red"):
		saynn("[say=pc]RED![/say]")

		saynn("He stops what he is doing and looks at you. After seeing that you're alright.. he rolls his eyes.")

		saynn("[say=alexrynard]Very funny. But it is very important. Did you understand what I said?[/say]")

		addButton("Yes", "You understand", "1_yes")
		addButton("RED", "Say this", "1_red_red")
	if(state == "1_red_red"):
		saynn("You don't why but you feel like you must..")

		saynn("[say=pc]RED!![/say]")

		saynn("He sighs and just invites you to leave. You can hardly hold the laughter.")

		saynn("[say=alexrynard]Come back when you get all of that out of your system.[/say]")

		saynn("Oh well. At least it was funny.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "1_yes"):
		saynn("[say=pc]Yes, I understand. All green.[/say]")

		saynn("Alex nods and then finds what he was looking for. A big cardboard box with something.")

		saynn("He pushes that box into the center of the room.")

		saynn("[say=pc]What's inside?[/say]")

		saynn("[say=alexrynard]Be a good {pc.boy} and undress. Maybe you will find out then.[/say]")

		addButton("Undress", "Do as he orders", "2_undress")
		addButton("Make me", "Be a brat about it", "2_brat")
		addButton("RED", "Say this", "2_red")
	if(state == "2_brat"):
		# (( You tell him to make you
		# (( He just starts dragging the box away. So you obey anyway
		pass
	if(state == "2_undress"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", bodyState={naked=true}})
		saynn("[say=pc]Yes, Sir.[/say]")

		saynn("You show that you remember how to address him. You {pc.undressMessage}, leaving nothing covered. Your {pc.privates} are all on display..")

		saynn("Seeing that you obeyed his words, Alex finally opens the box, exposing.. a little machine. The one that looks kinda like a saddle.. but with some rubber bits sticking out of it.. roughly where one is supposed to be sitting.")

		saynn("[say=alexrynard]Sybian. One of the simplest.. love machines. But I find it fun anyway.[/say]")

		saynn("He grabs the remote.")

		saynn("[say=alexrynard]I modified it a little.[/say]")

		saynn("[say=pc]Modified?[/say]")

		saynn("[say=alexrynard]Yeah, it's my guilty pleasure, getting more juice out of the hardware.[/say]")

		saynn("You can only guess what he did to this machine.. You will only find out when he actually turns it on.")

		saynn("[say=alexrynard]Hop on.[/say]")

		addButton("Stand on it", "Hop on", "3_brat")
		addButton("Sit on it", "Sit on the sybian", "3_syb")
		addButton("RED", "Say this", "3_red")
	if(state == "3_brat"):
		# (( Aw, it's not a footrest?
		pass
	if(state == "3_syb"):
		playAnimation(StageScene.SybianOral, "idle", {npc="alexrynard", bodyState={naked=true}})
		saynn("[say=pc]Yes, Sir..[/say]")

		saynn("You carefully position yourself above the sybian.. and begin to lower yourself onto it.")

		if (GM.pc.hasReachableVagina()):
			saynn("It has a small rubber dildo sticking out of it.. so you align your pussy hole with it. The smooth silicone spreads your folds with ease, allowing you to sit on it without much problems. Near the base of that dildo is a ridged little platform that your clit and sensitive folds instantly feel.")

		else:
			saynn("It has a small rubber dildo sticking out of it.. so you align your tailhole with it. The smooth silicone spreads your {pc.analStrech} star with ease, allowing you to sit on it without much problems. Near the base of that dildo is a ridged little platform that your taint area instantly feels.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Even without any direct stimulation, your locked away dick is already putting some pressure on the chastity cage.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Even without any direct stimulation, your {pc.penis} is already slowly getting harder.")

		saynn("[say=alexrynard]Mhm. I'm not gonna tie you up. Or gag you. Not today. If you feel uncomfortable, just get off. Otherwise.. Let's see how much you can handle.[/say]")

		addButton("Yes Sir", "Say this", "4_yessir")
		addButton("TIE ME UP!", "Demand it", "4_brat")
		addButton("RED", "Say this", "4_red")
	if(state == "4_brat"):
		# (( Fine you get a blindfold
		pass
	if(state == "4_yessir"):
		playAnimation(StageScene.SybianOral, "idle", {npc="alexrynard", bodyState={naked=true}})
		saynn("[say=pc]Yes, Sir..[/say]")

		saynn("Alex holds the remote with one hand while the second one twists one of the knobs by one notch.")

		if (GM.pc.hasReachableVagina()):
			saynn("The machine under you begins to hum quietly, the little dildo is vibrating inside your pussy with a low frequency. It feels.. quite pleasantly.. nothing insane but you can for sure feel it.")

		else:
			saynn("The machine under you begins to hum quietly, the little dildo is vibrating inside you with a low frequency. It feels.. quite pleasantly.. nothing insane but you can for sure feel it.")

		saynn("You exhale audibly and just sit still, your gaze directed straight forward.")

		saynn("[say=alexrynard]Tell me how it feels.[/say]")

		addButton("Like nothing", "Say this", "5_brat")
		addButton("Feels nice", "Say this", "5_nice")
		addButton("RED", "Say this", "5_red")
	if(state == "5_brat"):
		# (( He spikes the power and says that it would numb you fast
		pass
	if(state == "5_nice"):
		playAnimation(StageScene.SybianOral, "idle", {npc="alexrynard", bodyState={naked=true, hard=true}})
		saynn("[say=pc]Feels nice, Sir..[/say]")

		saynn("He nods and turns the knob again, causing the seat under you to vibrate a little more eagerly.")

		if (GM.pc.hasReachableVagina()):
			saynn("Even the little ridged platform that your clit is resting on is now shifting back and forth, providing some stimulation. You can't help but to produce your first little moan, your petals getting more wet every second.")

		else:
			saynn("Even the little ridged platform that your taint area is resting on is now shifting back and forth, providing some stimulation to your sensitive zone. You can't help but to produce your first little moan.")

		saynn("[say=pc]Ah..[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your caged up member begins to drip pre through the chastity as the dildo starts vibrating harder against your pleasure spot.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your cock gets fully hard and starts dripping pre as the dildo starts vibrating harder against your pleasure spot.")

		saynn("Alex is just standing near, his eyes watching you with great interest.")

		saynn("[say=alexrynard]Yeah, I can tell by now. Looks like you're ready for more.[/say]")

		addButton("Cry!", "Shed a tear", "6_brat")
		addButton("Brace", "Prepare for what's to come", "6_brace")
		addButton("RED", "Say this", "6_red")
	if(state == "6_brace"):
		playAnimation(StageScene.SybianOral, "ride", {npc="alexrynard", bodyState={naked=true, hard=true}})
		saynn("Seems like something is gonna happen.. so you brace, all your muscles tense up.")

		saynn("That might have been a mistake though.. Clenching around that dildo only made it worse when Alex turned the knob on his remote to a medium setting.")

		saynn("Instantly, you arch your back. The dildo vibrates inside you so hard that you can't help but to start squirming.")

		if (GM.pc.hasReachableVagina()):
			saynn("It'd be so easy to get up and make that feeling go away.. but you stay on it and let the machine pleasure you and your pussy.")

		else:
			saynn("It'd be so easy to get up and make that feeling go away.. but you stay on it and let the machine pleasure you.")

		saynn("[say=pc]Ah-h..[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your cock is pushing more against the chastity cage but the metal is too strong.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your cock twitches wildly, more precum dripping from it.")

		saynn("Alex seems to be quite intrigued by the noises that you make.")

		saynn("[say=alexrynard]Don't hold back, feel free to moan for me.[/say]")

		addButton("Moan", "Let it all out", "7_moan")
		addButton("Hold them", "Stay quiet for as long as you can", "7_brat")
		addButton("RED!", "Say this", "7_red")
	if(state == "7_moan"):
		saynn("And so you focus on these vibrations, forgetting about anything else.. and that elevates the perceived sensations to a whole new level..")

		saynn("[say=pc]Ah.. Ahh-h.. Hah-h..[/say]")

		if (GM.pc.hasReachableVagina()):
			saynn("The sybian is relentless, its vibrating parts pushing you further and further into the abyss of pleasure, your pussy dripping juices onto the seat. You can feel it building up in you.. a big wave.")

		else:
			saynn("The sybian is relentless, its vibrating parts pushing you further and further into the abyss of pleasure, your tailhole clenching around the small dildo. You can feel it building up in you.. a big wave.")

		saynn("[say=alexrynard]If you're gonna cum, I want you to ask permission first.[/say]")

		saynn("Looks like you have to beg..")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your locked up cock is desperately pushing against its metal cage, you're so close..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your balls are tensing up, your cock is leaking pre hard, you're so close..")

		addButton("Just cum!", "You're not gonna let him humiliate you!", "8_brat")
		addButton("Beg for it", "Humiliate yourself!", "8_beg")
		addButton("RED!", "Say it", "8_red")
	if(state == "8_brat"):
		# (( You don't get to cum so you have to hump it
		playAnimation(StageScene.SybianOral, "hold", {npc="alexrynard", bodyState={naked=true, hard=true}})
	if(state == "8_beg"):
		playAnimation(StageScene.SybianOral, "intense", {npc="alexrynard", bodyState={naked=true, hard=true}})
		saynn("[say=pc]May I.. cum?[/say]")

		saynn("It was a good attempt but Alex is clearly not impressed. He just watches you squirm, his hand resting on the remote.")

		saynn("[say=alexrynard]Who are you talking to?[/say]")

		saynn("[say=pc]You?.. Sir?[/say]")

		saynn("Alex tilts his head.")

		saynn("[say=alexrynard]Yeah?[/say]")

		saynn("The moment he starts to decrease the power, you get a sudden urge to say it all.")

		saynn("[say=pc]May I please cum, sir!..[/say]")

		saynn("He hums.. while you are squirming non-stop.. You're so close, all you need is an impulse.")

		saynn("[say=alexrynard]I don't know. Is that the best you can do?[/say]")

		saynn("[say=pc]Nh-h-h, may I please get permission to cum, Sir? Please, I beg you![/say]")

		saynn("His expression changes face, a little smile appears on his face. He turns the knob on the remote many notches, causing the seat under you to start vibrating hard..")

		saynn("[say=alexrynard]You may.[/say]")

		if (GM.pc.hasReachableVagina()):
			saynn("And pretty much instantly, your mind gets overwhelmed with a tidal wave of pleasure, your body getting pushed over the edge, your pussy gripping that vibrating dildo and producing a strong fountain of juices.")

			if (GM.pc.isWearingChastityCage()):
				saynn("Even though it's your lady bits that got overstimulated, your poor locked cock is still shooting a few weak spurts of your {pc.cum} through the little hole in the chastity cage, creating a cute mess on the floor.")

			elif (GM.pc.hasReachablePenis()):
				saynn("Even though it's your lady bits that got overstimulated, your {pc.penis} is still throbbing and shooting a few strong spurts of your {pc.cum}, creating a mess on the floor.")

		else:
			saynn("And pretty much instantly, your mind gets overwhelmed with a tidal wave of pleasure, your body getting pushed over the edge, your ass gripping that vibrating dildo, your pulsing inner walls clenching around it.")

			if (GM.pc.isWearingChastityCage()):
				saynn("The dildo of that sybian isn't the biggest.. but it's actually the perfect length to overstimulate your prostate, your poor locked cock is throbbing and shooting a few weak spurts of your {pc.cum} through the little hole in the chastity cage, creating a cute mess on the floor.")

			elif (GM.pc.hasReachablePenis()):
				saynn("The dildo of that sybian isn't the biggest.. but it's actually the perfect length to overstimulate your prostate, your {pc.penis} is throbbing and shooting a few strong spurts of your {pc.cum}, creating a mess on the floor.")

		saynn("[say=pc]Nh-h-h!.. Ahh!..[/say]")

		saynn("It's so hard to sit on the thing, your body just wants to arch itself while all sorts of cute noises leave your mouth.")

		saynn("[say=alexrynard]Good. What should you tell your Sir after he spent some of his time playing with you?[/say]")

		saynn("[say=pc]T-thank you-u!.. Sir.[/say]")

		saynn("Almost forgot that last bit.")

		saynn("[say=alexrynard]Good {pc.boy}.[/say]")

		saynn("Waves of warmth wash all over you. Feels so fucking good..")

		addButton("Continue", "See what happens next", "9_rest")
	if(state == "9_rest"):
		playAnimation(StageScene.SybianOral, "idle", {npc="alexrynard", bodyState={naked=true, hard=true}})
		saynn("Alex gradually turns off the sybian, giving you a chance to catch your breath.")

		saynn("[say=alexrynard]So. Was that enough for you?[/say]")

		addButton("Yes Sir", "That felt good", "10_end")
		addButton("Bring it on!", "You didn't even start yet", "10_more")
		if (getFlag("AlexRynardModule.ch2SceneNum", 0) >= 7):
			addButton("Offer mouth", "Offer the foxy some love too", "10_bj")
		else:
			addDisabledButton("Offer mouth", "He doesn't trust you enough for this")
	if(state == "10_end"):
		playAnimation(StageScene.Cuddling, "idle", {npc="alexrynard", bodyState={naked=true}})
		saynn("[say=pc]Yes, Sir. Thank you.[/say]")

		saynn("He helps you to get up, your legs are a bit shaky after that powerful orgasm. After that, he pulls you in for some cuddles.")

		if (bratCounter >= 6):
			saynn("[say=alexrynard]You were a brat.. exactly "+str(bratCounter)+" times. Not sure if I should be looking impressed or grabbing a whip.[/say]")

			saynn("You stick your tongue at him.. and receive a smack on your ass for that.. fair enough.")

			saynn("[say=alexrynard]At least I can practice my taming skills.[/say]")

		elif (bratCounter >= 1):
			saynn("[say=alexrynard]You were a brat.. exactly "+str(bratCounter)+" time"+str("s" if bratCounter > 1 else "")+". A nice balance between innocent and naughty.[/say]")

			saynn("You offer him a little cheeky smile.")

			saynn("[say=alexrynard]At least I can practice my taming skills.[/say]")

		else:
			saynn("[say=alexrynard]You were a brat exactly.. zero times. Wow, I can't recall a single time. Thank you for being so obedient.[/say]")

			saynn("You lower your submissive stare and feel Alex embracing you more tightly.")

		saynn("Some time passes while you cuddle together like that. Feels nice and cozy.")

		saynn("[say=alexrynard]Not enough people do this..[/say]")

		saynn("[say=pc]Cuddle?[/say]")

		saynn("[say=alexrynard]No.. um.. aftercare. Sometimes it's good to just spend time together, make sure everything is alright.[/say]")

		saynn("Yeah, inmates and staff here aren't really interested in that..")

		saynn("After your aftercare session is over, Alex helps you to get back to the workshop.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "10_more"):
		playAnimation(StageScene.SybianOral, "intense", {npc="alexrynard", bodyState={naked=true, hard=true}})
		saynn("[say=pc]Is that the best you can do, SIR?[/say]")

		saynn("Judging from how Alex is not saying anything after your words.. that might have been a huge mistake. Good.")

		if (GM.pc.hasReachableVagina()):
			saynn("You await the inevitable.. and soon enough.. the seat under you begins vibrating again, the dildo stimulating your inner walls and pressing on your g-spot while the ridged little platform is teasing your clit!")

		else:
			saynn("You await the inevitable.. and soon enough.. the seat under you begins vibrating again, the dildo stimulating your inner walls and pressing on your pleasure spot while the ridged little platform is stimulating your taint area!")

		saynn("[say=alexrynard]Try me.[/say]")

		saynn("You didn't really fully recover after the last orgasm.. which means that you are extremely sensitive down there. Moan after moan begins to escape from you.")

		saynn("[say=alexrynard]I don't hear the safeword.[/say]")

		saynn("And he won't, you knew exactly what you were doing.. everything now depends on where his limits are.")

		saynn("[say=pc]Nh-h-h!..[/say]")

		saynn("[say=alexrynard]Which means that you like it.[/say]")

		addButton("Continue", "See what happens next", "10_extraorgasms")
	if(state == "10_extraorgasms"):
		playAnimation(StageScene.SybianOral, "hold", {npc="alexrynard", bodyState={naked=true, hard=true}})
		saynn("It quickly becomes too much.. so you lift yourself slightly to try to avoid some of the stimulation.. But Alex is quick to push you back down onto the dildo.")

		saynn("[say=alexrynard]Nope, not until I hear it.[/say]")

		saynn("[say=pc]..until you hear how cute you are?.. nh-h..[/say]")

		saynn("You just had to, there was no other choice.")

		if (GM.pc.hasReachableVagina()):
			saynn("Alex sighs and just keeps twisting the knob on his remote.. more and more. The hard vibrations start to echo in your mind, your pussy walls keep clenching around the dildo which only make it worse.")

			saynn("[say=pc]Nh-h-h!.. Ah-h-h!..[/say]")

			saynn("Whatever he did to that sybian.. it's too much. You are quickly pushed past your point of no return again, your body arching, your pussy squirting juices"+str(", your {pc.penis} shooting strings of {pc.cum}" if GM.pc.hasPenis() else "")+".")

			saynn("[say=alexrynard]Think this is it? I got the best motors in it, the ones that airlocks use.[/say]")

			saynn("You keep moaning.. it actually starts to feel uncomfortable from how much stimulation your pussy receives, it even now has a red tint to it.")

			saynn("[say=pc]Nhh-hhh!..[/say]")

			saynn("Your eyes want to roll up, your tongue is out and drooling. The pleasure is mind-melting, your poor overstimulated pussy just keeps pulsing and gushing out transparent fluids, less and less each time.")

			if (GM.pc.isWearingChastityCage()):
				saynn("Your balls are also drained, your caged up dick is twitching a lot but all it can do is leak more precum.")

			elif (GM.pc.hasReachablePenis()):
				saynn("Your balls are also drained completely, your dick is twitching a lot but all it can do is leak more precum.")

			saynn("Just when you think you got fully numb to it.. another ecstatic wave is shoving you right back into a weird state of bliss and agony. Your muscles hurt, your pussy hurts.. and yet.. feels so fucking good..")

			saynn("As much as you don't want to.. This has to stop now..")

		else:
			saynn("Alex sighs and just keeps twisting the knob on his remote.. more and more. The hard vibrations start to echo in your mind, your anus walls keep clenching around the dildo which only make it worse.")

			saynn("[say=pc]Nh-h-h!.. Ah-h-h!..[/say]")

			saynn("Whatever he did to that sybian.. it's too much. You are quickly pushed past your point of no return again, your body arching, your tailhole clenching"+str(", your {pc.penis} shooting strings of {pc.cum}" if GM.pc.hasPenis() else "")+".")

			saynn("[say=alexrynard]Think this is it? I got the best motors in it, the ones that airlocks use.[/say]")

			saynn("You keep moaning.. it actually starts to feel uncomfortable from how much stimulation your anal ring receives, it even now has a red tint to it.")

			saynn("[say=pc]Nhh-hhh!..[/say]")

			saynn("Your eyes want to roll up, your tongue is out and drooling. The pleasure is mind-melting, your poor overstimulated anus just keeps pulsing and clenching around the dildo.")

			if (GM.pc.isWearingChastityCage()):
				saynn("Your balls are also drained, your caged up dick is twitching a lot but all it can do is leak more precum.")

			elif (GM.pc.hasReachablePenis()):
				saynn("Your balls are also drained completely, your dick is twitching a lot but all it can do is leak more precum.")

			saynn("Just when you think you got fully numb to it.. another ecstatic wave is shoving you right back into a weird state of bliss and agony. Your muscles hurt, your fuckhole hurts.. and yet.. feels so fucking good..")

			saynn("As much as you don't want to.. This has to stop now..")

		addButton("RED!", "It's too much", "10_toomuch_red")
	if(state == "10_toomuch_red"):
		playAnimation(StageScene.SybianOral, "ride", {npc="alexrynard", bodyState={naked=true, hard=true}})
		saynn("[say=pc]R-r.reh..[/say]")

		saynn("[say=alexrynard]What was that, little slut?[/say]")

		saynn("Oh fuck, you can't it spell it out anymore, your brain is basically mush and your body barely holds itself together.")

		saynn("[say=pc]Rr..hh-h!..[/say]")

		saynn("Orgasm after orgasm.. all of them forced.. Your slutty eyes roll up, lusty moans keep leaving your lips.")

		saynn("[say=alexrynard]Oh shit.[/say]")

		saynn("He instantly turns off the sybian when he sees that you're not.. doing particularly well.. or maybe perhaps too well.")

		saynn("[say=alexrynard]Are you okay?[/say]")

		saynn("All you can do is.. pant.. and moan. Your bruised fuckhole is still twitching.")

		saynn("[say=alexrynard]I will go get some soothing lube, sit tight.[/say]")

		saynn("Sitting tight is the last thing you want to do..")

		addButton("Continue", "See what happens next", "10_toomuch_cuddle")
	if(state == "10_toomuch_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {npc="alexrynard", bodyState={naked=true}})
		saynn("Alex returns and carefully helps to get up.. while your legs just refuse to listen. He gets some lube onto his fingers and then begins to gently spread it around your bruised sensitive flesh.")

		saynn("[say=pc]Ah..[/say]")

		saynn("After that, he just pulls you in for some cuddles.")

		saynn("[say=alexrynard]I fucked up, sorry.[/say]")

		saynn("So sweet.. you can only nuzzle his hand.")

		saynn("[say=pc]Is-s.. ok-k-ki-i-i..[/say]")

		saynn("[say=alexrynard]Nah, I should have paid more attention, got you all silly-fucked.[/say]")

		saynn("You chuckle, your breathing slowly calms down.. your "+str("pussy" if GM.pc.hasReachableVagina() else "tailhole")+" doesn't burn as much after that lube anymore.")

		saynn("[say=alexrynard]At least you liked it.[/say]")

		saynn("You spend some time together like that. His touch is nice and soft.")

		if (bratCounter >= 6):
			saynn("[say=alexrynard]You were a brat.. exactly "+str(bratCounter)+" times. Huh, maybe it was deserved.[/say]")

			saynn("You stick your tongue at him.. and receive a smack on your ass for that.. fair enough.")

			saynn("[say=alexrynard]Yeah, give me more brat taming practice, I don't mind.[/say]")

		elif (bratCounter >= 2):
			saynn("[say=alexrynard]You were a brat.. exactly "+str(bratCounter)+" time"+str("s" if bratCounter > 1 else "")+". A nice balance between innocent and naughty.[/say]")

			saynn("You offer him a little cheeky smile.")

			saynn("[say=alexrynard]Giving me more brat taming practice, I don't mind.[/say]")

		else:
			saynn("[say=alexrynard]You were a brat exactly.. just this one time. Thank you for being so obedient. Makes me feel even more bad.[/say]")

			saynn("You lower your submissive stare and feel Alex embracing you more tightly.")

		saynn("Eventually, your mind starts to clear up.")

		saynn("[say=pc]Thank you..[/say]")

		saynn("[say=alexrynard]Hah. What for?[/say]")

		saynn("[say=pc]For not breaking me completely.[/say]")

		saynn("He rolls his eyes.")

		saynn("[say=alexrynard]One broken person per room is enough.[/say]")

		saynn("You spend some more time cuddling.. before he helps you to return back to the workshop.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "brought_intro_breakroom"):
		processTime(3*60)

	if(_action == "1_brat"):
		bratCounter += 1

	if(_action == "1_red"):
		bratCounter += 1

	if(_action == "2_brat"):
		bratCounter += 1

	if(_action == "3_brat"):
		bratCounter += 1

	if(_action == "4_brat"):
		bratCounter += 1
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("blindfold"))

	if(_action == "5_brat"):
		bratCounter += 1

	if(_action == "7_brat"):
		bratCounter += 1

	if(_action == "8_brat"):
		bratCounter += 1

	if(_action == "8_beg"):
		GM.pc.orgasmFrom("alexrynard")

	if(_action == "10_end"):
		processTime(30*60)

	if(_action == "10_more"):
		bratCounter += 1

	if(_action == "10_extraorgasms"):
		GM.pc.orgasmFrom("alexrynard")
		GM.pc.addStamina(-50)

	if(_action == "10_toomuch_cuddle"):
		GM.pc.addStamina(50)
		processTime(30*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["bratCounter"] = bratCounter

	return data

func loadData(data):
	.loadData(data)

	bratCounter = SAVE.loadVar(data, "bratCounter", 0)
