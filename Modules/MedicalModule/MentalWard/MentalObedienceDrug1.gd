extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "MentalObedienceDrug1"

func _run():
	if(state == ""):
		addCharacter("eliza")
		
	if(state == ""):
		saynn("You hear the door of your cell screeching as its mechanical parts move. It opens and a familiar figure walks in.")

		saynn("[say=eliza]Wanna do something? I know you do.[/say]")

		saynn("She pulls out a leash and clicks it to your collar, you can’t resist much. She offers you some help getting up by tugging on the leash, inviting you to follow or be choked otherwise.")

		addButton("Follow", "See where she brings you", "follow")

	if(state == "follow"):
		aimCamera("med_researchlab")
		setLocationName("Research lab")
		playAnimation(StageScene.Solo, "sit")
		
		saynn("You walk through some white corridors, all the staff here is clearly used to seeing bound and leashed inmates being passed around, though some nurses do look into your eyes, maybe trying to figure out how broken you are mentally.")

		saynn("You enter a room that is clearly a lab, you notice a few hi-tech machines, the purpose of which you don’t understand and a special table in the middle.")

		saynn("[say=eliza]Take a seat while I prepare.[/say]")

		saynn("Eliza chains your collar to the table, short length so you can’t reach far, even if your hands weren’t bound. You sit on the cold table and await your faith.")

		saynn("[say=pc]What are you gonna do?[/say]")

		saynn("Doctor takes a quick look at you, her hand ruffles your hair and then fixes it back.")

		saynn("[say=eliza]You know, I don’t really wanna tell you. But it’s a drug with pretty unique properties. Not transformative ones, no.[/say]")

		saynn("Eliza moves to her chemistry table, puts on her respirator mask and latex gloves and begins working. She takes a few strange plants and flowers, mushes them together, adds together with some liquid to the beaker and starts heating it up. She seems to be busy with preparing a drug, not looking much at you.")

		addButton("Sit still", "See what happens next", "sit_still")

	if(state == "sit_still"):
		saynn("[say=eliza]If I’ve done everything correctly this should be interesting.[/say]")

		saynn("She filters the result into another beaker and lets it cool down. Then she fills a syringe full of it and walks up to you.")

		saynn("[say=pc]You gonna drug me?[/say]")

		saynn("You hear the doctor’s chuckle through the mask.")

		saynn("[say=eliza]That’s a very narrow observation. I’m gonna do a science experiment. An experiment that can potentially lead to new breakthroughs in the chemistry field. Who knows how many lives this might save. And you are helping me. But your words are correct.[/say]")

		saynn("She disinfects a spot on your neck and carefully guides the syringe closer to it.")

		saynn("[say=pc]I didn’t exactly have a choice.[/say]")

		saynn("[say=eliza]You made many choices, inmate, that’s why you’re here. Now don’t move, I don’t wanna kill you by accident.[/say]")

		addButton("Sit still", "Let her inject you", "sit_still1")

	if(state == "sit_still1"):
		saynn("You tilt your head to the side, giving Eliza more access to your neck. She carefully injects you, the sharp needle penetrates your skin with ease, an unknown drug is being pushed into your bloodstream. You don’t feel much apart from some pain and the tension.")

		saynn("Eliza slowly withdraws the syringe and tosses it into the special trash bin. She takes off her mask and the gloves, giving her full attention to you. You don’t feel very different, just slightly more warm.")

		saynn("[say=pc]I feel warm.[/say]")

		saynn("[say=eliza]Normal reaction, that’s how your body reacts to foreign elements in your blood.[/say]")

		saynn("[say=pc]So what was it?[/say]")

		saynn("[say=eliza]Special psychotropic drug, a kind of drug that can affect your mood or behavior.[/say]")

		saynn("[say=pc]And why is this one special?[/say]")

		saynn("Eliza leans down to you and chuckles. You would think that the effects would already be obvious but you don’t feel any different. Though the warm feeling is gone too.")

		saynn("[say=eliza]Let's try. Inmate, I want you to bark. Right now.[/say]")

		saynn("Such a strange request at this time can only produce a negative reaction out of you. You were about to shake your head and tell her something mean when suddenly.. pain! A strong headache breaks out in your head, you can’t help but to wince and grunt. Eliza notices it and puts her hand on your cheek, gently caressing it. Her voice is cunning but strict.")

		saynn("[say=eliza]I want you to bark, inmate.[/say]")

		saynn("The more you think about it, the more you try to resist, to push that thought away, the more little pain spikes appear in your head.")

		addButton("Obey", "Why not just obey and make it stop..", "obey")
		addButton("Resist", "You can’t just give up, you must resist. Sanity-", "resist")

	if(state == "resist"):
		saynn("You grunt and hiss, your whole body wiggles, tilts, trying to shake that hand off.")

		saynn("[say=pc]W-why..[/say]")

		saynn("Her voice becomes so much softer, she keeps caressing your cheeks, trying to calm you down.")

		saynn("[say=eliza]You’re going through so much suffering just so you can resist this. But why. It’s your body that wants it. Just listen to it. It knows what’s best. It will feel good, I promise.[/say]")

		saynn("[say=pc]N-n-..o..[/say]")

		saynn("The pain is unbearable, each time you try to fight it just punishes you with more and more pain, you feel like you’re about to break. You really want to just curl up and wait for it to pass.")

		addButton("Obey", "Why not just obey and make it stop..", "obey")

	if(state == "obey"):
		saynn("[say=pc]W-wuff..[/say]")

		saynn("The moment you say that is the moment that the pain goes away. Completely. Instead it is replaced.. by something else. You feel light. Eliza takes a note.")

		saynn("[say=eliza]Again. I want you to bark like a happy dog.[/say]")

		saynn("And you do. You open your mouth and begin making dog noises, barking, whining and howling, wiggling your butt for Eliza. And it.. makes you feel good. Something is seriously wrong but you don’t care, you show her a happy dog and bark for her, because you really want to. Eliza pats you on the head.")

		saynn("[say=eliza]Feels nice, right? Isn’t the brain a funny thing. You trick it with some chemicals and it makes you do something you don’t even like or want. And you love every second of it.[/say]")

		saynn("She starts unlocking your straitjacket and takes it off, leaving you naked. You cover yourself.")

		saynn("[say=eliza]Don’t feel ashamed, I wanna look at you. And call me Mistress.[/say]")

		saynn("[say=pc]Yes.. Mistress..[/say]")

		saynn("You pull your hands away, leaving them rest by your sides. Obeying seems to be so.. arousing. You blush and moan softly for your Mistress.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("You can feel your slit becoming more wet the longer Eliza stares at it. She traces a digit around your pussy lips and then licks it.")

			saynn("[say=eliza]Spread them~. Hands behind your back.[/say]")

			saynn("You do as she orders, hiding your hands and exposing your needy slit for her, you don’t even think about misbehaving anymore. Eliza gets more of your arousal onto her digits, then spreading your petals and thrusting two fingers inside, forcing a moan out of you.")

			saynn("[say=eliza]Your brain quickly rewired itself, it wants all the pleasure it can get. And it wants to avoid pain at all costs. That’s why you’re so subby and slutty. My adorable little slut~. Say it.[/say]")

			saynn("She starts pounding at your pleasure with full power, causing your cunt to make wet noises as you moan and squirm around her digits.")

			saynn("[say=pc]I’m your adorable little slut!.. Ow.. M-Mistress![/say]")

			saynn("Your brain quickly reacted to the uncomfortable feeling that returned and fixed the mistake. Eliza grabs your chin with her free hand and looks you into the eyes.")

			saynn("[say=eliza]Cum for me, slut. Cum a lot.[/say]")

			saynn("Your body wasn’t even that close but it pushed itself so it can obey, you suddenly feel a huge spike of pleasure flowing through you, a loud series of moans escapes your mouth as your cunt starts to pulsate and clench around doctor’s digits. Your whole body shivers as a powerful orgasm overwhelms you. And then another one. And another. Ecstatic waves hit you and cause your body to give up, your {pc.pussyStretch} pussy squirts girly juices, creating a puddle under you. Keeping your hands behind your back becomes impossible, you lean against Eliza while she keeps fingering you, clearly enjoying seeing you cum so much.")

			saynn("Fuck, you think you blanked there for a second.")

		# (if has reachable cock)
		elif(GM.pc.isWearingChastityCage()):
			saynn("You can feel your {pc.cock} trying to become harder while Eliza stares at you. She traces a digit along your cage and gives it a little rub.")
			
			saynn("[say=eliza]Spread your legs~. Hands behind your back, no touching.[/say]")
			
			saynn("You do as she orders, hiding your hands and giving her full access to your crotch, you don’t even think about misbehaving anymore. Eliza catches a drop of your precum and saves it for later. She then pushes on your chest slightly, forcing you to lean back and use your arms for support. She sneaks her lubed up digits down to your butt and forces them inside, making you moan..")
			
			saynn("[say=eliza]Your brain quickly rewired itself, it wants all the pleasure it can get. And it wants to avoid pain at all costs. That’s why you’re so subby and slutty. My adorable little slut~. Say it.[/say]")
			
			saynn("She starts fingering your anus, pressing on all the right spots, causing your rear hole to make wet noises as you moan and squirm around her digits. Your dick puts more and more pressure on your cage, you’re becoming desperate.")
			
			saynn("[say=pc]I’m your adorable little slut!.. Ow.. M-Mistress![/say]")
			
			saynn("Your brain quickly reacted to the uncomfortable feeling that returned and fixed the mistake. Eliza grabs your chin with her free hand and looks you into the eyes.")
			
			saynn("[say=eliza]Cum for me, slut. Cum a lot.[/say]")
			
			saynn("Your body wasn’t even that close but it pushed itself so it can obey, you suddenly feel a huge spike of pleasure flowing through you, a loud series of moans escapes your mouth as your {pc.cock} starts to pulsate. Your whole body shivers as a powerful orgasm overwhelms you. And then another one. And another. Ecstatic waves hit you and cause your body to give up, your {pc.analStretch} ring clenches around Eliza’s digits, you can barely support yourself with your arms while your throbbing dick starts shooting spurt after spurt of cum through the metal cage. Eliza stands to the side, as to not get messy, and keeps slowly fingering your ass. She giggles, clearly enjoying seeing you cum so much.")
			
			saynn("Fuck, you think you blanked there for a second.")
		
		elif(GM.pc.hasPenis()):
			saynn("You can feel your {pc.cock} becoming harder while Eliza stares at you. She traces a digit along your length and gives your tip a little rub.")

			saynn("[say=eliza]Spread your legs~. Hands behind your back, no touching.[/say]")

			saynn("You do as she orders, hiding your hands and giving her full access to your crotch, you don’t even think about misbehaving anymore. Eliza catches a drop of your precum and spreads it across your cock. She wraps her digits around it and gives it a firm stroke, forcing a moan out of you.")

			saynn("[say=eliza]Your brain quickly rewired itself, it wants all the pleasure it can get. And it wants to avoid pain at all costs. That’s why you’re so subby and eager. I see that you love this~. Say it.[/say]")

			saynn("She starts stroking your cock at a quick pace, making your breath deep and fast, little noises of pleasure escape from your mouth.")

			saynn("[say=pc]I really like your touch!.. Ow.. Your touch, Mistress[/say]")

			saynn("Your brain quickly reacted to the uncomfortable feeling that returned and fixed the mistake. Eliza grabs your chin with her free hand and looks you into the eyes.")

			saynn("[say=eliza]Cum for me, slut. Cum a lot.[/say]")

			saynn("Your body wasn’t even that close but it pushed itself so it can obey, you suddenly feel a huge spike of pleasure flowing through you, a loud series of moans escapes your mouth as your {pc.cock} starts to throb and pulsate. Your whole body shivers as a powerful orgasm overwhelms you. And then another one. And another. Ecstatic waves hit you and cause your body to give up, your throbbing dick starts shooting spurt after spurt of {pc.cum}. Eliza stands to the side, as to not get messy, and keeps slowly stroking your cock. Keeping your hands behind your back becomes impossible, you lean against Eliza while she giggles, clearly enjoying seeing you cum so much.")

			saynn("Fuck, you think you blanked there for a second.")

		# (else)
		else:
			saynn("[say=eliza]Aw, you don’t have anything I can touch. But still, spread your legs and raise them~. Hands behind back.[/say]")

			saynn("You do as she orders, hiding your hands and giving her full access to your crotch, you don’t even think about misbehaving anymore. Eliza pushes on your chest slightly, forcing you to lean back and use your arms for support. She then sneaks a few digits down to your butt and forces them inside, making you moan.")

			saynn("[say=eliza]Your brain quickly rewired itself, it wants all the pleasure it can get. And it wants to avoid pain at all costs. That’s why you’re so subby and slutty. My adorable little slut~. Say it.[/say]")

			saynn("She starts fingering your anus, pressing on all the right spots, causing your rear hole to make wet noises as you moan and squirm around her digits.")

			saynn("[say=pc]I’m your adorable little slut!.. Ow.. M-Mistress![/say]")

			saynn("Your brain quickly reacted to the uncomfortable feeling that returned and fixed the mistake. Eliza grabs your chin with her free hand and looks you into the eyes.")

			saynn("[say=eliza]Cum for me, slut. Cum a lot.[/say]")

			saynn("Your body wasn’t even that close but it pushed itself so it can obey, you suddenly feel a huge spike of pleasure flowing through you, a loud series of moans escapes your mouth. Your whole body shivers as a powerful orgasm overwhelms you. And then another one. And another. Ecstatic waves hit you and cause your body to give up, your {pc.analStretch} ring clenches around Eliza’s digits, you can barely support yourself with your arms.")

			saynn("Fuck, you think you blanked there for a second.")

		addButton("Continue", "Wow", "continue")

	if(state == "continue"):
		saynn("Eliza scritches you behind the ear.")

		saynn("[say=eliza]You know, if I’d order you to clean up here with your tongue you’d do it~. But you know, too unsanitary. Now help me get this back on you.[/say]")

		saynn("You feel very satisfied but the drug still seems to be working, the painful sensations prevent you from disobeying, you put your hands into the sleeves of the latex straitjacket and let Eliza lock it on you.")

		saynn("[say=eliza]I’d be very careful, the drug will keep you obedient for a few more hours until it’s fully out of your blood~. But you’ve been very useful, the data that got collected is incredibly valuable.[/say]")

		saynn("[say=pc]Thank you, Mistress..[/say]")

		saynn("[say=eliza]Don’t mention it. We might continue this research another time~[/say]")

		saynn("Eliza grabs your leash and leads you back to your padded cell.")

		# (scene ends)
		
		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "follow"):
		runScene("ParadedOnALeashScene", ["eliza", GM.pc.getLocation(), "med_researchlab", [
			"Almost there, patient",
			"Today's experiment should be interesting",
			"Smile to the nurses",
		]])
	
	if(_action == "resist"):
		GM.pc.addPain(30)
		MedicalModule.addPCSanity(-0.1)
		MedicalModule.addPCBehavior(-0.1)
	
	if(_action == "obey"):
		MedicalModule.addPCBehavior(0.1)
		GM.pc.orgasmFrom("eliza")
		GM.pc.addSkillExperience(Skill.SexSlave, 20)
		GM.pc.addCredits(1)
		addMessage("You received 1 work credit!")
		
		setModuleFlag("MedicalModule", "Mental_ExpObeyDrug", Util.maxi(1, getModuleFlag("MedicalModule", "Mental_ExpObeyDrug", 0)))

	if(_action == "endthescene"):
		endScene()
		return

	
	setState(_action)

func getDevCommentary():
	return "Obedience drug. Probably the most generic drug that a horny person can come up with x3. I know at least one lewd movie that has it.. well, a form of it.\n\nBut basically I tried to ground it in reality somewhat, explain why it works. Humans are simple really, we do what we wanna do and avoid doing what we don't wanna do x3. I know, shocking. But just because its obvious it doesn't mean that its wrong. So the point it.. if any action is met with pain, we will try to avoid doing that action ^^. And what if that 'action' is a 'disobey' action.. x3"

func hasDevCommentary():
	return true
