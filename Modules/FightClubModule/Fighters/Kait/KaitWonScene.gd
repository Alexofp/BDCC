extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "KaitWonScene"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait", npcAction="kneel"})

	if(state == ""):
		saynn("Kait cries out and falls down to her knees, too exhausted to continue fighting. She presses her hands into the ground and pants heavily. As you try to get closer, she recoils back into one of the fences.")

		saynn("[say=kait]Wait!..[/say]")

		saynn("You stand where you are and decide to let her speak.")

		saynn("[say=kait]I’m Kait. I’m building a team.[/say]")

		saynn("[say=pc]And why should I care?[/say]")

		saynn("[say=kait]A team to escape from this rathole. I need people that can help me. People that can fight.. Like you![/say]")

		saynn("Hm. Escaping, huh. That could be your chance. Although. She is just a lilac. What can a single lilac do. The crowd starts to notice the lack of actions and boos.")

		saynn("[say=pc]And what if I say no?[/say]")

		saynn("Kait tilts her head down and then shrugs a second later.")

		saynn("[say=kait]Then just don’t stand in a way?.. I don’t wanna fight you, I wanna fight them, the corrupt evil fuckers that rule over us like we’re slaves.[/say]")

		addDisabledButton("Join", "Begin the Team Escape route (not done, sorry)")
		addButton("Just leave", "You don’t feel like doing anything with her", "just_leave")
		addButton("Beat her up", "(brutal noncon) She is just a lilac slut, no need to listen to her", "beat_her_up")
		GM.ES.triggerRun("ArenaFighterPCWon", ["kait"])

	if(state == "just_leave"):
		saynn("[say=pc]Your idea seems pretty bad. Look around. It’s a fortress. Just learn to live here.[/say]")

		saynn("Kait growls and shows off her fangs.")

		saynn("[say=kait]What if I don’t wanna? I’m not gonna give up no matter what.[/say]")

		saynn("[say=pc]Well then you're gonna suffer here.[/say]")

		saynn("[say=kait]I’m suffering every single day of my life. But at least I’m fighting to try and change that.[/say]")

		saynn("Now it’s your time to shrug. You do that and walk past her, proceeding to get over the fence. She tracks you with her gaze, getting slightly startled when you walk past.")

		# (scene ends)
		addButton("Continue", "Time to leave", "endthescene")

	if(state == "beat_her_up"):
		
		saynn("You continue stepping towards her, menacingly. Kait keeps crawling away and eventually traps herself in one of the corners.")

		saynn("[say=pc]You know what I’m wondering about, Kait?[/say]")

		saynn("She glares at you and extends her claws.")

		saynn("[say=kait]What?[/say]")

		saynn("You crouch before her and tilt your head to the side slightly.")

		saynn("[say=pc]Do you purr when you get fucked in the pussy?[/say]")

		saynn("She growls and reaches her paw to scratch your face. You anticipate that and capture her arm before wrenching it under an unnatural angle, causing lots of discomfort. Kait cries out painfully and shoves her knee into you, managing to push you back. But not without you getting a grasp on her inmate shirt and ripping all the buttons off and exposing her bare chest with cute c-cup tits with perky pink nipples. The crowd cheers as the fight continues.")

		saynn("[say=kait]Go fuck yourself![/say]")

		saynn("[say=pc]We both know how this is gonna end. The only question is how many bones will I need to crack.[/say]")

		saynn("Kait slowly gets up and gets into a fighting stance. She looks tired and is still very much cornered between two fences with her shirt being casually spread open. You take your time to recover after her last trick and then begin to slowly creep towards her again.")

		saynn("You decide to give her the initiative and react to what she will do, you’re very much aware of her strong legs. As you close up the distance you notice her preparing a kick and as she goes forward with it, you mastefully avoid her and get a firm grasp on her digitigrade leg. Kait snarls as she tries to free it but is unable to due to her weak state.")

		saynn("[say=pc]Would be a shame to lose one, wouldn’t it?[/say]")

		saynn("Kait gasps as she sees you winding your free arm up before bringing it down, striking the leopard’s exposed knee with your elbow. You hear a crack and then a loud cry, Kait experiences true agony as her leg was almost snapped in half. Adrenaline rushes through her blood. Desperate, she grabs onto the fences with her arms and shoves her healthy leg into your chin with full strength of a furious kitty, sending you back a good few meters. Ow, you feel your jaw misaligned. What a bitch.")

		saynn("Kait, unable to stand on her leg, drops to the floor again, hissing and growling at everything. You slowly get up off the floor and put your hands on your lower jaw before forcing it back into place with a satisfying click, she is not the only one who feels adrenaline.")

		saynn("[say=pc]I can do this all day. While you only have one working leg left. Is it worth it?[/say]")

		saynn("Kait whines and cries out from ugly sensations, her shaky paws rub her half-broken leg, trying to soothe the pain. She sees you being up fast and shows her hatred by growling at you. She uses her arms to push herself up and get up off the ground. She has to stand on one leg, her other is barely touching the floor. The snow leopard doesn’t even care that her breasts are exposed.")

		saynn("[say=kait]F-Fuck you..[/say]")

		saynn("The girl got courage, you give her that. She is still a fool though, you offer her a sarcastic shrug and start creeping towards her again.")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		playAnimation(StageScene.SexStart, "defeated", {
			pc="pc", npc="kait", 
		})
		
		saynn("As you get close to her and try to attack her, she tries to kick you again. But it seems like the crowd is tired of seeing her do the same thing, as soon as she grabs onto the fence with her paws, many crowd’s hands slip through the holes in the fences and grab her, pinning Kait’s arms to the fence! Her pupils increase in size, she tries to free herself but only gets her legs grabbed and held in place too, leaving her exposed breasts and chest completely open. She looks at you, her eyes show terror, despair.")

		saynn("Of course you're gonna take advantage of that, you prepare a powerful kick and then lunge forward, shoving your leg into the center of Kait’s mass, her torso. When it connects, you hear a sound of cracked ribs and then a loud gasp, your attack knocks all the air out of Kait. As the hands let her go, she slides down to her knees and then collapses onto the ground like a huge sack of meat. She only finds enough strength to curl up and hug herself, sobbing and whining.")

		saynn("You look down at her. She is coughing and gasping for air, exposed parts of her body are all covered in bruises, her knee looks red.")

		saynn("[say=pc]This will be a lesson for you.[/say]")

		addButton("Leave now", "She suffered enough", "leave_now")
		if(OPTIONS.isContentEnabled(ContentType.Watersports)):
			if(GM.pc.hasPenis() || GM.pc.hasVagina()):
				addButton("Piss on her", "Humiliate that bitch", "piss_on_her")
			else:
				addDisabledButton("Piss on her", "You need a cock or a pussy to piss on her")
		else:
			addDisabledButton("Piss on her", "(Watersports content is disabled) Humiliate that bitch")
		addButtonWithChecks("Breed her", "(noncon) Might as well stuff some kittens into her", "breed_her", [], [ButtonChecks.HasReachablePenis])

	if(state == "leave_now"):
		saynn("You loom over the Kait’s body and decide that torturing her won’t be fun anymore. You turn away and climb the nearest fence, leaving her alone. Cats can lick their wounds, she will be fine.")

		# (scene ends)
		addButton("Continue", "Time to leave", "endthescene")


	if(state == "piss_on_her"):
		# (needs cock or pussy and piss content)
		playAnimation(StageScene.SexFeetPlay, "pin", {
			pc="pc", npc="kait", 
			bodyState={exposedCrotch=true,hard=true,},
			npcBodyState={},
		})

		# (if has cock)
		if(GM.pc.hasPenis()):
			if(GM.pc.isWearingChastityCage()):
				saynn("You stand near Kait’s body and expose your {pc.cock} that’s locked away behind a chastity cage. The urge comes quickly, a stream of warm piss emerges from the tip of your dick and offers the cat on the ground a golden shower. She winces and tries to cover herself but the piss gets everywhere, you make sure to coat her hair, face, exposed tits and her legs with your gross fluids. A puddle of piss is getting bigger under Kait, the way she is panting there is no way she didn’t catch the scent.")
			else:
				saynn("You stand near Kait’s body and pull out your {pc.cock}. The urge comes quickly, a stream of warm piss emerges from the tip of your dick and offers the cat on the ground a golden shower. She winces and tries to cover herself but the piss gets everywhere, you make sure to coat her hair, face, exposed tits and her legs with your gross fluids. A puddle of piss is getting bigger under Kait, the way she is panting there is no way she didn’t catch the scent.")

			saynn("You finish marking her and put your cock away. Her clothes are now all damp and ruined, kitty’s white fur now has many yellow spots, showcasing the piss quite clearly. It will be a while before she can wash it all off, including the gross scent. The crowd is laughing at the poor kitty that got humiliated so hard.")

			saynn("You silently climb over the fence and go get your reward. Kait knew this place doesn't have rules.")

		# (else if has pussy)
		elif(GM.pc.hasVagina()):
			saynn("You stand near Kait’s body and expose your {pc.pussyStretch} pussy. The urge comes quickly, a stream of warm piss emerges from your urethra and offers the cat on the ground a golden shower. She winces and tries to cover herself but the piss gets everywhere, you make sure to coat her hair, face, exposed tits and her legs with your gross fluids. A puddle of piss is getting bigger under Kait, the way she is panting there is no way she didn’t catch the scent.")

			saynn("You finish marking her and cover your slit. Her clothes are now all damp and ruined, kitty’s white fur now has many yellow spots, showcasing the piss quite clearly. It will be a while before she can wash it all off, including the gross scent. The crowd is laughing at the poor kitty that got humiliated so hard.")

			saynn("You silently climb over the fence and go get your reward. Kait knew this place doesn't have rules.")

		# (scene ends)
		addButton("Continue", "Time to leave", "endthescene")


	if(state == "breed_her"):
		addCharacter("kait", ["naked"])
		# (need cock)
		playAnimation(StageScene.SexStanding, "sex", {
			pc="pc", npc="kait", 
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true},
		})
		
		saynn("You flex your {pc.masc} arms and then expose your {pc.cock}. Kait sees it and shakes her head subtly.")

		saynn("[say=pc]I’m not done with you.[/say]")

		saynn("[say=kait]F-fuck off-f..[/say]")

		saynn("That attitude just won’t do, you grab the girl by the shoulder and forcibly uncurl her, causing her to hiss from the pain. Then you get a hold of her shorts and yank them off, exposing her black panties and causing more discomfort as the cloth brushes against the hurt knee, this girl is just so fragile. Yeah, your cock is getting harder from the excitement. Kait is trying to kick you off but one stomp on her bruised knee and she is back to sobbing and whining.")

		saynn("You get a hold of her panties and try to pull them down but she holds onto them like her life depends on it. Fine, you take the other route and yank them up, forcing the cloth to dig into her slit so hard that it makes her cry out from more pain. A few yanks and the cloth starts to break until her panties get torn off completely, exposing her pink pussy that clearly saw some abuse already. Kait rolls around on the floor and swears at you until you suddenly shove what left of her panties into her mouth and forcibly close her jaw.")

		saynn("[say=pc]If you spew these out, prepare to lose some teeth.[/say]")

		saynn("Kait doesn’t even care to react anymore, her expression is a mix of agony and desperation, little tears slide down her cheeks. At least the panties work well at muffling her cries.")

		saynn("Seeing that pussy now totally exposed makes you so horny. You won against that bitch, you deserve the right to fuck her in any way you want, who cares if the slut decided to make it harder for herself by resisting. You grab her by the collar and start pulling up, trying to make the girl get up. That is met with her wincing and making more muffled grunts, she flinches each time she tries to put her half-broken leg on the floor.")

		saynn("But you don’t care, you pull her up and then force her face against the fence, bending her body forward and supporting her by having your free arm on her juicy tits. She is completely helpless, looking somewhere above the crowd with her spaced out eyes, only letting out a muffled noise when something in her battered body hurts. You don’t waste any time and direct your {pc.cock} down her dry cunt before bucking your hips forward and forcing yourself inside her. More tears slide down her cheeks, she is arching her back and letting out a muffled moan. Her kitty is tight, inner walls seem to be clenching every time she experiences a spike of pain. The crowd is wild, everyone is cheering for you to breed the bitch.")

		saynn("Kait’s legs are shaking, she gets a grasp on the fence before her and just lets it happen. You tightly squeeze one of her tits, leaving a bruise, while thrusting deep inside. Her inner walls were mostly dry so fucking her was hard and painful but Kait’s body slowly starts to betray her, detecting the unwilling intercourse that is happening and getting her penetrated slit prepared.")

		saynn("Her white fluffy tail is wagging like hell, you get a hold of it and wrap it around your hand, using it as a leash, pulling the girl’s ass back to shove your cock deeper, its tip already ramming her cervix, causing more muffled cries. The crowd joins too, they sneak their hands through the holes in the fences and start groping the poor girl, fondling her exposed breasts and caressing her girly hips while you keep abusing her slutty cunt. Your hand moves from squeezing her breasts to holding her throat, applying extra pressure to make breathing next to impossible.")

		addButton("Inside", "Stuff Kait’s womb", "inside")
		addButton("Pull out", "You changed your mind", "pull_out")

	if(state == "inside"):
		playAnimation(StageScene.SexStanding, "fast", {
			pc="pc", npc="kait", 
			pcCum=true, npcCum=true,
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true},
		})
		
		# (if not pregnant)
		if(!getCharacter("kait").isVisiblyPregnant()):
			saynn("[say=pc]Hope you are ready to be bred, whore.[/say]")

		# (if pregnant)
		else:
			saynn("[say=pc]Here is another load for your cunt.[/say]")

		saynn("While you’re choking Kait, her cunt is clenching so hard around your shaft that you feel like you’re about to cum. And you give in to that feeling, you shove your {pc.cock} balls-deep, breaking through her cervix and proceeding to stuff her womb full of your {pc.cum} as the orgasm overtakes your whole body. The poor kitty squirms and shakes under you as her cunt is getting pumped full of your sticky stuff, her tired eyes roll up, she looks like she is about to lose consciousness.")

		saynn("You wait until her slit is properly bred before pulling your messy cock out and wasting the last waves of {pc.cum} by covering her ass and back. Then you finally stop choking her, letting her slowly slide down the fence and spit out her ruined panties as she is coughing for air. Her used cunt is leaking {pc.cum} onto the floor, the crowd keeps fondling and playing with the kneeling slut, preventing her from flopping onto the ground. The view is nice and messy, just like you wanted.")

		saynn("You put your cock away and offer the snow leopard a sarcastic pat on the head. Then you crouch near her and give her scritches under her chin. Kait looks broken, just sobbing quietly and hissing when something hurts, she gives up resisting unknown touches and just holds her paws on her chest and knee.")

		saynn("[say=pc]Next time just spread your legs, whore.[/say]")

		saynn("Kait glances at you for a second and then tilts her head down. You stand up and climb over the fence, leaving her alone with the crowd and many injuries, both external and internal.")

		# (scene ends)
		addButton("Continue", "Time to leave", "endthescene")


	if(state == "pull_out"):
		playAnimation(StageScene.SexStanding, "tease", {
			pc="pc", npc="kait", 
			pcCum=true,
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true},
		})
		
		saynn("While you’re choking Kait, her cunt is clenching so hard around your shaft that you feel like you’re about to cum. But you decide not to ruin her womb too and pull your cock out the moment you get over the peak. Your {pc.cock} starts throbbing and a second later a strong string of {pc.cum} emerges from its tip, landing on Kait’s butt. Then another. And another. The poor kitty squirms and shakes as her butt, tail and thighs become all messy, her tired eyes roll up, she looks like she is about to lose consciousness.")

		saynn("You wait until the last string of your {pc.cum} lands on Kait before you finally stop choking her, letting her slowly slide down the fence and spit out her ruined panties as she is coughing for air. Her stretched cunt is pulsating and slowly closes up, the crowd keeps fondling and playing with the kneeling slut, preventing her from flopping onto the ground. The view is nice and messy, just like you wanted.")

		saynn("You put your cock away and offer the snow leopard a sarcastic pat on the head. Then you crouch near her and give her scritches under her chin. Kait looks broken, just sobbing quietly and hissing when something hurts, she gives up resisting unknown touches and just holds her paws on her chest and knee.")

		saynn("[say=pc]Next time just spread your legs, whore.[/say]")

		saynn("Kait glances at you for a second and then tilts her head down. You stand up and climb over the fence, leaving her alone with the crowd and many injuries, both external and internal.")

		# (scene ends)

		addButton("Continue", "Time to leave", "endthescene")


func _react(_action: String, _args):
	if(_action == "piss_on_her"):
		getCharacter("kait").pissedOnBy("pc")
	
	if(_action == "inside"):
		getCharacter("kait").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("kait")
		GM.pc.addSkillExperience(Skill.SexSlave, 50, "kait_roughfuck")
	
	if(_action == "pull_out"):
		GM.pc.orgasmFrom("kait")
		GM.pc.addSkillExperience(Skill.SexSlave, 50, "kait_roughfuck")
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

