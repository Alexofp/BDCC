extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "ForcedChastityOptionalRishaScene"

func _run():
	
	if(state == ""):
		aimCameraAndSetLocName("medical_confessionary")
		GM.pc.setLocation("medical_confessionary")
		playAnimation(StageScene.HangingSolo, "idle", {bodyState={naked=true}})
		
		saynn("You open your eyes and realize that this is that day again. Dimly-lit room, fancy furniture, an iron hook that your wrists are cuffed to. Looking down you see your own permanent cage. You can’t hide it, you might be kinda excited.")

		saynn("You hear footsteps.. loud ones too..")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		addCharacter("risha")
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {pc="risha", npc="eliza"})
		
		saynn("[say=risha]Why? I could have fucked you right there.[/say]")

		saynn("[say=eliza]Risha.. I said that just to bring you here, you horndog.[/say]")

		saynn("[say=risha]You fucking serious?[/say]")

		saynn("Risha enters the room soon followed by doctor Quinn who pushes the guard further. Risha is wearing her usual riot gear, bulky armor that covers pretty much her whole body except the head. But you can tell that she is one buff woman.")

		saynn("[say=eliza]You will get a hole to fuck, how about that. Not mine but inmate’s.[/say]")

		saynn("Risha sees you, chained up to the ceiling and raises her brow.")

		saynn("[say=risha]{pc.His}? But it’s much more fun to see them struggle. Feel them squirming as they’re trying to break free but realize they’re not as strong as me.[/say]")

		saynn("Then she eyes you out fully, spotting one particular detail about you.")

		saynn("[say=risha]Ohh, look at that. That changes things. The bitch was unfortunate enough to get caged. Pff-f. That’s so funny.[/say]")

		saynn("Eliza goes ahead and grabs a tube of lube before offering it to the big feline.")

		saynn("[say=eliza]Have fun, {pc.he} wanted you. Make sure to use this.[/say]")

		saynn("Risha chuckles and slaps the doctor's paw away before trying to approach you. But the doctor steps into her way again and is brave to shove her back.")

		saynn("[say=eliza]I’m being serious. I can get your sorry prick caged in a second. You don’t need it to do your shit.[/say]")

		saynn("Risha reaches out and grabs the weaker feline by the labcoat before pulling her extremely close, too close for any comfort. Her tone changes for the worst.")

		saynn("[say=risha]Well try me. I went through things that your science books can’t even describe. Go ahead.[/say]")

		saynn("Risha spreads her arms and stares at the other cat. Eliza frowns and flexes her fists. You can hear someone growling.")

		saynn("[say=eliza]You.. just don’t kill the inmate or you will take {pc.his} place.[/say]")

		saynn("[say=risha]Oh, I know better than to kill my prey, kitty cat.[/say]")

		saynn("Risha chuckles and looks behind Eliza’s shoulder at you.")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="risha", bodyState={naked=true}})
		
		saynn("The guard slowly approaches you. Then she does a single lap around you while you track her movements as much as your chains allow. Risha takes off her gloves and just drops them.")

		saynn("[say=risha]So you’re the new buttslut in the making, huh.[/say]")

		# (if has cock bigger than Risha)
		if(GM.pc.getPenisSize() > getCharacter("risha").getPenisSize()):
			saynn("She glances at your caged up cock and frowns.")

			saynn("[say=risha]Your cock size is where your luck has run out.[/say]")

		# (else)
		else:
			saynn("She glances at your caged up cock and smiles.")

			saynn("[say=risha]Some cocks just deserve to be locked away.[/say]")

		# (end)

		saynn("She stands in front of you but her paw reaches out to behind your {pc.thick} ass and finds your {pc.analStretch} pucker that she claws softly, making you clench.")

		# (if has pussy)
		if(GM.pc.hasReachableVagina()):
			saynn("[say=risha]As much as I’d love to breed your pussy.. This nice doctor over here has asked me to help you. How can I say no?[/say]")

		# (else)
		else:
			saynn("[say=risha]I’m usually spending my time breeding bitches.. But this nice doctor over here has asked me to help you. How can I say no?[/say]")

		saynn("She spits on her own digits and brings them back to your backdoor. Without much hesitation she shoves two inside, penetrating your ass and making you let out a noise. She doesn’t stop there, her digits curl up enough to find your spot. The spot. She forces eye contact with you while proceeding to slide her digits in and out, hammering at your prostate.")

		saynn("Very soon you begin to feel pressure behind your cage as your member tries to get hard. Desperately. So much that you begin to hump the air, moving your hips back and forth while rattling the chains. Risha bathes in your embarrassment.")

		saynn("[say=risha]Say you want me to replace them with my cock.[/say]")

		saynn("She keeps fingering your ass so hard that you feel your cock leaking pre onto the cage and the floor. Your whole body wants to squirm as she finds just the right buttons of your body to press.")

		saynn("[say=risha]Say you want me to ruin your ass. Say it.[/say]")

		# (Options are Stay silent and Say it)

		addButton("Say it", "Beg for Risha to ruin your ass", "say_it")
		addButton("Stay silent", "You’re gonna admit anything", "stay_silent")

	if(state == "stay_silent"):
		addCharacter("risha", ["naked"])
		playAnimation(StageScene.HangingDuo, "idle", {npc="risha", bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		
		saynn("You can’t stop your body from reacting to this amount of stimulation, little rouge moans escape from your lips. But nothing else, Risha can screw herself with her attempts to humiliate you.")

		saynn("But she is relentless, her digits keep fucking you so much that very soon you find yourself arching your back and thrashing against the chains. Your prostate is being milked so much that you start leaking {pc.cum} instead. That’s when Risha finally stops, leaving your tailhole to clench every few seconds on its own, already offering you that afterglow.")

		saynn("[say=risha]Well. Tough luck, huh. You don’t want me so I guess I will step away.[/say]")

		saynn("And Risha does, she rubs her wet digits dry using your butt and then turns around, glancing at Eliza. And smiling.")

		saynn("[say=risha]Is what a little bitch would say. Haha.[/say]")

		saynn("Risha drops her armor completely, exposing her wide ass to you. And when she turns, you see her rich breasts and the main attraction in the form of her barbed dick, already peeking out of its sheath.")

		saynn("[say=risha]I’m not done with you until you can’t walk anymore, bitch.[/say]")
	
		addButton("Continue", "See what happens next", "continue2")

	if(state == "say_it"):
		addCharacter("risha", ["naked"])
		playAnimation(StageScene.HangingDuo, "idle", {npc="risha", bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		
		saynn("[say=pc]Please do it.. Ruin my ass with your cock, please..[/say]")

		saynn("So much stimulation coming from her fingers, little passionate moans escape from your lips together with all the begging.")

		saynn("[say=risha]Yeah-h, you want that, don’t you. You want me to turn you into a grade-A buttslut.[/say]")

		saynn("[say=pc]Please..[/say]")

		saynn("She is relentless, her digits keep fucking you so much that very soon you find yourself arching your back and thrashing against the chains. Your prostate is being milked so much that you start leaking {pc.cum} instead. That’s when Risha finally stops, leaving your tailhole to clench every few seconds on its own, already offering you that afterglow.")

		saynn("After that she takes a step back and just drops her riot armor completely, exposing her wide hips, huge tits and a main attraction that is her barbed cock peeking from its sheath.")

		saynn("[say=risha]Hope you’re ready, bitch. Hope you’re not actually.[/say]")

		addButton("Continue", "See what happens next", "continue2")

	if(state == "continue2"):
		playAnimation(StageScene.HangingSex, "sex", {npc="risha", bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		
		saynn("Risha quickly positions herself behind you, one paw holding onto your cage while the second gets her feline member hard and guides it towards your {pc.analStretch} star, its pointy tip already brushing against your sensitive flesh.")

		saynn("[say=risha]Oh the desire to go in dry.[/say]")

		saynn("After some deliberation she pulls her cock away and crouches to level with your asshole before spitting onto it and then onto her cock. So embarrassing.")

		saynn("But after that she just quickly aligns her cock with your ring again and throws her hips forward, penetrating your ass with full force until her hips slam against your buttcheeks. Her barbs are soft but the sharp sensations were enough for you to cry out a noise.")

		saynn("[say=risha]You won’t have it any other way with me~.[/say]")

		saynn("After that she slaps your ass, making it jiggle while she starts rocking her hips back and forth, picking up speed. Her spit didn’t help much. The more you clench, the more you feel her barbs digging into your star and making it painful for you, they force you to relax your asshole or feel the abuse.")

		saynn("But even though it’s really tough to find pleasure in having your tailhole fucked in such a rough way, your pleasure spot is being stimulated just fine. The pressure is rising yet again in your cage as Risha holds onto it while fucking you raw.")

		saynn("[say=risha]I’m not holding back and you love it, like a painslut would.[/say]")

		saynn("Each her thrust sends your body to quiver, there is only so much you can endure before your caged up dick starts leaking pre mixed with prostate fluids again. You open your mouth to produce some moans but quickly find Risha grabbing onto your jaw and forcing fingers into your mouth. You don’t even need to be ordered, you begin suckling on them like a good inmate.")

		saynn("[say=risha]Mmhm~. Little slutty buttslut.[/say]")

		saynn("You feel yourself getting close..")

		addButton("Continue", "See what happens next", "continue3")

	if(state == "continue3"):
		playAnimation(StageScene.HangingSex, "fast", {npc="risha", pcCum=true, npcCum=true, bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		
		saynn("The more she pounds your ass the more you clench your little star around her shaft, slowly getting used to the sensations that her barbs bring while raking against your soft inner walls. The discomfort goes away, replaced by a strange feeling of pressure inside your dick, like something is about to start overflowing out of it.")

		saynn("You brace. And soon enough. You cum. Even though she drained you once before with her digits, more {pc.cum} begins leaking out of your constrained cock while Risha continues to milk your prostate to death. You’d moan for her but instead you just drool while licking her fingers, your eyes really want to roll up from so many sudden waves of pleasure.")

		saynn("[say=risha]Oh, you’re cumming on me. Yes, get addicted to this cock messing your insides, little buttslut.[/say]")

		saynn("Her dirty talk only works on making you more eager. Your {pc.analStretch} tailhole clenches around her feline cock and soon you hear her making growling noises. You can tell that she is close because her barbs are becoming more stiff by the second, raking your walls that are already very sensitive after the orgasm. That discomfort feeling comes back in full swing..")

		saynn("[say=risha]Nghh~. Scream, bitch.[/say]")

		saynn("Her barbs dig into your flesh while you can’t stop clenching. A few more rough thrusts and Risha shoves her full length inside, going balls deep on you before cumming. She grunts while her barbed cock starts stuffing your bowels full of her thick sticky cum. It’s painful. But it hurts so good, you produce muffled loud noises while she keeps your mouth busy.")

		saynn("Your whole body tenses up while she stuffs you like some kind of breeding stock. Your member has been slowly leaking {pc.cum} this entire time, your prostate is under such heavy pressure that you can’t stop squirming.")

		saynn("Eventually Risha pulls her paw out of your mouth and then yanks her barbed cock a few seconds later, causing another sudden spike of feelings, strong enough for you to curl your toes and produce a loud unconstrained scream.")

		addButton("Continue", "So fucking rough", "continue4")

	if(state == "continue4"):
		playAnimation(StageScene.HangingSex, "tease", {npc="risha", bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		
		saynn("Eliza has been staring at you two this whole time, looking almost shocked. Risha just cleans her member against your thigh and quickly catches her breath.")

		saynn("[say=eliza]Risha..[/say]")

		saynn("[say=risha]What? I did what you asked. The bitch loved it.[/say]")

		saynn("You breathe heavily.")

		saynn("[say=eliza]Yeah, but.. teasing.. romance.. intimacy.. Do these words mean nothing to you?[/say]")

		saynn("Cum flows out of your gaping hole.")

		saynn("[say=risha]I will leave the cute shit to you, doctor Quinn. While I do the fun stuff like breaking whores.[/say]")

		saynn("[say=eliza]You.. never lived properly.[/say]")

		saynn("Risha starts putting on her armor back.")

		saynn("[say=risha]You think so? I’ve been choosing options that seem the most fun. Been working out for me so far.[/say]")

		saynn("[say=eliza]Yeah. But you’re wasting your life..[/say]")

		saynn("She puts on her gloves and the belt with the equipment, pretty much ready to leave.")

		saynn("[say=risha]Like you?[/say]")

		saynn("[say=eliza]No! I’m doing science! I’m creating a better future.[/say]")

		saynn("Risha chuckles.")

		saynn("[say=risha]And I’m breeding bitches. I’m also. Creating a better future.[/say]")

		saynn("Eliza squints and pouts visible, some growling can be heard again. But Risha just leaves the room after she’s done preparing.")

		saynn("[say=eliza]What a bitch..[/say]")

		saynn("Risha’s voice from behind the wall:")

		saynn("[say=risha]I heard that~.[/say]")

		addButton("Continue", "See what happens next", "continue5")

	if(state == "continue5"):
		removeCharacter("risha")
		aimCameraAndSetLocName("medical_nearconfessionary")
		GM.pc.setLocation("medical_nearconfessionary")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
		saynn("Eliza sighs and uncuffs your hands, letting you stand on your shaking legs.")

		saynn("[say=eliza]Well, at least you got a good time out of it. I’m proud of how well you held up, patient~[/say]")

		saynn("She hands you your clothes and then guides you out of the room. Risha wasn’t wrong, walking after being railed this rough is hard.")

		saynn("[say=eliza]See you around for another cage inspection~.[/say]")

		# (scene ends)

		addButton("Continue", "That was something", "endthescene")
		


func _react(_action: String, _args):
	if(true):
		processTime(RNG.randi_range(3,8)*60)

	if(_action == "continue3"):
		GM.pc.cummedInAnusBy("risha")
		GM.pc.orgasmFrom("risha")
		GM.pc.gotAnusFuckedBy("risha")

	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "stay_silent"):
		increaseFlag("MedicalModule.Chastity_OptionalBadBehavourCounter")
	
	setState(_action)

func getDevCommentary():
	return "Writing conflicts is kinda fun. Dunno why. But if you ever saw any movie or read any book.. There is always a conflict. No, not just one conflict. Many of them. BDCC has a huge core conflict in its lore (AlphaCorp vs Syndicate). The gameplay has a big conflict too (inmates vs staff vs other inmates). And then most of the scenes also have conflicts in them x3.\n\nBasically you always gotta search for those interesting conflicts. They don't have to be obvious like characters hating each other. Silent conflicts are the beeeeest. If you can make one character say 'have a good day' but actually mean 'hope you die bitch' and the reader can pick up on that, you are golden. It's also called subtext ^^. I'm not really that good at it, my writing isn't perfect, I know that.."

func hasDevCommentary():
	return true
