extends SceneBase

var bratCounter = 0
var usedCondom = true

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
		if (getFlag("AlexRynardModule.4TrustCompleted")):
			addButton("Turn tables", "Offer him to put the visor on and surrender full control to you", "1_turntables")
		else:
			addDisabledButton("Turn tables", "A bit too early for that")
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

		saynn("[rainbow freq=0.05 sat=0.2 val=1.0]A very pleasant glow.[/rainbow]")

		saynn("The visor begins to show you all sorts of colorful patterns and seeing how you react to them prioritizes choosing the ones that had the most effect. And soon, you start to feel any worries going away.. Any stress.. disappearing from your head.. only the good emotions stay.. and become amplified with the lack of any negative ones.")

		saynn("[rainbow freq=0.05 sat=0.2 val=1.0]Everything is so nice.[/rainbow]")

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

		saynn("[rainbow freq=0.05 sat=0.2 val=1.0]Sex.. Toy.. Pleasure.. Sextoy.. Serve..[/rainbow]")

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

		saynn("[rainbow freq=0.05 sat=0.2 val=1.0]Sex.. Sex.. Sex..[/rainbow]")

		saynn("He leans in closer to your ear.")

		saynn("[say=alexrynard]I'm fucking you because I want to. Turn. Around. Slave.[/say]")

		saynn("Yes.. Yes! Anything for him.")

		if (GM.pc.hasReachableVagina()):
			addButton("Turn around", "Present Alex your pussy", "4_pussyfuck")
		else:
			addButton("Turn around", "Present Alex your butt", "4_analfuck")
	if(state == "4_pussyfuck"):
		playAnimation(StageScene.SexFreeStanding, "tease", {pc="alexrynard", npc="pc", bodyState={naked=true,hard=true,condom=usedCondom}, npcBodyState={naked=true,hard=true,leashedBy="alexrynard"}})
		saynn("After thoroughly covering Alex's digits with your saliva, you turn around and stick your butt out, your hands land on your butt and spread it wide. You proudly show both your needy holes to the foxy.")

		saynn("[rainbow freq=0.05 sat=0.2 val=1.0]Sex slave.. Fucktoy.. Breed.. Fuck.. Cum..[/rainbow]")

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

		saynn("In one swift motion, his cock is sliding between your inner walls and smashes into your cervix, pushing you forward.. just for his arms to pull you back moments later.")

		saynn("[say=pc]Yes![/say]")

		saynn("His thighs are slapping against your butt with each rough motion. Alex is fast and deliberate, fucking you like you are his sextoy.. his property..")

		saynn("[rainbow freq=0.05 sat=0.2 val=1.0]Fucktoy.. Cocksleeve.. Sex slave..[/rainbow]")

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
	if(state == "after_cuddle"):
		playAnimation(StageScene.Cuddling, "squirm", {pc="alexrynard", npc="pc", bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		saynn("Alex pulls you onto the sofa for some cuddles.. while the visor is still messing with your mind.")

		saynn("[say=alexrynard]Still horny, huh.[/say]")

		saynn("[rainbow freq=0.05 sat=0.2 val=1.0]Sex.. Toy..[/rainbow]")

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

	if(_action == "novisor"):
		GM.pc.getInventory().clearSlot(InventorySlot.Eyes)
		processTime(20*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["bratCounter"] = bratCounter
	data["usedCondom"] = usedCondom

	return data

func loadData(data):
	.loadData(data)

	bratCounter = SAVE.loadVar(data, "bratCounter", 0)
	usedCondom = SAVE.loadVar(data, "usedCondom", true)
