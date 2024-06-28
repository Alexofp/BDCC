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

		saynn("[say=alexrynard]We're gonna do the same thing, seeing where your limits lie. If I hear 'RED', I stop what I'm doing immediately. If I don't hear it, even your tears won't stop me.. Well, tears probably would. Got it?[/say]")

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
	if(state == "1_brat"):
		saynn("You shed a few tears on purpose rather than answering him. He notices that and.. rolls his eyes.")

		saynn("[say=alexrynard]Too early for that, brat.[/say]")

		saynn("Alex finally finds what he was looking for. A big cardboard box with something.")

		saynn("He pushes that box into the center of the room.")

		saynn("[say=pc]What's inside?[/say]")

		saynn("[say=alexrynard]Be a good {pc.boy} and undress. Maybe you will find out then.[/say]")

		addButton("Undress", "Do as he orders", "2_undress")
		addButton("Make me", "Be a brat about it", "2_brat")
		addButton("RED", "Say this", "2_red")
	if(state == "1_yes"):
		saynn("[say=pc]Yes, I understand. All green.[/say]")

		saynn("Alex nods and then finds what he was looking for. A big cardboard box with something.")

		saynn("He pushes that box into the center of the room.")

		saynn("[say=pc]What's inside?[/say]")

		saynn("[say=alexrynard]Be a good {pc.boy} and undress. Maybe you will find out then.[/say]")

		addButton("Undress", "Do as he orders", "2_undress")
		addButton("Make me", "Be a brat about it", "2_brat")
		addButton("RED", "Say this", "2_red")
	if(state == "2_red"):
		saynn("[say=pc]Red.[/say]")

		saynn("[say=alexrynard]Aw. Was I asking too much?[/say]")

		saynn("You nod.")

		saynn("[say=alexrynard]Well.. Sorry. This scene might not be for you then.[/say]")

		saynn("Scene? What the heck is he talking about?")

		saynn("Alex notices your confusion.")

		saynn("[say=alexrynard]By scene I mean session. BDSM is not really a.. therapy.. so the word scene makes more sense I feel like.[/say]")

		saynn("Fair enough.")

		saynn("[say=alexrynard]Thank you for stopping me. Let me show you the way out.[/say]")

		saynn("Alex guides you back to the workshop.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "2_brat"):
		saynn("[say=pc]Make me~.[/say]")

		saynn("He stares you in the eyes. Silently. All the while you smile and wait to be forced.")

		saynn("[say=alexrynard]Alright, not today I guess.[/say]")

		saynn("As he starts to push the box away.. you can't help but to feel cheated!")

		saynn("[say=pc]Hey! Fiiiine.[/say]")

		saynn("He stops and approaches you, his hand lands on your hair and gently caresses.. but also threatening to grab at any second.")

		saynn("[say=alexrynard]Undress. And address me correctly.[/say]")

		addButton("Yes Sir", "Do as he orders", "2_undress")
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
		addButton("RED", "Say this", "2_red")
	if(state == "3_brat"):
		playAnimation(StageScene.SybianOral, "idle", {npc="alexrynard", bodyState={naked=true}})
		saynn("Rather than sitting.. you stand on top of it! Alex facepalms. He said to hop on, that's his problem.")

		saynn("[say=alexrynard]Really?[/say]")

		saynn("[say=pc]Aw, it's not a footrest?[/say]")

		saynn("He suddenly pushes you down and positions your crotch just above the machine.")

		saynn("[say=alexrynard]Sit. Or you're gonna become a footrest.[/say]")

		saynn("Sounds fun.. but maybe for another time.")

		saynn("[say=pc]Finee-e-e.[/say]")

		saynn("You nod and begin to lower yourself onto the sybian.")

		if (GM.pc.hasReachableVagina()):
			saynn("It has a small rubber dildo sticking out of it.. so you align your pussy hole with it. The smooth silicone spreads your folds with ease, allowing you to sit on it without much problems. Near the base of that dildo is a ridged little platform that your clit and sensitive folds instantly feel.")

		else:
			saynn("It has a small rubber dildo sticking out of it.. so you align your tailhole with it. The smooth silicone spreads your {pc.analStretch} star with ease, allowing you to sit on it without much problems. Near the base of that dildo is a ridged little platform that your taint area instantly feels.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Even without any direct stimulation, your locked away dick is already putting some pressure on the chastity cage.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Even without any direct stimulation, your {pc.penis} is already slowly getting harder.")

		saynn("[say=alexrynard]Mhm. I'm not gonna tie you up. Or gag you. Not today. If you feel uncomfortable, just get off. Otherwise.. Let's see how much you can handle.[/say]")

		addButton("Yes Sir", "Say this", "4_yessir")
		addButton("TIE ME UP!", "Demand it", "4_brat")
		addButton("RED", "Say this", "2_red")
	if(state == "3_syb"):
		playAnimation(StageScene.SybianOral, "idle", {npc="alexrynard", bodyState={naked=true}})
		saynn("[say=pc]Yes, Sir..[/say]")

		saynn("You carefully position yourself above the sybian.. and begin to lower yourself onto it.")

		if (GM.pc.hasReachableVagina()):
			saynn("It has a small rubber dildo sticking out of it.. so you align your pussy hole with it. The smooth silicone spreads your folds with ease, allowing you to sit on it without much problems. Near the base of that dildo is a ridged little platform that your clit and sensitive folds instantly feel.")

		else:
			saynn("It has a small rubber dildo sticking out of it.. so you align your tailhole with it. The smooth silicone spreads your {pc.analStretch} star with ease, allowing you to sit on it without much problems. Near the base of that dildo is a ridged little platform that your taint area instantly feels.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Even without any direct stimulation, your locked away dick is already putting some pressure on the chastity cage.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Even without any direct stimulation, your {pc.penis} is already slowly getting harder.")

		saynn("[say=alexrynard]Mhm. I'm not gonna tie you up. Or gag you. Not today. If you feel uncomfortable, just get off. Otherwise.. Let's see how much you can handle.[/say]")

		addButton("Yes Sir", "Say this", "4_yessir")
		addButton("TIE ME UP!", "Demand it", "4_brat")
		addButton("RED", "Say this", "2_red")
	if(state == "4_brat"):
		playAnimation(StageScene.SybianOral, "idle", {npc="alexrynard", bodyState={naked=true}})
		saynn("[say=pc]Nuh! Tie me up right now![/say]")

		saynn("He sighs and deliberates for a second.")

		saynn("After that single second.. a blindfold gets forced over your eyes.")

		saynn("[say=alexrynard]This will do.[/say]")

		saynn("Aww, now you can't see his smug face.")

		saynn("[say=pc]That's not tying me up![/say]")

		saynn("[say=alexrynard]Fight me.[/say]")

		saynn("[say=pc]I will![/say]")

		if (GM.pc.hasReachableVagina()):
			saynn("But before you can do that, the machine under you begins to hum quietly, the little dildo starts vibrating inside your pussy at a low frequency.. enough to reconsider your approach. It feels.. quite pleasantly.. nothing insane but you can for sure feel it.")

		else:
			saynn("But before you can do that, the machine under you begins to hum quietly, the little dildo starts vibrating inside you at a low frequency.. enough to reconsider your approach. It feels.. quite pleasantly.. nothing insane but you can for sure feel it.")

		saynn("He has the remote so it's obviously him twisting the strength knob on it. You exhale audibly and just sit still, your head directed towards where you think Alex is.. But his voice ends up reaching you from a completely different position.")

		saynn("[say=alexrynard]So quiet all of the sudden. Tell me how it feels.[/say]")

		addButton("Like nothing", "Say this", "5_brat")
		addButton("Feels nice", "Say this", "5_nice")
		addButton("RED", "Say this", "5_red")
	if(state == "4_yessir"):
		playAnimation(StageScene.SybianOral, "idle", {npc="alexrynard", bodyState={naked=true}})
		saynn("[say=pc]Yes, Sir..[/say]")

		saynn("Alex holds the remote with one hand while the second one twists one of the knobs by one notch.")

		if (GM.pc.hasReachableVagina()):
			saynn("The machine under you begins to hum quietly, the little dildo is vibrating inside your pussy at a low frequency. It feels.. quite pleasantly.. nothing insane but you can for sure feel it.")

		else:
			saynn("The machine under you begins to hum quietly, the little dildo is vibrating inside you at a low frequency. It feels.. quite pleasantly.. nothing insane but you can for sure feel it.")

		saynn("You exhale audibly and just sit still, your gaze directed straight forward.")

		saynn("[say=alexrynard]Tell me how it feels.[/say]")

		addButton("Like nothing", "Say this", "5_brat")
		addButton("Feels nice", "Say this", "5_nice")
		addButton("RED", "Say this", "5_red")
	if(state == "5_red"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("[say=pc]RED![/say]")

		saynn("Alex instantly turns off the vibrating seat under you and helps you to get up.")

		saynn("[say=alexrynard]Aw. I pushed you too much?[/say]")

		saynn("[say=pc]A little..[/say]")

		saynn("[say=alexrynard]Sorry, these things aren't for everyone, I understand. Thank you for telling me.[/say]")

		saynn("You nod and slowly put your clothes back on.")

		saynn("[say=alexrynard]Wanna cuddle? Just to.. calm down.[/say]")

		addButton("Sure", "Do some casual cuddling", "5_red_cuddle")
		addButton("Nah", "You'd rather just go", "5_red_go")
	if(state == "5_red_go"):
		saynn("[say=pc]I'd rather just go.[/say]")

		saynn("[say=alexrynard]Fair enough, don't let me hold you.[/say]")

		saynn("He guides you back to the workshop.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "5_red_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {pc="alexrynard", npc="pc"})
		saynn("Sure, why the heck not. You agree and Alex pulls you onto the couch to watch some random news on the TV.")

		saynn("[say=alexrynard]Crazy how television has survived for so long, huh?[/say]")

		saynn("[say=pc]So far all I saw was propaganda.[/say]")

		saynn("Alex tilts his head slightly.")

		saynn("[say=alexrynard]Some don't watch it. Some watch it without realizing how manipulative it is. The worst kind is.. people who buy into the fantasy and watch it even though they know the reality..[/say]")

		saynn("[say=pc]Reality is often not pretty.[/say]")

		saynn("[say=alexrynard]Living in your dreams won't get you far.[/say]")

		saynn("[say=pc]Living in reality will get you depressed.[/say]")

		saynn("He hums.")

		saynn("[say=alexrynard]Fair point. There is no real answer then.[/say]")

		saynn("[say=pc]We're screwed no matter what.[/say]")

		saynn("And just like that.. you continue to mindlessly watch the news. Sometimes it's nice to turn off your head and just.. watch.")

		saynn("After that session, Alex brings you back to the workshop.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "5_brat"):
		playAnimation(StageScene.SybianOral, "idle", {npc="alexrynard", bodyState={naked=true, hard=true}})
		saynn("[say=pc]I don't feel anything![/say]")

		saynn("He hums.")

		saynn("[say=alexrynard]Oh really?[/say]")

		if (GM.pc.hasReachableVagina()):
			saynn("Alex twists the knob to its maximum setting! Suddenly, an earthquake starts happening between your legs. You gasp as the dildo in your pussy starts vibrating relentlessly against the inner walls and your little pleasure spot.")

			saynn("[say=pc]Oh fuck! OW![/say]")

			saynn("You arch your back.. but it actually hurts more than it brings you pleasure, it feels like ten cocks are fucking your pussy at the same time..")

		else:
			saynn("Alex twists the knob to its maximum setting! Suddenly, an earthquake starts happening between your legs. You gasp as the dildo in your ass starts vibrating relentlessly against the inner walls and your little pleasure spot.")

			saynn("[say=pc]Oh fuck! OW![/say]")

			saynn("You arch your back.. but it actually hurts more than it brings you pleasure, it feels like ten cocks are fucking your asshole at the same time..")

		saynn("After a few seconds of this intense rodeo, Alex dials down the strength to an acceptable level.. and the pain goes away.")

		saynn("[say=alexrynard]I guess you were lying, huh. Brave.[/say]")

		saynn("[say=pc]Listen..[/say]")

		saynn("[say=alexrynard]No you. I don't want to numb you out so we're doing it slow. Relax and let me bring you through this journey. Little brat.[/say]")

		saynn("Who's more bratty here..")

		saynn("He wasn't lying though, it starts to feel quite nice when you focus on the vibrations..")

		if (GM.pc.hasReachableVagina()):
			saynn("The little ridged platform that your clit is resting on is now shifting back and forth, providing some stimulation. You can't help but to produce your first little moan, your petals getting more wet every second.")

		else:
			saynn("The little ridged platform that your taint area is resting on is now shifting back and forth, providing some stimulation to your sensitive zone. You can't help but to produce your first little moan.")

		saynn("[say=pc]Ah..[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your caged up member begins to drip pre through the chastity as the dildo starts vibrating harder against your pleasure spot.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your cock gets fully hard and starts dripping pre as the dildo starts vibrating harder against your pleasure spot.")

		saynn("Alex is just standing near, his eyes watching you with great interest.")

		saynn("[say=alexrynard]Yeah, see. Looks like you're ready for more.[/say]")

		addButton("Cry!", "Start crying", "6_brat")
		addButton("Brace", "Prepare for what's to come", "6_brace")
		addButton("RED", "Say this", "5_red")
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

		addButton("Cry!", "Start crying", "6_brat")
		addButton("Brace", "Prepare for what's to come", "6_brace")
		addButton("RED", "Say this", "5_red")
	if(state == "6_brat"):
		playAnimation(StageScene.SybianOral, "ride", {npc="alexrynard", bodyState={naked=true, hard=true}})
		if (GM.pc.isBlindfolded()):
			saynn("Just before he raises the strength, you purposefully start crying. Why? To throw him off, of course! Alex notices your wet blindfold.")

			saynn("[say=alexrynard]Hey, are you okay?[/say]")

			saynn("He sounds so concerned.. which is so funny. You just sit still and shed a few more tears. After some seconds of silence, Alex finally decides to peek under your blindfold.. just to find your smug eyes.")

			saynn("[say=alexrynard]You're gonna scare me like that? Bad {pc.boy}.[/say]")

		else:
			saynn("Just before he raises the strength, you purposefully start crying. Why? To throw him off, of course! Alex notices your wet cheeks.")

			saynn("[say=alexrynard]Hey, are you okay?[/say]")

			saynn("He sounds so concerned.. which is so funny. You just sit still and shed a few more tears. After some seconds of silence, Alex walks up closer and stares you into the eyes.. just to realize how smug your expression actually is.")

			saynn("[say=alexrynard]You're gonna scare me like that? Bad {pc.boy}.[/say]")

		saynn("You stick your tongue out at him.. which means that you weren't prepared for what's about to happen. Alex raises the power to the medium setting..")

		saynn("Almost instantly, you arch your back. The dildo vibrates inside you so hard that you can't help but to start squirming.")

		if (GM.pc.hasReachableVagina()):
			saynn("You avoid some of it by raising your body slightly.. but Alex notices and pushes you back down.. forcing you to sit on the sybian while it brings immense pleasure to you and your pussy.")

		else:
			saynn("You avoid some of it by raising your body slightly.. but Alex notices and pushes you back down.. forcing you to sit on the sybian while it brings immense pleasure to you.")

		saynn("[say=pc]Ah-h..[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your cock is pushing more against the chastity cage but the metal is too strong.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your cock twitches wildly, more precum dripping from it.")

		saynn("Alex seems to be quite intrigued by the noises that you make.")

		saynn("[say=alexrynard]I don't hear the safeword, you must be loving it. Don't hold back, feel free to moan for me.[/say]")

		addButton("Moan", "Let it all out", "7_moan")
		addButton("Hold them", "Stay quiet for as long as you can", "7_brat")
		addButton("RED!", "Say this", "5_red")
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
		addButton("RED!", "Say this", "5_red")
	if(state == "7_brat"):
		saynn("You're not gonna give him the satisfaction of hearing you moan! Or seeing you squirm and drool. No way. You do your best, trying to focus on something else.. On how cute Alex is!")

		saynn("[say=pc]H-..[/say]")

		saynn("Fuck, that thought was a bad one, only made you hornier. You focus on just breathing instead.. On your deep warm breaths.. on how cute your panting sounds while that..")

		saynn("[say=pc]Nh..[/say]")

		if (GM.pc.hasReachableVagina()):
			saynn("Fuck. The sybian is relentless, its vibrating parts pushing you further and further into the abyss of pleasure, your pussy dripping juices onto the seat.")

		else:
			saynn("Fuck. The sybian is relentless, its vibrating parts pushing you further and further into the abyss of pleasure, your tailhole clenching around the small dildo.")

		saynn("[say=alexrynard]You're trying so hard but it's so easy to tell. If you're gonna cum, I want you to ask permission first.[/say]")

		saynn("What is he talking about, obviously you're not planning to cum anytime soon.. Even though.. it would be kinda nice. Fuck, you feel it too now. You can't, your body is betraying you, your muscles tensing up, your lips trembling.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your locked up cock is desperately pushing against its metal cage, you're so close..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your balls are tensing up, your cock is leaking pre hard, you're so close..")

		addButton("Just cum!", "You're not gonna let him humiliate you!", "8_brat")
		addButton("Beg for it", "Humiliate yourself!", "8_beg")
		addButton("RED!", "Say it", "8_red")
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
	if(state == "8_red"):
		playAnimation(StageScene.SybianOral, "idle", {npc="alexrynard", bodyState={naked=true, hard=true}})
		saynn("[say=pc]..R-Rred..[/say]")

		saynn("Alex instantly turns off the machine as soon as he hears that.")

		saynn("[say=alexrynard]Sorry, that might have been too much. Humiliation is a tricky topic.[/say]")

		saynn("Your orgasm starts to slowly fade away.. but at least you didn't have to beg.")

		saynn("[say=alexrynard]We're cuddling though, okay? I'm not leaving you while you're feeling down.[/say]")

		addButton("Continue", "See what happens next", "8_red_cuddle")
	if(state == "8_red_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {pc="alexrynard", npc="pc", npcBodyState={naked=true}})
		saynn("And so he pulls you onto the sofa to watch some random news on the TV.")

		saynn("[say=alexrynard]There you go. Just relax.[/say]")

		saynn("You nod and just try your best to calm down.")

		saynn("[say=alexrynard]We're all different. And that's okay. Life is a coop game, we should respect each other.[/say]")

		saynn("Sometimes it feels like someone switched the game mode to deathmatch though..")

		saynn("[say=alexrynard]Just know that I'm not humiliating or degrading out of malice. I'm just.. pulling on strings.. you know?[/say]")

		saynn("Fair enough. You both stay quiet from that point, just enjoying the mindless activity.")

		saynn("Feels nice to reset your brain. He helps you to get back to the workshop after that.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "8_brat"):
		playAnimation(StageScene.SybianOral, "hold", {npc="alexrynard", bodyState={naked=true, hard=true}})
		saynn("No, you're not gonna humiliate yourself by begging, you will just cum without telling him!")

		saynn("You close your eyes and enjoy riding the sybian.. your peak creeping closer and closer.. your noises become more and more passionate..")

		saynn("[say=alexrynard]I don't hear you.[/say]")

		if (GM.pc.hasReachableVagina()):
			saynn("Your pussy is twitching and dripping juices a lot.. just a few more seconds and you're gonna.. yes-s..")

		else:
			saynn("Your tailhole is twitching a lot.. just a few more seconds and you're gonna.. yes-s..")

		saynn("[say=alexrynard]I see.[/say]")

		saynn("Suddenly, Alex lowers the sybian's power to its lowest setting.. denying you the orgasm that you so desperately want!")

		saynn("[say=pc]No!.. Let me cum![/say]")

		saynn("He grabs you by the collar and makes you look at him.")

		saynn("[say=alexrynard]If you want me to help you cum, you better ask for it.[/say]")

		saynn("[say=pc]Please?..[/say]")

		saynn("He shakes his head.. while your orgasm slowly begins to fade.. no.. you can't let that happen.")

		saynn("[say=alexrynard]You're on your own.[/say]")

		addButton("Hump it!", "Hump the living hell out of that sybian", "8_brat_hump")
	if(state == "8_brat_hump"):
		playAnimation(StageScene.SybianOral, "hump", {npc="alexrynard", bodyState={naked=true, hard=true}})
		saynn("Looks like he won't help you.. but he also won't stop you.")

		if (GM.pc.hasReachableVagina()):
			saynn("So you do the next best thing.. and begin humping that dildo with your pussy, trying to push yourself a little further. Desperate noises escape from you.. while Alex is just smiling.")

		else:
			saynn("So you do the next best thing.. and begin humping that dildo with your ass, trying to push yourself a little further. Desperate noises escape from you.. while Alex is just smiling.")

		saynn("[say=alexrynard]Huh. This is way more fun than just denying you.[/say]")

		saynn("What a sly fox..")

		saynn("The seat under you is still vibrating, helping you to get at least some extra stimulation.. You start to feel that ecstatic feeling coming back.. You're so close.")

		addButton("Faster", "Hump it even faster", "8_brat_cum")
	if(state == "8_brat_cum"):
		playAnimation(StageScene.SybianOral, "humpfast", {npc="alexrynard", pcCum=true, bodyState={naked=true, hard=true}})
		if (GM.pc.hasReachableVagina()):
			saynn("Who even cares anymore about how it looks, you're too desperate to stop now. You hump that dildo like your life depends on it.. and soon enough.. your mind gets overwhelmed with a tidal wave of pleasure, your body getting pushed over the edge, your pussy gripping that vibrating dildo and producing a strong fountain of juices.")

			if (GM.pc.isWearingChastityCage()):
				saynn("Even though it's your lady bits that got overstimulated, your poor locked cock is still shooting a few weak spurts of your {pc.cum} through the little hole in the chastity cage, creating a cute mess on the floor.")

			elif (GM.pc.hasReachablePenis()):
				saynn("Even though it's your lady bits that got overstimulated, your {pc.penis} is still throbbing and shooting a few strong spurts of your {pc.cum}, creating a mess on the floor.")

		else:
			saynn("Who even cares anymore about how it looks, you're too desperate to stop now. You hump that dildo like your life depends on it.. and soon enough.. your mind gets overwhelmed with a tidal wave of pleasure, your body getting pushed over the edge, your ass gripping that vibrating dildo, your pulsing inner walls clenching around it.")

			if (GM.pc.isWearingChastityCage()):
				saynn("The dildo of that sybian isn't the biggest.. but it's actually the perfect length to overstimulate your prostate, your poor locked cock is throbbing and shooting a few weak spurts of your {pc.cum} through the little hole in the chastity cage, creating a cute mess on the floor.")

			elif (GM.pc.hasReachablePenis()):
				saynn("The dildo of that sybian isn't the biggest.. but it's actually the perfect length to overstimulate your prostate, your {pc.penis} is throbbing and shooting a few strong spurts of your {pc.cum}, creating a mess on the floor.")

		saynn("[say=pc]Nh-h-h!.. Ahh!.. Yes-s-s![/say]")

		saynn("Putting so much effort into this.. was totally worth it. Your body just wants to arch itself while all sorts of cute noises leave your mouth. You're panting heavily while your tongue is out, your lusty eyes shaking a little.")

		saynn("[say=alexrynard]Wow. Good job. You gave me such a good show.[/say]")

		saynn("[say=pc]H-hh.. ah.. Fuck.. you..[/say]")

		saynn("He chuckles.")

		saynn("Waves of warmth wash all over you. Feels so fucking good..")

		addButton("Continue", "See what happens next", "9_rest")
	if(state == "8_beg"):
		playAnimation(StageScene.SybianOral, "intense", {npc="alexrynard", pcCum=true, bodyState={naked=true, hard=true}})
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
		setFlag("AlexRynardModule.2TrustCompleted", true)
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
		playAnimation(StageScene.Cuddling, "idle", {pc="alexrynard", npc="pc", npcBodyState={naked=true}})
		saynn("[say=pc]Yes, Sir. Thank you.[/say]")

		saynn("He helps you to get up, your legs are a bit shaky after your last powerful orgasm. He pulls you in for some cuddles.")

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
		playAnimation(StageScene.SybianOral, "hold", {npc="alexrynard", pcCum=true, bodyState={naked=true, hard=true}})
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
		playAnimation(StageScene.Cuddling, "idle", {pc="alexrynard", npc="pc", npcBodyState={naked=true}})
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
	if(state == "10_bj"):
		playAnimation(StageScene.SybianOral, "idle", {npc="alexrynard", bodyState={naked=true, hard=true}})
		saynn("That felt good.. but you want to please the lonely foxy too now, share some of the fun.")

		saynn("[say=pc]Do you maybe..[/say]")

		saynn("Alex tilts his head slightly. He notices your stare that is glued to his crotch. The guy is horny.")

		saynn("[say=alexrynard]I'm good.[/say]")

		saynn("Nuh uh. He isn't walking away so easily.")

		addButton("Pants!", "Pull his pants down", "10_bj_pants")
	if(state == "10_bj_pants"):
		playAnimation(StageScene.SybianOral, "idle", {npc="alexrynard", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Since he isn't standing that far, you reach for his pants and pull them down, before doing the same to his underwear, revealing his red juicy rocket.")

		saynn("[say=alexrynard]Hey.[/say]")

		saynn("[say=pc]What~? Don't you want to have some fun too?[/say]")

		saynn("You open your mouth wide and let your tongue out before teasing the foxy by licking your lips, your hands are gently kneading his balls, causing a shiny little drop to appear on the tip of his cock.")

		saynn("He stares deep into your inviting throat.. and sighs.")

		addButton("Continue", "See what happens next", "10_bj_start")
	if(state == "10_bj_start"):
		playAnimation(StageScene.SybianOral, "blowjob", {npc="alexrynard", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("[say=alexrynard]Alright. Tap my legs if it becomes too much.[/say]")

		saynn("What a gentleman.")

		saynn("Moments later, you feel his firm grip on the back of your head. He keeps you from backing off like that while aligning his cock with your mouth and slowly sliding it inside. You squint when the pointy tip hits the back of your mouth, your gag reflex is being put to a short test.")

		saynn("He is not being rough.. but his touch is strict for sure. Alex waits a second before proceeding to move his hips back and forth at a low pace, his cock sliding against the wet walls of your mouth, your lips and your tongue.")

		saynn("[say=alexrynard]Something for you as well.[/say]")

		if (GM.pc.hasReachableVagina()):
			saynn("His free hand plays with the remote, causing the sybian under you to kick into action again, its little ridged platform is rubbing your clit and sensitive pussy yet again. Such a good motivation to suck him better..")

		else:
			saynn("His free hand plays with the remote, causing the sybian under you to kick into action again, its little ridged platform is stimulating your sensitive taint area while the little dildo is vibrating inside your butt. Such a good motivation to suck him better..")

		saynn("It's clear that he is holding back, only about half of his cock is inside your mouth at any time. But still, you make sure to keep your lips pressed against while your tongue is teasing the tip. His precum is so salty..")

		saynn("[say=alexrynard]Hah.. Let's see how much you can handle.[/say]")

		saynn("He likes it, you can see his eyes. But now he is trying to fit more of his shaft inside, its tip is brushing against the back of your mouth more and more, testing your throat.")

		addButton("Let him", "Make your best attempt to satisfy him", "10_bj_deepthroat")
		addButton("Tap his leg", "Make him stop before it goes too far", "10_bj_safeword")
	if(state == "10_bj_safeword"):
		playAnimation(StageScene.SybianOral, "idle", {npc="alexrynard", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You'd rather not swallow his whole cock.. So you tap on his leg a few times.")

		saynn("Alex feels that and stops before carefully sliding his member out. His other hand quickly turns off the sybian too.")

		saynn("[say=alexrynard]You're alright?[/say]")

		saynn("[say=pc]Yeah, it was just a bit too much for me.[/say]")

		saynn("[say=alexrynard]Well, let's cuddle then.[/say]")

		addButton("Yes Sir", "Cuddles!", "10_end")
	if(state == "10_bj_deepthroat"):
		playAnimation(StageScene.SybianOral, "blowjobfast", {npc="alexrynard", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You don't stop him.. which means there is no reason for him to go easy on you.")

		saynn("One big thrust and your {pc.throatStretch} throat stretches to accommodate his girth. His cock is creating a bulge on your neck while your lips are pressed against his deflated knot.")

		if (GM.pc.hasReachableVagina()):
			saynn("Breathing is.. impossible. You can't even moan. Deepthroating his cock makes your pussy squeeze the vibrating dildo harder.")

		else:
			saynn("Breathing is.. impossible. You can't even moan. Deepthroating his cock makes your needy asshole squeeze the vibrating dildo harder.")

		saynn("After Alex notices a few tears streaming down your cheeks, he starts moving his hips again, his cock pulling out of your throat just to slide deep inside soon after. At least between his thrusts you are able to catch some air again.")

		saynn("[say=alexrynard]So tight.[/say]")

		saynn("Your hands rest on his legs while he starts fucking your throat harder, the bulge getting constrained by your firm collar which only leads to it feeling better for him. You try your best to use your tongue but the vibrating seat under you and pushing you closer and closer to your own edge.")

		saynn("His knot is inflating..")

		addButton("Inside", "Let him cum down your throat", "10_bj_inside")
		addButton("Facial", "Make him pull out", "10_bj_facial")
	if(state == "10_bj_inside"):
		playAnimation(StageScene.SybianOral, "blowjobfast", {npc="alexrynard", pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You don't stop him even now.. In fact, you encourage him, moving your head to meet his cock, your jaw getting forced open slightly more each time.. until the knot slips in.")

		saynn("Alex grunts as he feels your tight throat walls clenching around his whole length.")

		saynn("[say=alexrynard]Oh fuck![/say]")

		saynn("You can't breathe.. but you have bigger things to worry about. Your body tenses up as a powerful wave washes over it, the sybian pushing you into the abyss of pleasure again.")

		if (GM.pc.hasReachableVagina()):
			saynn("All the while Alex's cock starts throbbing and shooting cum directly down your throat, filling your belly. Your nose is pressed into his crotch, your pussy pulsating wildly, releasing a fountain of juices.")

		else:
			saynn("All the while Alex's cock starts throbbing and shooting cum directly down your throat, filling your belly. Your nose is pressed into his crotch, your asshole gripping that rubber dildo, star pulsing around it.")

		saynn("The lack of oxygen is making your orgasm so much more.. colorful. Alex's fur is changing its tint as you look at it.. so trippy.. You go cross-eyed.")

		saynn("[say=alexrynard]Ngh..[/say]")

		saynn("[say=pc]Hhh-h!..[/say]")

		saynn("Finally, his orgasm seems to end.. but yours keeps being prolonged by that machine.. He notices that and quickly turns it off.. before yanking his knot out.")

		saynn("[say=alexrynard]My bad, got lost.[/say]")

		saynn("Looks like it felt good for him. That's great.")

		saynn("You gasp while hungrily catching any piece of air that you can get to.")

		saynn("[say=pc]Kgh-h.. kgh-h.. hh-h.[/say]")

		saynn("At least he didn't leave a mess on your body.")

		saynn("[say=alexrynard]You're okay?[/say]")

		saynn("You pant heavily.. but slowly your mind begins to clear up.")

		saynn("[say=pc]Yeah..[/say]")

		saynn("[say=alexrynard]Good {pc.boy}. Want to cuddle?[/say]")

		saynn("Of course you do.")

		addButton("Yes Sir", "Cuddles!", "10_end")
	if(state == "10_bj_facial"):
		playAnimation(StageScene.SybianOral, "stroke", {npc="alexrynard", pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You do your best, enduring his onslaught for as long as possible. But at some point it does become a little much, your throat struggling. So you tap on his legs when you feel like he is close enough..")

		saynn("[say=alexrynard]Ah.. Fuck.[/say]")

		saynn("He pulls out, yes. But his throbbing cock aches for release. So he just starts stroking himself.. until strings of thick get shot out of his red rocket.")

		saynn("His spunk starts landing all over your face, creating a very lewd mess.")

		if (GM.pc.hasReachableVagina()):
			saynn("His spunk starts landing all over your face, creating a very lewd mess. At the same time, the vibrating dildo finally brings you to your peak, your pussy starts to pulsate wildly and even releases another fountain of juices!")

		else:
			saynn("All the while Alex's cock starts throbbing and shooting cum directly down your throat, filling your belly. Your nose is pressed into his crotch, your asshole gripping that rubber dildo, star pulsing around it.")

		saynn("You pant heavily.. just like Alex. He catches himself after his orgasm and finally turns off the sybian.")

		saynn("[say=alexrynard]You're okay?[/say]")

		saynn("Slowly, your mind begins to clear up.")

		saynn("[say=pc]Yeah..[/say]")

		saynn("[say=alexrynard]Good {pc.boy}. Want to cuddle?[/say]")

		saynn("Of course you do.")

		addButton("Yes Sir", "Cuddles!", "10_end")

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

	if(_action == "5_red_cuddle"):
		processTime(10*60)

	if(_action == "6_brat"):
		bratCounter += 1

	if(_action == "7_brat"):
		bratCounter += 1

	if(_action == "8_brat"):
		bratCounter += 1

	if(_action == "8_beg"):
		GM.pc.orgasmFrom("alexrynard")

	if(_action == "8_red_cuddle"):
		processTime(10*60)

	if(_action == "8_brat_cum"):
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

	if(_action == "10_bj_deepthroat"):
		GM.pc.gotThroatFuckedBy("alexrynard")

	if(_action == "10_bj_inside"):
		processTime(30*60)
		GM.pc.gotThroatFuckedBy("alexrynard")
		GM.pc.cummedInMouthBy("alexrynard")
		GM.pc.orgasmFrom("alexrynard")

	if(_action == "10_bj_facial"):
		processTime(30*60)
		GM.pc.cummedOnBy("alexrynard")
		GM.pc.orgasmFrom("alexrynard")

	setState(_action)

func saveData():
	var data = .saveData()

	data["bratCounter"] = bratCounter

	return data

func loadData(data):
	.loadData(data)

	bratCounter = SAVE.loadVar(data, "bratCounter", 0)
