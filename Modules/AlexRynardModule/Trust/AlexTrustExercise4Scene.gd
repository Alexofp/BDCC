extends SceneBase

var bratCounter = 0
var usedCondom = true
var pumpID = ""
var howMuchSeed = 0.0

func _init():
	sceneID = "AlexTrustExercise4Scene"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("You walk up to Alex and wait for a good moment to ask.")

		saynn("[say=pc]Can we do a trust exercise? The fourth one?[/say]")

		if (GM.pc.hasBoundArms() || GM.pc.hasBlockedHands() || GM.pc.hasBoundLegs() || GM.pc.isBlindfolded() || GM.pc.isGagged() || GM.pc.isWearingPortalPanties()):
			saynn("Alex notices your restraints and hums")

			saynn("[say=alexrynard]Kinky. But I need your body to be fully free.[/say]")

			saynn("Huff, what a buzzkill. Looks like you have to struggle out of your restraints first.")

			addButton("Oh well", "Was worth a try", "endthescene")
		elif (GM.pc.hasEffect(StatusEffect.CoveredInCum)):
			saynn("Alex notices how messy you are and sighs.")

			saynn("[say=alexrynard]Please clean yourself first. You're way too messy.[/say]")

			saynn("Huff, what a buzzkill. Looks like you will have to take a shower first.")

			addButton("Oh well", "Was worth a try", "endthescene")
		else:
			saynn("Alex quickly checks you and your outfit out before nodding.")

			saynn("[say=alexrynard]Sure. Let's go have some fun.[/say]")

			addButton("Follow", "See where he brings you", "brought_room")
	if(state == "brought_room"):
		aimCameraAndSetLocName("eng_breakroom")
		saynn("The familiar staff break room. So many things happened here.")

		saynn("Alex invites you to stand near the sofa.")

		saynn("[say=alexrynard]I feel like.. you trust me, right?[/say]")

		addButton("I do", "Say this", "itrust")
		addButton("I don't", "Say this", "idontrust")
	if(state == "idontrust"):
		saynn("You shake your head.")

		saynn("[say=pc]I don't.[/say]")

		saynn("Alex tilts his head.")

		saynn("[say=alexrynard]Are you serious?[/say]")

		addButton("Yes", "Say this", "notrust")
		addButton("Yes No Maybe", "Say this", "trust_brat")
	if(state == "notrust"):
		saynn("[say=pc]Yeah, I don't know if I can trust you.[/say]")

		saynn("Alex scratches behind his head.")

		saynn("[say=alexrynard]Huh. I guess I was wrong. Sorry I spent some of your time.[/say]")

		saynn("He helps to guide you back to the workshop.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "trust_brat"):
		playAnimation(StageScene.Duo, "hurt", {npc="alexrynard"})
		saynn("[say=pc]Yes.. No.. Maybe?[/say]")

		saynn("Alex squints.. then seconds later, he raises his hand and smacks your bratty butt.")

		saynn("[say=pc]OW! I do![/say]")

		saynn("[say=alexrynard]You just needed a little reminder, right?[/say]")

		saynn("Having one doesn't hurt..")

		saynn("[say=alexrynard]Say it again.[/say]")

		addButton("I do", "Say this", "itrust")
		addButton("It again", "Say it", "sayitagain")
		addButton("OW! I do!", "Say this", "sayowido")
	if(state == "sayitagain"):
		saynn("[say=pc]It again?[/say]")

		saynn("Alex tilts his head more.")

		saynn("[say=alexrynard]What?[/say]")

		saynn("[say=pc]I said what you ordered me to say.. You told me to say 'it again'..[/say]")

		saynn("Alex sighs.. and uses spanks your butt out of the room back into the workshop!")

		saynn("[say=pc]Ow ow ow![/say]")

		saynn("[say=alexrynard]Come back when you're not eager to act like a little shit.[/say]")

		saynn("Rude!")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "sayowido"):
		saynn("You do your best impression of your own pain noise, followed by the exact words that you said.")

		saynn("[say=pc]OW! I do![/say]")

		saynn("Alex sighs.")

		saynn("[say=alexrynard]Repeat after me.[/say]")

		saynn("[say=pc]After me after me after me..[/say]")

		saynn("He sighs even deeper.")

		saynn("[say=alexrynard]I give you one last chance.[/say]")

		saynn("It's probably best to stop screwing around before he gets too mad..")

		addButton("I do", "Say this", "itrust")
	if(state == "itrust"):
		saynn("[say=pc]I do.[/say]")

		saynn("Alex nods.")

		saynn("[say=alexrynard]And I trust you. More than anyone else.[/say]")

		saynn("Aw, he is so kind.")

		saynn("Alex goes through his pile of prototypes and pulls out the visor.")

		saynn("[say=alexrynard]I gave up trying to make it into an anti-depression tool.. I finally realized that I just re-created a hypnovisor but with more wires and a worse design.[/say]")

		saynn("He blows some dust off of it.")

		saynn("[say=alexrynard]And you know what? I think it's okay. We can still have fun with it, right?[/say]")

		saynn("You nod.")

		saynn("[say=pc]For sure.[/say]")

		saynn("[say=alexrynard]So.. You can say the safeword now and only now. After I put this visor on you.. all bets are off. You will have exactly zero control.[/say]")

		saynn("Feels weird.. like you made a full circle. It was a fun journey though.")

		addButton("Yes Sir", "Agree to it", "1")
		addButton("Red", "Safeword out of it", "red")
		addButton("Turn tables", "Offer him to put the visor on and surrender full control to you", "1_turntables")
	if(state == "red"):
		saynn("[say=pc]Red..[/say]")

		saynn("Alex nods and puts the prototype away.")

		saynn("[say=alexrynard]I understand. Wanna hear what I would have done to you?[/say]")

		saynn("[say=pc]Sure.[/say]")

		saynn("He scratches behind his head.")

		saynn("[say=alexrynard]I'd give you a few commands.. There would probably be sex.. but with condoms of course.[/say]")

		saynn("You nod.")

		saynn("[say=alexrynard]Let me guide you back to the workshop.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "1"):
		saynn("[say=pc]Yes, Sir. You may take my control away.[/say]")

		saynn("Alex smiles and carefully secures the visor around your eyes.")

		saynn("[say=alexrynard]What a good {pc.boy} you are..[/say]")

		addButton("Continue", "See what happens next", "2")
	if(state == "2"):
		saynn("He presses a button that turns the visor on. A warm glow instantly hits your eyes.")

		saynn("[rainbow freq=0.05 sat=0.3 val=1.0]A very pleasant glow.[/rainbow]")

		saynn("The visor begins to show you all sorts of colorful patterns and seeing how you react to them prioritizes choosing the ones that had the most effect. And soon, you start to feel any worries going away.. Any stress.. disappearing from your head.. only the good emotions stay.. and become amplified with the lack of any negative ones.")

		saynn("[rainbow freq=0.05 sat=0.3 val=1.0]Everything is so nice.[/rainbow]")

		saynn("Even just looking at the wall becomes extremely interesting.. So you just stand still and do that, your lips slightly parted.")

		saynn("[say=alexrynard]All green?[/say]")

		saynn("Green, yellow, red, pink, you name it.. Every color under the sun.")

		saynn("[say=pc]Yes.. Yes, Sir.[/say]")

		saynn("You wouldn't be able to say no even if you really wanted to.. That word just has too much negative energy with it..")

		saynn("Alex does some circles around you, checking you out from all angles.")

		saynn("[say=alexrynard]Show me what I'm working with.[/say]")

		addButton("Undress", "Obey his words", "3")
	if(state == "3"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", bodyState={naked=true,hard=true, leashedBy="alexrynard"}})
		saynn("[say=pc]Yes, Sir..[/say]")

		saynn("Without much thought, you {pc.undressMessage}, presenting yourself completely naked to him.")

		if (GM.pc.hasSmallBreasts()):
			saynn("Your chest is not the most 'rich' one but you still puff it out, putting your nipples out on display.")

		else:
			saynn("You puff your chest out, putting your {pc.breasts} and nipples out on display."+str(" Some of your milk trails down your curves already.. Your tits are full of it." if GM.pc.canBeMilked() else "")+"")

		if (GM.pc.isWearingChastityCage()):
			saynn("There is no easy way to take off your chastity cage so you have to just present it to Alex as is.. By now it has become a part of you anyway. The foxy can notice how executing orders makes your locked away member leak some more pre.")

		elif (GM.pc.hasReachablePenis()):
			saynn("You feel the need to present everything.. so your body is forcibly making your {pc.penis} become harder.. Just so Alex can see it in its full glory.")

		if (GM.pc.hasReachableVagina()):
			saynn("Both, your {pc.vaginaStretch} pussy and {pc.analStretch} tailhole are out on display. You don't exactly know how he wants to see your holes.. so you settle with just slightly spreading your legs.")

		else:
			saynn("Your {pc.analStretch} tailhole is out on display. You don't exactly know how he wants to see it.. so you settle with just slightly spreading your legs.")

		saynn("After undressing, you put your hands on the back of your head, completing the pose.")

		saynn("Alex produces a chain leash and clips it to your collar. He just holds the other end in his hand.. and yet.. It feels so nice.")

		saynn("[say=pc]Here, Sir..[/say]")

		saynn("His gaze is checking your nude forms out.")

		saynn("[say=alexrynard]What a good slave, huh?[/say]")

		saynn("[say=pc]Yes, Sir. I'm your property, you may do as you wish with me.[/say]")

		saynn("[say=alexrynard]I will.[/say]")

		saynn("His free hand lands on your waist and slides over it.. around your {pc.thick} belly.. around your {pc.breasts}.. over your neck. He grabs you by the chin and makes you turn your head left and right. You let him inspect you like you're some object..")

		saynn("[say=alexrynard]Not bad.[/say]")

		saynn("Alex presses some button on the hypnovisor.. causing words to start appearing on the screen..")

		saynn("[rainbow freq=0.05 sat=0.5 val=1.0]Sex.. Toy.. Pleasure.. Sextoy.. Serve..[/rainbow]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Instantly, your caged up cock began twitching in its little cage, pressure building up inside of it.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Instantly, your cock has begun twitching and leaking drops of pre onto the floor, pressuring building up inside of it.")

		saynn("All your thoughts become corrupted by those words.. Sex.. Toy.. Serve..")

		if (GM.pc.hasReachableVagina()):
			saynn("Your breathing becomes deeper, waves of warmth spread through your whole body, hitting all your sensitive zones. Heat.. start to irradiate from your pussy.. your wet juices dripping onto the floor.")

		else:
			saynn("Your breathing becomes deeper, waves of warmth spread through your whole body, hitting all your sensitive zones. Heat.. start to irradiate from your tailhole.. your star clenching around an imaginary cock.")

		saynn("[say=pc]Sir.. You may fuck me if you want..[/say]")

		saynn("Words escape from your mouth on their own. Your own voice sounds so unfamiliar to you all of the sudden.. You're lacking any kind of control of your body and mind.. and it feels great..")

		saynn("[say=alexrynard]Can I really?[/say]")

		saynn("[say=pc]Yes.. please..[/say]")

		saynn("Two of his digits land on your tongue.. digits that you are quick to start sucking on.")

		saynn("[rainbow freq=0.05 sat=0.5 val=1.0]Sex.. Sex.. Sex..[/rainbow]")

		saynn("He leans in closer to your ear.")

		saynn("[say=alexrynard]I'm fucking you because I want to. Turn. Around. Slave.[/say]")

		saynn("Yes.. Yes! Anything for him.")

		if (GM.pc.hasReachableVagina()):
			addButton("Turn around", "Present Alex your pussy", "4_pussyfuck")
		else:
			addButton("Turn around", "Present Alex your butt", "4_analfuck")
	if(state == "4_pussyfuck"):
		playAnimation(StageScene.SexFreeStanding, "tease", {pc="alexrynard", npc="pc", bodyState={naked=true,hard=true,condom=usedCondom}, npcBodyState={naked=true,hard=true,leashedBy="alexrynard"}})
		saynn("After thoroughly covering Alex's digits with your saliva, you turn around and stick your butt out, your hands land on your buttcheeks and spread them wide. You proudly show both your needy holes to the foxy.")

		saynn("[rainbow freq=0.05 sat=0.5 val=1.0]Sex slave.. Fucktoy.. Breed.. Fuck.. Cum..[/rainbow]")

		saynn("[say=pc]Use your slave for your pleasure.. That is what I am for..[/say]")

		saynn("[say=alexrynard]Very.. enticing. It's good that you learned your place so quickly.[/say]")

		saynn("You can't tell if he is being serious or if this is just a scene.. but deep inside you know that it's safe to put your trust in him.")

		saynn("Alex exposes his juicy canine cock.. and starts to apply a nice-looking condom over its length. One that looks like it won't break no matter what.")

		saynn("After that, he takes his spot behind you, already aligning himself with your wet love tunnel.. your pussy..")

		addButton("Continue", "See what happens next", "4_pussyfuck_fuck")
		if (!getFlag("AlexRynardModule.4TrustCompleted")):
			addButton("Pull condom off", "You'd rather have him not use it", "4_pussyfuck_fail_pull_condom")
		else:
			addButton("Pull condom off", "You'd rather have him not use it", "4_pussyfuck_pull_condom_off")
	if(state == "4_pussyfuck_fail_pull_condom"):
		saynn("What little control you still have.. you spend wisely. Just before Alex aligns himself with your pussy slit, you reach your hand out and try to pull his condom off.")

		saynn("[say=pc]Breed.. Please..[/say]")

		saynn("But Alex just catches both of your wrists and moves them back.")

		saynn("[say=alexrynard]No, little eager slave.[/say]")

		saynn("[say=pc]Why not, Sir..[/say]")

		saynn("Is he really that afraid of knocking you up.."+str(" You're obviously pregnant already anyway.." if GM.pc.isVisiblyPregnant() else "")+"")

		saynn("[say=alexrynard]Not while you're in this state.[/say]")

		saynn("So he does still care.. Maybe you can try this again some other time..")

		saynn("But for now.. the condom stays.")

		addButton("Continue", "See what happens next", "4_pussyfuck_fuck")
	if(state == "4_pussyfuck_fuck"):
		playAnimation(StageScene.SexFreeStanding, "fast", {pc="alexrynard", npc="pc", bodyState={naked=true,hard=true,condom=usedCondom}, npcBodyState={naked=true,hard=true,leashedBy="alexrynard"}})
		if (!usedCondom):
			saynn("What little control you still have.. you spend wisely. Just before Alex aligns himself with your pussy slit, you reach your hand out and try to pull his condom off.")

			saynn("[say=pc]I want this.. Trust me..[/say]")

			saynn("Alex looked skeptical at first.. but in the end he allows you to pull the rubber off of his dick. Going in raw is so much more fun..")

		saynn("Seconds later.. you feel him grabbing your wrists and bringing them behind you.. while thrusting his hips forward, his member finding your needy hole and spreading the petals wide.")

		saynn("[say=pc]Ah![/say]")

		saynn("In one swift motion, his cock slides between your inner walls and smashes into your cervix, pushing you forward.. just for his arms to pull you back moments later.")

		saynn("[say=pc]Yes![/say]")

		saynn("His thighs are slapping against your butt with each rough motion. Alex is fast and deliberate, fucking you like you are his sextoy.. his property..")

		saynn("[rainbow freq=0.05 sat=0.5 val=1.0]Fucktoy.. Cocksleeve.. Sex slave..[/rainbow]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your own locked away cock is dripping through the little hole in its cage, the way his dick is pushing on your buttons, coupled with the dirty thoughts flashing through your mind.. pure ecstasy..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your own {pc.penis} is dripping pre at a steady rate, the way his dick is pushing on your buttons, coupled with the dirty thoughts flashing through your mind.. pure ecstasy..")

		saynn("[say=alexrynard]Moan like you mean it, toy.[/say]")

		saynn("Loud noises of passion instantly burst out of your mouth.. combined with the heavy panting. The way he is fucking you.. sends shivers through your body. Your pussy walls are gripping his cock tightly.")

		saynn("[say=alexrynard]Cum, now.[/say]")

		saynn("His order.. your mind can't say no..")

		addButton("Continue", "See what happens next", "4_pussyfuck_fuck_cum")
	if(state == "4_pussyfuck_fuck_cum"):
		playAnimation(StageScene.SexFreeStanding, "inside", {pc="alexrynard", npc="pc", bodyState={naked=true,hard=true,condom=usedCondom}, npcBodyState={naked=true,hard=true,leashedBy="alexrynard"}})
		saynn("Your own mind is forcing your body to cum.. Waves of sudden extra pleasure rocking through you, causing you to throw your head back and moan like a slut while your pussy is sucking that cock deeper and kneading it with every muscle..")

		saynn("[say=pc]NHHh-hH!.. AH!..[/say]")

		saynn("[say=alexrynard]Hah.. Take it all.[/say]")

		if (usedCondom):
			saynn("Alex welcomes your orgasm with his own, thrusting as deep as your pussy allows, his cock breaking into your womb.. and stuffing the condom full of his thick cum inside it.. so much that your belly starts looking a little rounder..")

		else:
			saynn("Alex welcomes your orgasm with his own, thrusting as deep as your pussy allows, his cock breaking into your womb.. and stuffing it full of his virile seed.. so much that your belly starts looking a little rounder..")

		if (GM.pc.isWearingChastityCage()):
			saynn("During the orgasm, your locked away cock is throbbing at the same rate as Alex's.. releasing little spurts of spunk through the cage.")

		elif (GM.pc.hasReachablePenis()):
			saynn("During the orgasm, your own cock is throbbing at the same rate as Alex's.. releasing long spurts of spunk, creating a mess underneath.")

		saynn("Yes-s! Your whole body is shaking, your legs want to give but Alex helps you not to collapse, your pussy releasing a fountain of juices onto the floor, the hypnovisor rewarding you with warm glowing colors.")

		if (usedCondom):
			saynn("Alex keeps you as his cockwarmer for some time.. before finally pulling out. The condom seems to be completely fine so Alex carefully ties it up and disposes of it, avoiding most of the mess.")

		else:
			saynn("Alex keeps you as his cockwarmer for some time.. before finally pulling out. Your twitching used pussy instantly spawns a flow of his cum, creating a lewd view.. and also some extra mess.")

		saynn("[say=alexrynard]And now we rest.[/say]")

		addButton("Continue", "See what happens next", "after_cuddle")
	if(state == "4_analfuck"):
		playAnimation(StageScene.SexFreeStanding, "tease", {pc="alexrynard", npc="pc", bodyState={naked=true,hard=true,condom=usedCondom}, npcBodyState={naked=true,hard=true,leashedBy="alexrynard"}})
		saynn("After thoroughly covering Alex's digits with your saliva, you turn around and stick your butt out, your hands land on your buttcheeks and spread them wide. You proudly show your needy hole to the foxy.")

		saynn("[rainbow freq=0.05 sat=0.5 val=1.0]Sex slave.. Fucktoy.. Breed.. Fuck.. Cum..[/rainbow]")

		saynn("[say=pc]Use your slave for your pleasure.. That is what I am for..[/say]")

		saynn("[say=alexrynard]Very.. enticing. It's good that you learned your place so quickly.[/say]")

		saynn("You can't tell if he is being serious or if this is just a scene.. but deep inside you know that it's safe to put your trust in him.")

		saynn("Alex exposes his juicy canine cock.. and starts to apply a nice-looking condom over its length. One that looks like it won't break no matter what.")

		saynn("After that, he takes his spot behind you, already aligning himself with your wet love tunnel.. your {pc.analStretch} tailhole..")

		addButton("Continue", "See what happens next", "4_analfuck_fuck")
		if (!getFlag("AlexRynardModule.4TrustCompleted")):
			addButton("Pull condom off", "You'd rather have him not use it", "4_analfuck_fail_pull_condom")
		else:
			addButton("Pull condom off", "You'd rather have him not use it", "4_analfuck_pull_condom_off")
	if(state == "4_analfuck_fail_pull_condom"):
		saynn("What little control you still have.. you spend wisely. Just before Alex aligns himself with your needy hole, you reach your hand out and try to pull his condom off.")

		if (GM.pc.hasWombIn(BodypartSlot.Anus)):
			saynn("[say=pc]Breed.. Please..[/say]")

		else:
			saynn("[say=pc]Go raw.. Please..[/say]")

		saynn("But Alex just catches both of your wrists and moves them back.")

		saynn("[say=alexrynard]No, little eager slave.[/say]")

		saynn("[say=pc]Why not, Sir..[/say]")

		if (GM.pc.hasWombIn(BodypartSlot.Anus)):
			saynn("Is he really that afraid of knocking you up.."+str(" You're obviously pregnant already anyway.." if GM.pc.isVisiblyPregnant() else "")+"")

		else:
			saynn("Obviously he can't get your pregnant anyway so why bother with these rubbers.."+str(" And you're somehow pregnant already anyway.." if GM.pc.isVisiblyPregnant() else "")+"")

		saynn("[say=alexrynard]Not while you're in this state.[/say]")

		saynn("So he does still care.. Maybe you can try this again some other time..")

		saynn("But for now.. the condom stays.")

		addButton("Continue", "See what happens next", "4_analfuck_fuck")
	if(state == "4_analfuck_fuck"):
		playAnimation(StageScene.SexFreeStanding, "fast", {pc="alexrynard", npc="pc", bodyState={naked=true,hard=true,condom=usedCondom}, npcBodyState={naked=true,hard=true,leashedBy="alexrynard"}})
		if (!usedCondom):
			saynn("What little control you still have.. you spend wisely. Just before Alex aligns himself with your needy tailhole, you reach your hand out and try to pull his condom off.")

			saynn("[say=pc]I want this.. Trust me..[/say]")

			saynn("Alex looked skeptical at first.. but in the end he allows you to pull the rubber off of his dick. Going in raw is so much more fun..")

		saynn("Seconds later.. you feel him grabbing your wrists and bringing them behind you.. while thrusting his hips forward, his member finding your clenching star and spreading it wide.")

		saynn("[say=pc]Ah![/say]")

		if (GM.pc.hasPenis()):
			saynn("In one swift motion, his cock slides between your inner walls and smashes into your prostate, pushing you forward.. just for his arms to pull you back moments later.")

		else:
			saynn("In one swift motion, his cock slides deep inside you, widening your inner walls and pushing you forward.. just for his arms to pull you back moments later.")

		saynn("[say=pc]Yes![/say]")

		saynn("His thighs are slapping against your butt with each rough motion. Alex is fast and deliberate, fucking you like you are his sextoy.. his property..")

		saynn("[rainbow freq=0.05 sat=0.5 val=1.0]Fucktoy.. Cocksleeve.. Sex slave..[/rainbow]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your own locked away cock is dripping through the little hole in its cage, the way his dick is pushing on your buttons, coupled with the dirty thoughts flashing through your mind.. pure ecstasy..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your own {pc.penis} is dripping pre at a steady rate, the way his dick is pushing on your buttons, coupled with the dirty thoughts flashing through your mind.. pure ecstasy..")

		saynn("[say=alexrynard]Moan like you mean it, toy.[/say]")

		saynn("Loud noises of passion instantly burst out of your mouth.. combined with the heavy panting. The way he is fucking you.. sends shivers through your body. Your inner walls are gripping his cock tightly.")

		saynn("[say=alexrynard]Cum, now.[/say]")

		saynn("His order.. your mind can't say no..")

		addButton("Continue", "See what happens next", "4_analfuck_fuck_cum")
	if(state == "4_analfuck_fuck_cum"):
		playAnimation(StageScene.SexFreeStanding, "inside", {pc="alexrynard", npc="pc", bodyState={naked=true,hard=true,condom=usedCondom}, npcBodyState={naked=true,hard=true,leashedBy="alexrynard"}})
		saynn("Your own mind is forcing your body to cum.. Waves of sudden extra pleasure rocking through you, causing you to throw your head back and moan like a slut while your asshole is sucking that cock deeper and kneading it with every muscle..")

		saynn("[say=pc]NHHh-hH!.. AH!..[/say]")

		saynn("[say=alexrynard]Hah.. Take it all.[/say]")

		if (usedCondom):
			saynn("Alex welcomes your orgasm with his own, thrusting as deep as your ass allows, his cock reaching your deep nethers.. and stuffing the condom full of his thick cum inside.. so much that your belly starts looking a little rounder..")

		else:
			saynn("Alex welcomes your orgasm with his own, thrusting as deep as your ass allows, his cock reaching your deep nethers.. and stuffing you full of his virile seed.. so much that your belly starts looking a little rounder..")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your prostate is under constant pressure during the orgasm, your locked away cock is throbbing at the same rate as Alex's.. releasing little spurts of spunk through the cage.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your prostate is under constant pressure during the orgasm, your own cock is throbbing at the same rate as Alex's.. releasing long spurts of spunk, creating a mess underneath.")

		saynn("Yes-s! Your whole body is shaking, your legs want to give but Alex helps you not to collapse, your tailhole still clenching around the throbbing shaft, your hypnovisor rewarding you with warm glowing colors.")

		if (usedCondom):
			saynn("Alex keeps you as his cockwarmer for some time.. before finally pulling out. The condom seems to be completely fine so Alex carefully ties it up and disposes of it, avoiding most of the mess.")

		else:
			saynn("Alex keeps you as his cockwarmer for some time.. before finally pulling out. Your twitching used tailhole instantly spawns a flow of his cum, creating a lewd view.. and also some extra mess.")

		saynn("[say=alexrynard]And now we rest.[/say]")

		addButton("Continue", "See what happens next", "after_cuddle")
	if(state == "after_cuddle"):
		playAnimation(StageScene.Cuddling, "squirm", {pc="alexrynard", npc="pc", bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		saynn("Alex pulls you onto the sofa for some cuddles.. while the visor is still messing with your mind.")

		saynn("[say=alexrynard]Still horny, huh.[/say]")

		saynn("[rainbow freq=0.05 sat=0.5 val=1.0]Sex.. Toy..[/rainbow]")

		saynn("[say=pc]Yes-s-s..[/say]")

		saynn("[say=alexrynard]Let's get that visor off.[/say]")

		addButton("Continue", "See what happens next", "novisor")
	if(state == "novisor"):
		playAnimation(StageScene.Cuddling, "idle", {pc="alexrynard", npc="pc", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("The pleasant glow disappears.. and all the negative feelings begin to return to you.. making you cry a bit even.")

		saynn("[say=alexrynard]It's probably addictive, shouldn't use it for so long.[/say]")

		saynn("He carefully wipes your tears off.")

		saynn("[say=alexrynard]Hope it was fun.[/say]")

		saynn("[say=pc]Yeah.. and for you?[/say]")

		saynn("He nods and kisses your shoulder.")

		saynn("[say=alexrynard]Too fun.[/say]")

		saynn("And so you spend some time together like that, enjoying each other's company.. until it's time to go.")

		addButton("Leave", "Time to go", "endthescene")
	if(state == "1_turntables"):
		saynn("You grab the hypnovisor from Alex's hands. He raises a brow as you do that.")

		saynn("[say=pc]You said.. that you trust me.. right?[/say]")

		saynn("The foxy tilts his head slightly.")

		saynn("[say=alexrynard]I do.[/say]")

		saynn("He can easily pick up on your sly mysterious tone.")

		saynn("[say=alexrynard]Where are you heading with that?[/say]")

		saynn("[say=pc]Do you trust me enough to put your prototype on you?[/say]")

		saynn("Alex opens his mouth, failing to find words.")

		saynn("[say=alexrynard]What are you gonna do to me?[/say]")

		saynn("You smile and don't answer that.")

		saynn("[say=pc]Do you trust me?[/say]")

		saynn("Alex chuckles.")

		saynn("[say=alexrynard]Of course I do. I'm just.. not a very good sub, you know? I hate begging.[/say]")

		saynn("You put one of your hands on his cheek.")

		saynn("[say=pc]I think it will be fun, especially with this thing on. I will have everything under full control.[/say]")

		saynn("Alex deliberates for some time.. and then nods.")

		saynn("[say=alexrynard]Let's try.[/say]")

		saynn("You begin to carefully secure the prototype on Alex's head.")

		saynn("[say=pc]What do you allow me to do with you?[/say]")

		saynn("[say=alexrynard]Just don't kill me or do something irreversable.[/say]")

		saynn("That's a fair condition.")

		addButton("Turn it on", "Test the prototype on Alex", "hypno_alex")
	if(state == "hypno_alex"):
		playAnimation(StageScene.BreastGroping, "tease", {pc="pc", npc="alexrynard"})
		saynn("You press a button on the prototype.. making the visor light up with a warm yellow glow.")

		saynn("Alex flinches at first, clearly scared of his own creation. You calm him down by standing behind him and helping him to sit down.")

		saynn("[say=pc]It's okay, I'm here. Just watch the colors.[/say]")

		saynn("Alex nods.. but then squints after a few seconds.")

		saynn("[say=alexrynard]I can see the cameras reading my eyes.[/say]")

		saynn("Looks like he struggles a bit.")

		saynn("[say=pc]Don't worry about them. Focus on something else. My voice.[/say]")

		saynn("The warm glow starts going through various colors, including a somewhat sharp red.")

		saynn("[say=alexrynard]What if it will hurt me. I have to look..[/say]")

		saynn("You can feel the tension in him.. your hands land on his shoulders and gently knead them..")

		saynn("[say=pc]Relax, you got me. If anything goes wrong, I will stop it. Okay?[/say]")

		saynn("[say=alexrynard]..yeah. You are right..[/say]")

		saynn("Alex parts his lips slightly.. and just tries to lose focus purposefully while you are humming into his ear.")

		saynn("[say=pc]All will be okay.. The world is a tough place.. But we found ourselves a cozy little corner.. So why not try to enjoy ourselves, right?[/say]")

		saynn("His body seems to slowly calm down, the tension in his back going away.")

		saynn("[say=alexrynard]Yeah..[/say]")

		saynn("[say=pc]Now tell me.. are you a good foxy or a bad one?[/say]")

		saynn("Alex hums.")

		saynn("[say=alexrynard]I am.. I am.. Alex.[/say]")

		saynn("He is fighting himself, huh. Or just being a brat.")

		addButton("Handmilk Alex", "Make Alex sink deeper into his trance", "hyp_hand")
		addButtonWithChecks("Penis pump", "Use a cock pump on Alex", "hyp_penispump_pick", [], [ButtonChecks.HasPenisPump])
		addButtonWithChecks("Mindgasm", "Temporary put a chastity cage on him and try to make him orgasm", "hyp_mindgasm", [], [ButtonChecks.HasChastityCageInInventory])
		addButtonWithChecks("Anal", "Fuck Alex's ass", "hyp_fuck", [], [ButtonChecks.HasReachablePenis])
		addButtonWithChecks("Strapon anal", "Pick a strapon and peg Alex with it", "hyp_strapon_pick", [], [ButtonChecks.HasStraponAndCanWear])
	if(state == "hyp_hand"):
		playAnimation(StageScene.BreastGroping, "tease", {pc="pc", npc="alexrynard", npcBodyState={naked=true, hard=true}})
		saynn("The device is clearly having some effect on him.. so you decide to tease him a bit more.")

		saynn("[say=pc]Who do you belong to, foxy?[/say]")

		saynn("His gaze.. mesmerized.")

		saynn("[say=alexrynard]M.. myself.[/say]")

		saynn("Valid answer. But not the one that you want to hear. You lean closer to his pointy ear and whisper.")

		saynn("[say=pc]From now on you belong to me, understand?[/say]")

		saynn("[say=alexrynard]Uh..[/say]")

		saynn("Alex bites his lip, the fingers on his hands twitch a little.")

		saynn("[say=pc]Foxy?[/say]")

		saynn("[say=alexrynard]Yes..[/say]")

		saynn("[say=pc]Who do you..[/say]")

		saynn("[say=alexrynard]You..[/say]")

		saynn("That's more like it. But.. the way he said it was a bit dry.")

		saynn("[say=pc]Say it fully.[/say]")

		saynn("[say=alexrynard]It.. I mean.. I think.. I belong to you, {pc.name}..[/say]")

		saynn("His breathing is becoming deeper, foxy seems to be finally surrendering to the fancy colors.")

		saynn("[say=pc]That's right.. Would you undress for me, foxy?[/say]")

		saynn("Alex carefully listens to your words, his hands begin to reach for his uniform, his digits slowly unbutton his shirt.")

		saynn("[say=alexrynard]Of course..[/say]")

		saynn("So cute to see him doing what you told him to do. After the shirt is off, he starts pulling his shorts down too.. exposing his sheath.")

		saynn("[say=pc]Ohh, looks like the foxy is feeling aroused already. Does it feel nice to obey?[/say]")

		saynn("His veiny canine cock is out on full display, the shaft looking hard.")

		saynn("[say=alexrynard]It does.. I await your next order..[/say]")

		saynn("[say=pc]What a good boy, so eager.[/say]")

		saynn("His cock is twitching as you say that, blood pumping through his length, the tip leaking precum.")

		saynn("[say=pc]I think you did enough. Let me reward you, foxy.[/say]")

		addButton("Stroke him", "Help the horny foxy", "hyp_hand_stroke")
	if(state == "hyp_hand_stroke"):
		playAnimation(StageScene.BreastGroping, "stroke", {pc="pc", npc="alexrynard", npcBodyState={naked=true, hard=true}})
		saynn("You stop kneading his back.. and instead just press your chest against it, your hand slides down his waist and lands on his red rocket, your digits wrap around it.")

		saynn("His cock is.. warm.. you can feel it pulsing in your hand. Alex is watching your actions through the colorful haze with great interest.")

		saynn("[say=pc]I only want you to.. not hold back, you know?[/say]")

		saynn("[say=alexrynard]I.. I won't.[/say]")

		saynn("You smooch his neck and proceed to start sliding your hand over his length, digits brushing against the veiny texture as you slowly stroke him.")

		saynn("[say=alexrynard]Nh..[/say]")

		saynn("[say=pc]Good foxy. Just let me do everything..[/say]")

		saynn("His cock leaks more precum.. that you catch and spread over it with each stroke. More and more little moans begin to escape his lips.. moans that are so unusual for him.")

		saynn("[say=alexrynard]H-hh.. ah..[/say]")

		saynn("The knot at the base of his member is inflating with blood and becomes quite big, the whole length is twitching in your hand by now.. while your other one is teasing his hard nips. Alex is squirming a lot by now.")

		saynn("[say=pc]Let me know if you're close.[/say]")

		saynn("[say=alexrynard]Ah.. hah.. O-of.. course..[/say]")

		saynn("As you start squeezing his knot a little during each stroke, Alex throws his head back and moans loudly, his tongue is out. You almost don't believe that he isn't cumming yet, the foxy is taking it quite well.")

		saynn("[say=alexrynard]I.. I want to.. Ah.. I'm gonna..[/say]")

		saynn("You stroke him a little slower to extend the moment. Denying him now would be too cruel, the foxy deserves it for being so obedient.")

		saynn("You bite playfully on his ear.. and then whisper into it.")

		saynn("[say=pc]You may cum, foxy.[/say]")

		saynn("Instantly, his rod starts pulsing and shooting thick ropes of seed onto the floor. Alex is bending and arching, his prosthetic spine is whirring loudly, struggling to contain his excitement.")

		saynn("[say=alexrynard]H-h-h-hhH!.. Ahh.. Ngh-h!.. F-f.. ah..[/say]")

		saynn("His balls are tensing up hard as you drain them, the floor in front of you starts to look quite messy with all the long lines of cum on them with more appearing each second.")

		saynn("[say=alexrynard]Hh-h-h.. F-fu.. ck.. Ngh..[/say]")

		saynn("[say=pc]Who is a good foxy?[/say]")

		saynn("[say=alexrynard]I.. I-I am.. Nn-h-h..[/say]")

		saynn("Such a powerful orgasm, huh.. Alex was really pent up it seems.")

		saynn("His body is still shivering a little after his cock is no longer wasting its load, his breathing is heavy, his eyes.. so lovely.")

		addButton("Cuddle", "Pull Alex in for some cuddles", "hyp_after_stroke")
	if(state == "hyp_after_stroke"):
		playAnimation(StageScene.BreastGroping, "tease", {pc="pc", npc="alexrynard", npcBodyState={naked=true, hard=true}})
		saynn("And so you stop stroking him and pull the hand away.. hand that still has some pre and seed on it. Alex notices that.")

		saynn("[say=alexrynard]I can.. clean..[/say]")

		saynn("Oh wow, can he really? You decide to bring your hand to his mouth and see what happens.")

		saynn("Alex is still panting warmly.. he rolls his tongue out and gently slides it across your fingers, grabbing some of the mess.. and then swallowing it, his throat making an audible gulp.")

		saynn("[say=pc]Good boy.. such a good boy.[/say]")

		saynn("The more you repeat that.. the stronger his erection becomes. But it's probably best not to strain him too much.")

		saynn("You let Alex clean your hand.. and then just keep cuddling with him, providing warmth and comfort to the spent foxy.")

		saynn("It's probably time to turn off the visor.")

		addButton("Visor", "Turn it off", "hyp_after_stroke_visor")
	if(state == "hyp_after_stroke_visor"):
		saynn("You turn the hypnovisor.. causing the warm glow to disappear. You know how it feels when the bad feelings suddenly rush back into your head.. so you nuzzle Alex and offer him some hugs.")

		saynn("[say=alexrynard]Ah.. Fuck..[/say]")

		saynn("[say=pc]Are you feeling like yourself again?[/say]")

		saynn("[say=alexrynard]I.. I think.. wow..[/say]")

		saynn("He gradually catches his breath.")

		saynn("[say=pc]How did it feel?[/say]")

		saynn("[say=alexrynard]I remember everything.. I was there.. Just.. not in control..[/say]")

		saynn("You smooch his neck again.")

		saynn("[say=pc]Yep.[/say]")

		saynn("[say=alexrynard]It felt.. strange. Like I was detaching..[/say]")

		saynn("[say=pc]Did you like it though?[/say]")

		saynn("[say=alexrynard]I did.. Thank you..[/say]")

		saynn("He turns his head and nuzzles you back.")

		saynn("And so you spend more time together. It's important to help Alex to recover after that intense session.")

		saynn("But after that, it's back to normal. You hand him his prototype and let him guide you back to the workshop.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "hyp_penispump_pick"):
		saynn("Pick the pump that you want to use on Alex.")

		addPumpButtons()
		if (false):
			addButton("Nope", "You shouldn't see this", "hyp_penispump")
	if(state == "hyp_penispump"):
		playAnimation(StageScene.BreastGroping, "grope", {pc="pc", npc="alexrynard", npcBodyState={naked=true, hard=true}})
		saynn("That cock looks juicy.. but why stroke it yourself when you can use a pump.")

		saynn("[say=pc]Alright, Alex. I want to see how much you have in you~.[/say]")

		saynn("You grab a penis pump that you have and carefully place it on his red rocket. The device creates negative pressure inside, allowing it to secure itself tightly. The soft pleasure ring finds Alex's cock and slides through it.")

		saynn("[say=alexrynard]Ah..[/say]")

		saynn("You turn the pump.. making it so the ring starts sliding back and forth over his length at a slow rate. You lean closer to Alex's ear and whisper.")

		saynn("[say=pc]There we go. I want you to produce a lot of seed for me. Can you do that?[/say]")

		saynn("Alex watches his member being stroked by a cock milker.. and moans softly, his body is squirming a bit.")

		saynn("[say=alexrynard]I will.. try..[/say]")

		saynn("[say=pc]Good boy.[/say]")

		saynn("Hearing that makes him moan again, Alex seems to be enjoying this quite a lot. He is being quite obedient too, his hands resting on his legs showing zero resistance.")

		saynn("To help with the process, you press your chest against his back and use your hands to explore his fur. Your lips leave little kisses all over him while your digits trace over his manly curves, drawing little circles around his nips.")

		saynn("[say=alexrynard]Ah.. hah..[/say]")

		saynn("The pump is stroking his dripping cock faster, the soft ring starts bumping into the inflating knot each time, failing to squeeze past. So far all there is to collect is his precum.. but you feel like that is soon about to change.")

		saynn("Alex can't sit still, his body squirming a lot. You find his nipples and begin to rub the tips gently, providing additional stimulation.")

		saynn("[say=alexrynard]I.. I'm gonna..[/say]")

		saynn("[say=pc]Yeah.. do it for me, like a good foxy. Cum.[/say]")

		saynn("Instantly, Alex throws his head back and produces a passionate love noise, the pleasure ring manages to squeeze past his knot, making his cock throb and start stuffing its load directly into the pump, his balls tensing up every second.")

		saynn("[say=alexrynard]NhHH-hhH!..  Ah-h!..[/say]")

		saynn("Even though he is cumming, the pump is still stroking the full length and squeezing his knot, overstimulating his cock and draining him dry. More and more of his seed hits the glass.. raising the overall level and drowning his cock in it.")

		saynn("[say=pc]Good boy.. look at you.. So much.[/say]")

		saynn("[say=alexrynard]Nhh-h..[/say]")

		addButton("Continue", "See what happens next", "hyp_aftermilk")
	if(state == "hyp_aftermilk"):
		saynn("His eyes rolls up, his tongue is out and drooling,")

		saynn("You try to wait until he stops cumming.. but he just keeps doing it. Eventually the fluid level inside the pump stops rising.. which means that its good time to turn it off.")

		saynn("You managed to milk Alex for.. "+str(Util.roundF(howMuchSeed, 1))+" ml. Yay.")

		addButton("Take it off", "Grab the pump back and rest", "hyp_grab_pump_back")
	if(state == "hyp_grab_pump_back"):
		playAnimation(StageScene.BreastGroping, "tease", {pc="pc", npc="alexrynard", npcBodyState={naked=true, hard=true}})
		saynn("You carefully take the pump off of his cock.. making sure not to spill anything.")

		saynn("After that, you also take Alex's hypnovisor off of him.. and hug him to help him avoid some of the negative thoughts.")

		saynn("[say=pc]There we go.[/say]")

		saynn("His body is still shivering from the intense orgasm.")

		saynn("[say=alexrynard]Ah.. fuck..[/say]")

		saynn("[say=pc]Was that too much?[/say]")

		saynn("Alex starts to come back to senses.")

		saynn("[say=alexrynard]That was.. good. And very exhausting.[/say]")

		saynn("Makes sense.")

		saynn("[say=alexrynard]Thank you.[/say]")

		saynn("He nuzzles you and rests in your embrace.. While you rest too.")

		saynn("And so you spend more time together. It's important to help Alex to recover after you milked him so hard.")

		saynn("But after that, it's back to normal. You hand him his prototype and let him guide you back to the workshop.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "hyp_mindgasm"):
		playAnimation(StageScene.BreastGroping, "tease", {pc="pc", npc="alexrynard", npcBodyState={naked=true, hard=true}})
		saynn("You notice the bulge growing in his shorts. Makes you wonder how horny you can make him.. how far can you push him.")

		saynn("[say=pc]Your name is Alex, sure. But at this very time you are my toy to play with. I wanna see my toy fully.[/say]")

		saynn("Your hands reach out to unbutton his shirt.. but he is doing it already himself, one button at a time. What a good foxy. You breathe warmly into his ear as he takes off his shirt, exposing his manly chest.")

		saynn("[say=pc]Fully~.[/say]")

		saynn("[say=alexrynard]Of course..[/say]")

		saynn("Alex nods and starts pulling his shorts down, the cloth catching on the tip of his cock and becoming wet from all the precum that already accumulated there. Seems like just the fact of obeying.. makes him feel good.")

		saynn("Eventually the shorts get taken off too, leaving the foxy naked and ready for you.")

		saynn("[say=pc]We're gonna do a little experiment. Don't worry. All you have to do is obey. But I'm gonna put this on you~.[/say]")

		saynn("Your hands pull out a metal chastity cage and show it to Alex. His mesmerized gaze is full of.. curiosity.")

		saynn("[say=alexrynard]As you wish, {pc.name}.. My body is for you to play with..[/say]")

		saynn("Submission is irritating from him, such a good foxy.")

		addButton("Lock him up", "Put a chastity cage on Alex", "hyp_put_on_chastity")
	if(state == "hyp_put_on_chastity"):
		playAnimation(StageScene.BreastGroping, "tease", {pc="pc", npc="alexrynard", npcBodyState={naked=true, caged=true}})
		saynn("The cage consists of the two parts, the cock ring and the piece that blocks the erection. The ring is easy enough to put on and push Alex's balls through.. the other one will require some effort.")

		saynn("[say=pc]Don't you dare to cum now, foxy.[/say]")

		saynn("You press the second piece against the tip of his cock.. and begin trying to bring it to the other one, putting more and more pressure, fighting his hard shaft.")

		saynn("[say=alexrynard]Nh-h..[/say]")

		saynn("Alex is squirming and throbbing in your hands, his cock leaking precum profusely.. Could have you just ordered him to become soft? Probably.. But this is way more fun.")

		saynn("His member keeps pulsing.. but you push through its resistance, slowly winning inch by inch.. until the two parts collide. You lock them together with a key.. and that's it.. Foxy's cock is now trapped in a tight cage.")

		saynn("[say=pc]There we go. Do you like it, foxy?[/say]")

		saynn("[say=alexrynard]Hh-h.. so much pressure.[/say]")

		saynn("[say=pc]Good. I want you to focus on it and my voice.[/say]")

		saynn("The hypnovisor is still creating a nice warm glow in front of his eyes.. taking away any negative thoughts.")

		saynn("[say=pc]Feel the warmth building within you, a gentle fire.. Fire that's growing with every word that I say.[/say]")

		saynn("Alex parts his lips and exhales audibly. All the while you're just sitting behind him, breathing warmly into his ear, whispering.")

		saynn("[say=alexrynard]I feel it.. inside..[/say]")

		saynn("[say=pc]Imagine each word as a caress, a touch that intensifies the sensations.. Can you feel it, foxy?[/say]")

		saynn("Alex's breath quickens, his body shivering, his locked away member is twitching behind the metal cage, more precum dripping onto the floor.")

		saynn("[say=alexrynard]Yes, I.. It's like.. like you're touching me..[/say]")

		saynn("[say=pc]That's right~. Your mind is a canvas and I'm painting with various feelings on it. I want you to imagine please, foxy. I want you to imagine it growing..[/say]")

		saynn("The shiver in him becomes stronger, his back keeps brushing against your chest.")

		saynn("[say=alexrynard]Pleasure.. growing..[/say]")

		saynn("Little moans start escaping from him, sounds of passion. His poor caged up cock is clearly desperate for release, his balls tensing up slightly.")

		saynn("[say=alexrynard]Ah-h.. h-hh..[/say]")

		saynn("The foxy is on edge already, the only thing that's keeping him from crossing it.. your word.")

		saynn("[say=pc]Such a good boy, obeying me so well, making such nice noises. What would you want more, to cum or to obey me forever?[/say]")

		saynn("Such a tricky question.")

		saynn("[say=alexrynard]Nh.. ah.. there is nothing more I would love.. ngh-h.. than to serve you forever.. ah..[/say]")

		saynn("Wow, impressive words for someone who is a dominant. It's true, most of it could be explained by the hypnovisor.. which makes this tool pretty dangerous.. but dangerous things are fun to play with sometimes.")

		saynn("[say=pc]Okay, foxy.. When you hear me say 'Mindgasm' the next time, I want you to let the waves of ecstasy crash over you. I want you to let it become reality in your mind.[/say]")

		saynn("[say=alexrynard]Mindgasm.. Ecstasy.. yes..[/say]")

		saynn("He is panting so heavily, his chest raising high, his perky nips looking quite hard.. makes you want to tease at least them..")

		saynn("It's time.")

		addButton("Mindgasm", "Say it", "hyp_say_mindgasm")
	if(state == "hyp_say_mindgasm"):
		playAnimation(StageScene.BreastGroping, "grope", {pc="pc", npc="alexrynard", npcBodyState={naked=true, caged=true}})
		saynn("[say=pc]Feel the climax, foxy. Let the mindgasm consume you. Embrace it.[/say]")

		saynn("Alex throws his head back and lets out a loud long moan, his body arching his back, his locked cock throbbing hard.. before shooting a strong rope of thick cum through the little hole in the chastity cage.. and then again.. and again.. Alex is cumming just from your word alone..")

		saynn("[say=alexrynard]Oh.. Ah!.. F-f.. ah.. F-fa..[/say]")

		saynn("The poor foxy can barely contain himself so you wrap your arms around him, your hands land on his chest and tease his nips while he just.. keeps cumming and cumming, his balls tensing up hard.")

		saynn("[say=pc]Good foxy.. Such a good foxy..[/say]")

		saynn("The room is filled with his moans, his body shaking even while you're holding him. His orgasm starts to fade but his chastity cage keeps dripping seed onto the floor.")

		saynn("[say=alexrynard]That feels good.. It feels too good.. ah..[/say]")

		saynn("[say=pc]I'm glad it does~. You can start calming down.[/say]")

		saynn("Alex nods.. and leans into you more, his head swaying lazily.")

		saynn("[say=pc]Let's cuddle.[/say]")

		saynn("Probably best to take off the visor and let him see the mess that he made.")

		addButton("Cuddle", "Provide some aftercare", "hyp_chastity_after")
	if(state == "hyp_chastity_after"):
		playAnimation(StageScene.BreastGroping, "tease", {pc="pc", npc="alexrynard", npcBodyState={naked=true, caged=true}})
		saynn("You turn off the visor, making the glow before his eyes go away. Alex starts to blink a lot while still panting heavily.")

		saynn("[say=alexrynard]Wha.. h-ha..[/say]")

		saynn("[say=pc]Welcome back.[/say]")

		saynn("He looks down at his caged up cock.. at the long strings of seed that are covering the floor before him.")

		saynn("[say=alexrynard]Fuck.. ah..[/say]")

		saynn("[say=pc]Felt good, huh?[/say]")

		saynn("[say=alexrynard]I.. I don't know.. how it happened..[/say]")

		saynn("[say=pc]It's okay, foxy. Relax. You don't have to explain anything, your mind did exactly what I asked it to do.[/say]")

		saynn("Alex nods softly.. and nuzzles you.")

		saynn("[say=alexrynard]The cage hurts..[/say]")

		saynn("[say=pc]Aw, you don't want it to stay? You'd make such a good boy.. or girl.[/say]")

		saynn("Alex squints at you. His stare alone is enough for you to reconsider.")

		addButton("Take cage off", "It's better that way anyway", "hyp_take_off_cage")
	if(state == "hyp_take_off_cage"):
		playAnimation(StageScene.BreastGroping, "tease", {pc="pc", npc="alexrynard", npcBodyState={naked=true}})
		setFlag("AlexRynardModule.ch2DidChastityWith", true)
		saynn("You use the key to unlock the chastity cage.. and carefully take it off. Wow, his cock has some marks on it that the metal left. Hopefully, they will go away soon.")

		saynn("[say=pc]It was an interesting experience though, wasn't it?[/say]")

		saynn("[say=alexrynard]It was.. Thank you.[/say]")

		saynn("He yoinks the cage from your hands for a second.")

		saynn("[say=alexrynard]That.. can be picked even with a condom wrapper I'm pretty sure.[/say]")

		saynn("[say=pc]It held you locked pretty well.[/say]")

		saynn("[say=alexrynard]Uh huh. Don't forget that I have access to metal saws too.[/say]")

		saynn("[say=pc]Yeah, just don't cut through the wrong thing. You think you could make a better one?[/say]")

		saynn("Alex looks at the thing from every angle.")

		saynn("[say=alexrynard]I might. It would be somewhat easy to add extra protection against vandalism.[/say]")

		saynn("You chuckle.")

		saynn("[say=pc]You'd be the one testing it then.[/say]")

		saynn("Alex smiles and hands you the cage back.")

		saynn("You spend the rest of the time cuddling together. After that Alex brings you back to the workshop.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "hyp_fuck"):
		playAnimation(StageScene.BreastGroping, "tease", {pc="pc", npc="alexrynard"})
		saynn("The guy is still so cheeky.. makes you want to see how well he can handle getting fucked.")

		saynn("You lean closer to his ear to whisper some words while your hand lands on his neck to make him feel even more powerless.")

		saynn("[say=pc]Tell me, foxy, do you experience anal often?[/say]")

		saynn("Alex raises his chin slightly.")

		saynn("[say=alexrynard]No..[/say]")

		saynn("[say=pc]Do you wish to do it more?[/say]")

		saynn("He stays quiet for some time, his parted lips trembling.")

		saynn("[say=alexrynard]Of course.. Anything for you.[/say]")

		saynn("So sweet. You notice some movement in his shorts already.")

		saynn("[say=pc]Why don't you undress then.[/say]")

		addButton("Continue", "See what happens next", "hyp_fuck_undress")
	if(state == "hyp_fuck_undress"):
		playAnimation(StageScene.BreastGroping, "tease", {pc="pc", npc="alexrynard", npcBodyState={naked=true, hard=true}})
		addCharacter("alexrynard", ["naked"])
		saynn("Alex nods and proceeds to slowly unbutton his shirt and take it off. Your hand stops gripping his throat and instead slides down over his chest, brushing over his pecs. So much tension..")

		saynn("[say=pc]Fully.[/say]")

		saynn("He puts his digits under the ribbon of his shorts and pulls him down, revealing his red cock that is already twitching from excitement, a lonely drop of pre sliding down from its pointy tip.")

		saynn("[say=pc]Good boy.[/say]")

		saynn("A packaged condom falls out of his pocket as his shorts hit the floor. Hmm.. You could use that for something.")

		addButton("Continue", "See what happens next", "hyp_fuck_cowgirl")
	if(state == "hyp_fuck_cowgirl"):
		playAnimation(StageScene.SexCowgirlAlt, "tease", {pc="pc", npc="alexrynard", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, condom=true}})
		saynn("You quickly undress as well and then lie down on the floor. Your hands tap on your lap as you smile.")

		saynn("[say=pc]Come here.[/say]")

		saynn("Alex nods and crawls up to you.. before stradling your hips, your cocks brushing against each other's.")

		saynn("[say=alexrynard]Yes..[/say]")

		saynn("You catch some of his precum onto your digits.. and then spread it along your length.. not the best lube, but it will do.")

		saynn("Foxy watches you with his hazy lusty eyes as you grab the packaged condom, quickly rip it open.. and begin applying it.. no, not to your cock.. but his.")

		saynn("[say=alexrynard]Huh?..[/say]")

		saynn("[say=pc]So you don't make a mess on me, foxy.[/say]")

		saynn("[say=alexrynard]Of course..[/say]")

		saynn("After all that.. It's time.")

		saynn("[say=pc]I want you to ride me.[/say]")

		saynn("Alex lowers his gaze to your {pc.penis}.. and nods.")

		saynn("[say=alexrynard]With pleasure..[/say]")

		saynn("He raises himself a bit.. and uses his hand to guide your member towards his tailhole as he starts lowering himself onto you..")

		saynn("So tight.. you can feel his star resisting as your shaft is prodding it.. and yet, Alex keeps trying, little quiet noises begin escaping him.")

		saynn("[say=pc]Don't hold back.[/say]")

		addButton("Continue", "See what happens next", "hyp_fuck_ride")
	if(state == "hyp_fuck_ride"):
		playAnimation(StageScene.SexCowgirlAlt, "sex", {pc="pc", npc="alexrynard", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, condom=true}})
		saynn("The quiet noises quickly grow until they become small moans, Alex focuses on the hypnovisor glow.. allowing him to relax enough to take some of your cock inside.")

		saynn("[say=alexrynard]Ah..[/say]")

		saynn("It's great, all you have to do is watch how Alex starts grinding himself against your crotch, his tight anal slowly stretching to accommodate your size.")

		saynn("[say=pc]Such a good boy..[/say]")

		saynn("Saying that only made him clench more.. making your breathing deeper as well.")

		saynn("Eventually, the foxy is able to comfortably take most of you, his thighs slapping against yours with a soft thump.")

		saynn("[say=alexrynard]Nh-h.. ah..[/say]")

		saynn("It seems, your cock is pushing on all the right buttons, the tip of the condom becomes a little heavy from some transparent fluids in it.")

		saynn("Alex is doing exactly as told, riding you, rising himself before bringing his body down onto your length.")

		saynn("[say=pc]Do you like it?[/say]")

		saynn("[say=alexrynard]Yes.. ah..[/say]")

		saynn("His eyes don't lie.")

		addButton("Continue", "See what happens next", "hyp_fuck_ride_faster")
	if(state == "hyp_fuck_ride_faster"):
		playAnimation(StageScene.SexCowgirlAlt, "fast", {pc="pc", npc="alexrynard", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, condom=true}})
		saynn("Alex is picking up the pace himself, riding you faster and harder, his own cock bobbing up and down, the condom collecting more pre.")

		saynn("[say=pc]Such an eager foxy. Think you can cum like this?[/say]")

		saynn("All you get back is more moans, Alex's mouth is opened, tongue out and drooling, his eyes keep rolling up.")

		saynn("[say=alexrynard]Nh-h.. ye-.. -ah.. h-h..[/say]")

		saynn("His slick inner walls gripping your dick so well.. while yours is smashing into his little pleasure button each time he brings himself down on you.")

		saynn("[say=pc]Well show me then~.[/say]")

		saynn("He is so adorable, making cute lusty noises.. riding your cock like it's the most fun attraction in the park. The way he clenches each time you tell him something.. brings you to your peak quite fast..")

		saynn("The knot at the base of Alex's cock inflates with blood, signaling that he is about to cum. There is no way you're pulling out..")

		addButton("Cum", "Breed that foxy raw", "hyp_ride_fuck_cum")
	if(state == "hyp_ride_fuck_cum"):
		playAnimation(StageScene.SexCowgirlAlt, "inside", {pc="pc", npc="alexrynard", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, condom=true}})
		saynn("Alex brings himself down onto your cock with one last big motion.. before arching his back and letting out a passionate moan, his cock starts throbbing and filling the condom with its load, making the tip sag lower and lower.. but luckily the condom seems to hold.")

		saynn("[say=alexrynard]Ah-h-h!.. ah.. h-hh..[/say]")

		saynn("His ass is just sucking you in, his inner walls kneading your {pc.penis} so much that you can't hold any longer. You grunt as your cock starts stuffing his tailhole full of your {pc.cum}, wave after wave of it.")

		saynn("He throws his head back and just keeps moaning and grinding you, trying to drain your balls.")

		saynn("[say=pc]Ah.. wow, you're one hungry fox.[/say]")

		saynn("[say=alexrynard]Yes.. yes-s.. hah..[/say]")

		addButton("Enough", "Just pull him in for cuddles", "hyp_ride_fuck_enough")
		addButton("Pin him down", "Give him what he wants", "hyp_ride_fuck_pin")
	if(state == "hyp_ride_fuck_pin"):
		playAnimation(StageScene.SexMissionary, "fast", {pc="pc", npc="alexrynard", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, condom=true}})
		saynn("He clearly wants more.. so why not give him more.")

		saynn("Since you have been saving all your strength up to this point, you easily push yourself off the floor and pin foxy to the floor, your cock is still inside him.")

		saynn("[say=alexrynard]Ah??..[/say]")

		saynn("Without even explaining anything, you start hammering away at his asshole, fucking it fast and rough.")

		saynn("Alex is still not fully recovered from the last orgasm.. but now his hard prostate is being put under a lot of pressure again, his cock is twitching and dripping into the condom.")

		saynn("[say=alexrynard]Oh.. Ah.. fuck..[/say]")

		saynn("Passionate moans begin to escape from him again, his body shivering under you.. so cute.")

		saynn("[say=pc]Such a slutty boy. Are you sure you're not a cocksleeve?[/say]")

		saynn("[say=alexrynard]I am.. a fucktoy.. a dirty cocksleeve.. a slave.[/say]")

		saynn("You thrust into the mouthy foxy with great power, pounding his stretchy fuckhole with full force. At some point the knot on his cock starts inflating again..")

		addButton("Cum inside", "Breed the foxy again", "hyp_ride_fuck_pin_cum")
	if(state == "hyp_ride_fuck_pin_cum"):
		playAnimation(StageScene.SexMissionary, "inside", {pc="pc", npc="alexrynard", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, condom=true}})
		saynn("His used clenching tailhole feels so great that you can only endure this pleasure for so long.")

		saynn("You pull back a little.. just to shove your {pc.penis} as deep as that hungry ass can handle.")

		saynn("You grunt heavily as your second load starts flooding his nethers, Alex is squirming heavily around your cock, his own is filling that condom with more of his seed.")

		saynn("[say=alexrynard]Ah-h.. my.. ah.. I'm.. a-again..[/say]")

		saynn("By this point his belly receives a cute bump.")

		saynn("[say=pc]Good boy, keep clenching..[/say]")

		saynn("And he does, his ass draining your balls until there is no {pc.cum} left.")

		saynn("Both of you are breathing heavily.")

		saynn("After breeding him thoroughly and destroying his prostate.. It's time to rest.")

		addButton("Rest", "Time for some cuddles", "hyp_ride_fuck_enough")
	if(state == "hyp_ride_fuck_enough"):
		playAnimation(StageScene.Cuddling, "idle", {npc="alexrynard", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, condom=true}})
		saynn("You pull your cock out, leaving Alex's used tailhole to pulse and leak your seed. After that, you just pull him in for some cuddles.")

		saynn("[say=pc]There we go.[/say]")

		saynn("He is still seeing the warm glowy colors.. his mind probably overwhelmed.")

		saynn("[say=alexrynard]..hah..[/say]")

		saynn("[say=pc]Was it fun?[/say]")

		saynn("[say=alexrynard]Yes-s..[/say]")

		saynn("He is still squirming in your hands.. so you try to calm him down, your hands hugging him. You also carefully tie the condom up and safely dispose of it.")

		saynn("Probably time to turn that visor off.")

		addButton("Visor", "Turn it off", "hyp_fuck_turnoff_visor")
	if(state == "hyp_fuck_turnoff_visor"):
		playAnimation(StageScene.Cuddling, "idle", {npc="alexrynard", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("The glow goes away. Alex blinks many times.. slowly coming back to his senses.")

		saynn("[say=alexrynard]Ow.. ah..[/say]")

		saynn("You hug him tighter to help when all the bad feelings start flooding his mind again.")

		saynn("[say=pc]How do you feel?[/say]")

		saynn("[say=alexrynard]My ass hurts, hah..[/say]")

		saynn("Well.. duh..")

		saynn("[say=pc]Did you like it though?[/say]")

		saynn("Alex stays quiet, resting in your tight embrace.")

		saynn("[say=alexrynard]I won't confirm or deny anything..[/say]")

		saynn("Hah. What a sly fox.")

		saynn("And so you just rest together like this, enjoying the company of each other.")

		saynn("After some time, you help him to get up and dress. You can't help but to chuckle when you see him walking a little funny. Alex guides you back to the workshop.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "hyp_strapon_pick"):
		saynn("Pick what strapon you wanna use to fuck Alex's butt.")

		addStraponButtons()
		if (false):
			addButton("Nope", "You shouldn't see this", "hyp_strapon")
	if(state == "hyp_strapon"):
		playAnimation(StageScene.BreastGroping, "tease", {pc="pc", npc="alexrynard"})
		saynn("The guy is still so cheeky.. makes you want to see how well he can handle getting fucked.")

		saynn("You lean closer to his ear to whisper some words while your hand lands on his neck to make him feel even more powerless.")

		saynn("[say=pc]Tell me, foxy, do you experience anal often?[/say]")

		saynn("Alex raises his chin slightly.")

		saynn("[say=alexrynard]No..[/say]")

		saynn("[say=pc]Do you wish to do it more?[/say]")

		saynn("He stays quiet for some time, his parted lips trembling.")

		saynn("[say=alexrynard]Of course.. Anything for you.[/say]")

		saynn("So sweet. You notice some movement in his shorts already.")

		saynn("[say=pc]Why don't you undress then. I have just the thing we can use..[/say]")

		addButton("Continue", "See what happens next", "hyp_strapon_undress")
	if(state == "hyp_strapon_undress"):
		playAnimation(StageScene.BreastGroping, "tease", {pc="pc", npc="alexrynard", npcBodyState={naked=true, hard=true}})
		addCharacter("alexrynard", ["naked"])
		saynn("Alex nods and proceeds to slowly unbutton his shirt and take it off. Your hand stops gripping his throat and instead slides down over his chest, brushing over his pecs. So much tension..")

		saynn("[say=pc]Fully.[/say]")

		saynn("He puts his digits under the ribbon of his shorts and pulls him down, revealing his red cock that is already twitching from excitement, a lonely drop of pre sliding down from its pointy tip.")

		saynn("[say=pc]Good boy.[/say]")

		saynn("A packaged condom falls out of his pocket as his shorts hit the floor. Hmm.. You could use that for something.")

		addButton("Continue", "See what happens next", "hyp_strapon_cowgirl")
	if(state == "hyp_strapon_cowgirl"):
		playAnimation(StageScene.SexCowgirlAlt, "tease", {pc="pc", npc="alexrynard", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, condom=true}})
		saynn("You undress and pull out the toy that you're gonna use this time.. a strapon. You secure it around your waist and then lie down on the floor. Your hands tap on your lap as you smile.")

		saynn("[say=pc]Come here.[/say]")

		saynn("Alex nods and crawls up to you.. before stradling your hips, his cock brushing against your rubber one.")

		saynn("[say=alexrynard]Yes..[/say]")

		saynn("You catch some of his precum onto your digits.. and then spread it along your new length.. not the best lube, but it will do.")

		saynn("Foxy watches you with his hazy lusty eyes as you grab the packaged condom, quickly rip it open.. and begin applying it.. no, not to your cock.. but his.")

		saynn("[say=alexrynard]Huh?..[/say]")

		saynn("[say=pc]So you don't make a mess on me, foxy.[/say]")

		saynn("[say=alexrynard]Of course..[/say]")

		saynn("After all that.. It's time.")

		saynn("[say=pc]I want you to ride me.[/say]")

		saynn("Alex lowers his gaze to your toy.. and nods.")

		saynn("[say=alexrynard]With pleasure..[/say]")

		saynn("He raises himself a bit.. and uses his hand to guide your rubber member towards his tailhole as he starts lowering himself onto you..")

		saynn("So tight.. you can feel his star resisting because the strapon starts putting pressure on your crotch.. and yet, Alex keeps trying, little quiet noises begin escaping him.")

		saynn("[say=pc]Don't hold back.[/say]")

		addButton("Continue", "See what happens next", "hyp_strapon_ride")
	if(state == "hyp_strapon_ride"):
		playAnimation(StageScene.SexCowgirlAlt, "sex", {pc="pc", npc="alexrynard", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, condom=true}})
		saynn("The quiet noises quickly grow until they become small moans, Alex focuses on the hypnovisor glow.. allowing him to relax enough to take some of that strapon inside.")

		saynn("[say=alexrynard]Ah..[/say]")

		saynn("It's great, all you have to do is watch how Alex starts grinding himself against your crotch, his tight anal slowly stretching to accommodate the size of that toy.")

		saynn("[say=pc]Such a good boy..[/say]")

		saynn("Saying that only made him clench more.. increasing the friction and making your breathing deeper as well.")

		saynn("Eventually, the foxy is able to comfortably take most of that rubber cock, his thighs slapping against yours with a soft thump.")

		saynn("[say=alexrynard]Nh-h.. ah..[/say]")

		saynn("It seems, the toy is pushing on all the right buttons, making it so the tip of the condom becomes a little heavy from some transparent fluids in it.")

		saynn("Alex is doing exactly as told, riding you, rising himself before bringing his body down onto your length.")

		saynn("[say=pc]Do you like it?[/say]")

		saynn("[say=alexrynard]Yes.. ah..[/say]")

		saynn("His eyes don't lie.")

		addButton("Continue", "See what happens next", "hyp_strapon_ride_faster")
	if(state == "hyp_strapon_ride_faster"):
		playAnimation(StageScene.SexCowgirlAlt, "fast", {pc="pc", npc="alexrynard", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, condom=true}})
		saynn("Alex is picking up the pace himself, riding you faster and harder, his own cock bobbing up and down, the condom collecting more pre.")

		saynn("[say=pc]Such an eager foxy. Think you can cum like this?[/say]")

		saynn("All you get back is more moans, Alex's mouth is opened, tongue out and drooling, his eyes keep rolling up.")

		saynn("[say=alexrynard]Nh-h.. ye-.. -ah.. h-h..[/say]")

		saynn("His slick inner walls gripping your strapon so well.. while it is smashing into his little pleasure button each time he brings himself down on you.")

		saynn("[say=pc]Well show me then~.[/say]")

		saynn("He is so adorable, making cute lusty noises.. riding your fake cock like it's the most fun attraction in the park. The way he clenches each time you tell him something.. so nice.")

		saynn("The knot at the base of Alex's cock inflates with blood, signaling that he is about to cum. Good..")

		addButton("Orgasm", "Make that foxy squirm", "hyp_ride_strapon_cum")
	if(state == "hyp_ride_strapon_cum"):
		playAnimation(StageScene.SexCowgirlAlt, "inside", {pc="pc", npc="alexrynard", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, condom=true}})
		saynn("Alex brings himself down onto your strapon with one last big motion.. before arching his back and letting out a passionate moan, his cock starts throbbing and filling the condom with its load, making the tip sag lower and lower.. but luckily the condom seems to hold.")

		saynn("[say=alexrynard]Ah-h-h!.. ah.. h-hh..[/say]")

		saynn("His ass is just sucking you in, his inner walls kneading your rubber cock, desperate for any cum. You moan too softly, the pressure on your crotch feels really good..")

		saynn("He throws his head back and just keeps moaning and grinding you, enjoying his anal orgasm.")

		saynn("[say=pc]Ah.. wow, you're one hungry fox.[/say]")

		saynn("[say=alexrynard]Yes.. yes-s.. hah..[/say]")

		addButton("Enough", "Just pull him in for cuddles", "hyp_ride_strapon_enough")
		addButton("Pin him down", "Give him what he wants", "hyp_ride_strapon_pin")
	if(state == "hyp_ride_strapon_pin"):
		playAnimation(StageScene.SexMissionary, "fast", {pc="pc", npc="alexrynard", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, condom=true}})
		saynn("He clearly wants more.. so why not give him more.")

		saynn("Since you have been saving all your strength up to this point, you easily push yourself off the floor and pin foxy to the floor, your strapon is still inside him.")

		saynn("[say=alexrynard]Ah??..[/say]")

		saynn("Without even explaining anything, you start hammering away at his asshole, fucking it fast and rough.")

		saynn("Alex is still not fully recovered from the last orgasm.. but now his hard prostate is being put under a lot of pressure again, his cock is twitching and dripping into the condom.")

		saynn("[say=alexrynard]Oh.. Ah.. fuck..[/say]")

		saynn("Passionate moans begin to escape from him again, his body shivering under you.. so cute.")

		saynn("[say=pc]Such a slutty boy. Are you sure you're not a cocksleeve?[/say]")

		saynn("[say=alexrynard]I am.. a fucktoy.. a dirty cocksleeve.. a slave.[/say]")

		saynn("You thrust into the mouthy foxy with great power, pounding his stretchy fuckhole with full force. At some point the knot on his cock starts inflating again..")

		addButton("Another orgasm", "Make the foxy feel good", "hyp_ride_strapon_pin_cum")
	if(state == "hyp_ride_strapon_pin_cum"):
		playAnimation(StageScene.SexMissionary, "inside", {pc="pc", npc="alexrynard", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, condom=true}})
		saynn("You pull back a little.. just to shove your strapon as deep as that hungry ass can handle.")

		saynn("Alex is squirming heavily around your toy, his cock is filling that condom with more of his seed.")

		saynn("[say=alexrynard]Ah-h.. my.. ah.. I'm.. a-again..[/say]")

		saynn("By this point his belly receives a cute bump.")

		saynn("[say=pc]Good boy, keep clenching..[/say]")

		saynn("And he does, his ass gripping your fake cock like it's a real one, trying to milk it dry.")

		saynn("Both of you are breathing heavily.")

		saynn("After breeding him thoroughly and destroying his prostate.. It's time to rest.")

		addButton("Rest", "Time for some cuddles", "hyp_ride_strapon_enough")
	if(state == "hyp_ride_strapon_enough"):
		playAnimation(StageScene.Cuddling, "idle", {npc="alexrynard", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, condom=true}})
		saynn("You pull your strapon out, leaving Alex's used tailhole to pulse and gape. After that, you just take off the harness and pull him in for some cuddles.")

		saynn("[say=pc]There we go.[/say]")

		saynn("He is still seeing the warm glowy colors.. his mind probably overwhelmed.")

		saynn("[say=alexrynard]..hah..[/say]")

		saynn("[say=pc]Was it fun?[/say]")

		saynn("[say=alexrynard]Yes-s..[/say]")

		saynn("He is still squirming in your hands.. so you try to calm him down, your hands hugging him. You also carefully tie the condom up and safely dispose of it.")

		saynn("Probably time to turn that visor off.")

		addButton("Visor", "Turn it off", "hyp_fuck_turnoff_visor")
func addPumpButtons():
	var pumps = GM.pc.getInventory().getItemsWithTag(ItemTag.PenisPump)
	for pump in pumps:
		addButton(pump.getVisibleName(), pump.getVisibleDescription(), "hyp_penispump", [pump])

func addStraponButtons():
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), "hyp_strapon", [strapon])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "brought_room"):
		processTime(3*60)

	if(_action == "trust_brat"):
		bratCounter += 1

	if(_action == "sayowido"):
		bratCounter += 1

	if(_action == "1"):
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("HypnovisorDisabled"))

	if(_action == "2"):
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("HypnovisorMk1"))
		processTime(10*60)

	if(_action == "3"):
		processTime(5*60)

	if(_action == "4_pussyfuck_fuck"):
		processTime(10*60)

	if(_action == "4_pussyfuck_pull_condom_off"):
		usedCondom = false
		setState("4_pussyfuck_fuck")
		return

	if(_action == "4_pussyfuck_fuck_cum"):
		processTime(10*60)
		GM.pc.orgasmFrom("alexrynard")
		GM.pc.gotVaginaFuckedBy("alexrynard")
		if(usedCondom):
			addFilledCondomToLootIfPerk(getCharacter("alexrynard").createFilledCondom())
		else:
			GM.pc.cummedInVaginaBy("alexrynard")

	if(_action == "after_cuddle"):
		processTime(10*60)
		setFlag("AlexRynardModule.4TrustCompleted", true)

	if(_action == "4_analfuck_fuck"):
		processTime(10*60)

	if(_action == "4_analfuck_pull_condom_off"):
		usedCondom = false
		setState("4_analfuck_fuck")
		return

	if(_action == "4_analfuck_fuck_cum"):
		processTime(10*60)
		GM.pc.orgasmFrom("alexrynard")
		GM.pc.gotAnusFuckedBy("alexrynard")
		if(usedCondom):
			addFilledCondomToLootIfPerk(getCharacter("alexrynard").createFilledCondom())
		else:
			GM.pc.cummedInAnusBy("alexrynard")

	if(_action == "novisor"):
		GM.pc.getInventory().clearSlot(InventorySlot.Eyes)
		processTime(20*60)

	if(_action == "hypno_alex"):
		getCharacter("alexrynard").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("HypnovisorMk1"))
		processTime(10*60)

	if(_action == "hyp_hand_stroke"):
		processTime(10*60)

	if(_action == "hyp_after_stroke"):
		processTime(3*60)

	if(_action == "hyp_after_stroke_visor"):
		getCharacter("alexrynard").resetEquipment()
		processTime(30*60)

	if(_action == "hyp_penispump"):
		processTime(5*60)
		var strapon = _args[0]
		pumpID = strapon.uniqueID
		getCharacter("alexrynard").getInventory().forceEquipStoreOtherUnlessRestraint(strapon)

	if(_action == "hyp_aftermilk"):
		GM.pc.addSkillExperience(Skill.Breeder, 20, "penis_pump")
		var pump = getCharacter("alexrynard").getInventory().getItemByUniqueID(pumpID)
		if(pump!=null):
			howMuchSeed = getCharacter("alexrynard").getBodypart(BodypartSlot.Penis).getFluids().transferTo(pump, 1.0)

	if(_action == "hyp_grab_pump_back"):
		var pump = getCharacter("alexrynard").getInventory().getItemByUniqueID(pumpID)
		if(pump != null):
			getCharacter("alexrynard").getInventory().removeEquippedItem(pump)
			GM.pc.getInventory().addItem(pump)
		getCharacter("alexrynard").resetEquipment()

	if(_action == "hyp_put_on_chastity"):
		processTime(5*60)

	if(_action == "hyp_say_mindgasm"):
		processTime(6*60)

	if(_action == "hyp_chastity_after"):
		getCharacter("alexrynard").resetEquipment()
		processTime(10*60)

	if(_action == "hyp_take_off_cage"):
		processTime(5*60)
		addMessage("You can now buy an advanced chastity cage.")

	if(_action == "hyp_fuck_undress"):
		processTime(5*60)

	if(_action == "hyp_fuck_ride"):
		processTime(10*60)

	if(_action == "hyp_fuck_ride_faster"):
		processTime(5*60)

	if(_action == "hyp_ride_fuck_cum"):
		processTime(5*60)
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "alex_anal")
		getCharacter("alexrynard").cummedInAnusBy("pc")
		addFilledCondomToLootIfPerk(getCharacter("alexrynard").createFilledCondom())
		GM.pc.orgasmFrom("alexrynard")

	if(_action == "hyp_ride_fuck_pin"):
		processTime(16*60)

	if(_action == "hyp_ride_fuck_pin_cum"):
		processTime(5*60)
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "alex_anal2")
		getCharacter("alexrynard").cummedInAnusBy("pc")
		GM.pc.orgasmFrom("alexrynard")

	if(_action == "hyp_fuck_turnoff_visor"):
		processTime(20*60)
		getCharacter("alexrynard").resetEquipment()

	if(_action == "hyp_strapon"):
		processTime(3*60)
		var strapon = _args[0]
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)

	if(_action == "hyp_strapon_undress"):
		processTime(5*60)

	if(_action == "hyp_strapon_ride"):
		processTime(10*60)

	if(_action == "hyp_strapon_ride_faster"):
		processTime(5*60)

	if(_action == "hyp_ride_strapon_cum"):
		processTime(5*60)
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "alex_anal")
		getCharacter("alexrynard").cummedInAnusBy("pc", FluidSource.Strapon)
		addFilledCondomToLootIfPerk(getCharacter("alexrynard").createFilledCondom())
		GM.pc.orgasmFrom("alexrynard")

	if(_action == "hyp_ride_strapon_pin"):
		processTime(16*60)

	if(_action == "hyp_ride_strapon_pin_cum"):
		processTime(5*60)
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "alex_anal2")
		getCharacter("alexrynard").cummedInAnusBy("pc", FluidSource.Strapon)
		GM.pc.orgasmFrom("alexrynard")

	if(_action == "hyp_ride_strapon_enough"):
		GM.pc.unequipStrapon()

	setState(_action)

func saveData():
	var data = .saveData()

	data["bratCounter"] = bratCounter
	data["usedCondom"] = usedCondom
	data["pumpID"] = pumpID
	data["howMuchSeed"] = howMuchSeed

	return data

func loadData(data):
	.loadData(data)

	bratCounter = SAVE.loadVar(data, "bratCounter", 0)
	usedCondom = SAVE.loadVar(data, "usedCondom", true)
	pumpID = SAVE.loadVar(data, "pumpID", "")
	howMuchSeed = SAVE.loadVar(data, "howMuchSeed", 0.0)
