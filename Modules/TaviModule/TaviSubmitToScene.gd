extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "TaviSubmitToScene"

func _run():
	if(state == ""):
		addCharacter("tavi")

	if(state == ""):
		saynn("You decide that you wanna try and get on Tavi’s good side. You approach the tall feline, her eyes burn with hatred.")

		saynn("[say=pc]What can I do to make you not hate me?[/say]")

		saynn("You can hear her growling like she is about to lash out at you.")

		saynn("[say=tavi]Breath the outside air[/say]")

		saynn("Seems like it won’t be that easy.")

		addButton("Give up", "It’s not worth it", "give_up")
		
		if(!GM.pc.isGagged()):
			addButton("Get on your knees", "Try harder, this will involve feet and a lot of humiliation", "get_on_your_knees")
		else:
			addDisabledButton("Get on your knees", "You need your mouth to be free for this")

	if(state == "give_up"):
		saynn("You sigh and leave the feline alone. She only seems glad you did that.")

		addButton("Continue", "Huff..", "endthescene")

	if(state == "get_on_your_knees"):
		playAnimation(StageScene.SexFeetPlay, "head", {
			pc="tavi", npc="pc", 
			bodyState={},
			npcBodyState={hard=true,},
		})
		
		saynn("You get on your knees and crawl up at her, she carefully watches to make sure you’re not doing anything stupid. She still sits on some machine and crosses her legs. You get a good look at her animal toes and soft pads underneath each, they have the same bright green color as her fur markings.")

		saynn("[say=pc]You can do whatever you want with me..[/say]")

		saynn("[say=tavi]Like sending you straight to medbay?[/say]")

		saynn("You tilt your head down and attempt to nuzzle her leg. She pushes you away.")

		saynn("[say=pc]If that’s what you want.. Miss..[/say]")

		saynn("She huffs and looks away. A few seconds of complete silence. Tavi grinds her teeth, her voice is strict.")

		saynn("[say=tavi]You expect me to just forget everything you did?[/say]")

		saynn("You shrug and rest your chin on her legs. She glances at the adorable display you’re trying to achieve and sighs. She pushes you back but then shoves her foot into your face, her toe beans rubbing against your nose, lips and cheeks. Tavi directs her attention back to you.")

		saynn("[say=tavi]Lick.[/say]")

		saynn("You swiftly stick your tongue out and slide it around all the green toe pads while also nuzzling. Feels humiliating to be someone’s toe licker but if that's the only way…")

		saynn("[say=tavi]Do it better.[/say]")

		saynn("You gently take a hold of her leg and support it while you give each bean a good lick. Then you thrust your tongue between each toe and lick there too. Blush appears on your face, it’s quite arousing. Tavi’s eyes are still mean but you can catch a subtle smirk.")

		saynn("She then pulls her leg away and pushes the second one in your face. You immediately start giving it the same treatment, gently massaging with your hands while your tongue traces around the toe pads and between the toes. Tavi’s grin widens.")

		saynn("[say=tavi]Good. You like doing that?[/say]")

		saynn("You nod eagerly and nuzzle the offered foot. Tavi leans forward and gives you a cold head pat.")

		saynn("[say=pc]Yes, Miss..[/say]")

		saynn("[say=tavi]it’s far from me forgiving you[/say]")

		saynn("You give Tavi a confused look. She smiles and suddenly pushes her leg into your chest, causing you to collapse back onto your back. Painful.")

		saynn("[say=pc]Ow..[/say]")

		saynn("Tavi stands up and stretches in your view. You stay on the floor and watch her come near your head. The tall feline glances down at you.")

		saynn("[say=tavi]Something is wrong?[/say]")

		saynn("You shake your head and Tavi smiles. Then she raises one of her legs and puts it on your face, her wet with your saliva green toe pads rubbing against your cheeks. You let out a cute squeak but let her do it, your hands land on her ankle and hold to it. Tavi licks her lips.")

		saynn("[say=tavi]That’s what I like to see, a submissive little cutie laying under my foot and enjoying {pc.himself}. Open your mouth for me[/say]")

		saynn("You do as she orders you and she sneaks a few of her toes inside.")

		saynn("[say=tavi]Suck~[/say]")

		saynn("You close your mouth around the toes and begin gently sucking on them, your tongue is doing its work too, licking the beans, probably creating a tickling sensation for Tavi. She chuckles and slightly wiggles her toes in your mouth. It's humiliating, degrading, but also so hot, your cheeks blush red, your submissive eyes show passion.")

		saynn("[say=tavi]Such a silly thing. A silly pet. I will give you another chance. Remember how you look right now the next time you will try to misbehave.[/say]")

		saynn("You nod. Tavi pulls her toes out of your mouth and rubs your saliva into your face, making you look like a subby mess.")
		
		addButton("End", "The humiliation..", "endthescene")
		if(GM.pc.hasReachablePenis() || GM.pc.hasReachableVagina()):
			addButton("I want more", "That amount of humiliation wasn’t enough", "i_want_more")
		else:
			addDisabledButton("I want more", "You need a pussy or reachable cock for this")

	if(state == "i_want_more"):
		playAnimation(StageScene.SexFeetPlay, "crotch", {
			pc="tavi", npc="pc", npcCum=true,
			bodyState={},
			npcBodyState={exposedCrotch=true,hard=true,},
		})
		
		if(!GM.pc.isFullyNaked()):
			saynn("But then she shifts her leg down to your crotch area, her foot rubs it and then sneaks under your clothing.")
		else:
			saynn("But then she shifts her leg down to your crotch, her foot spreads your legs and traces around your privates.")

		if(GM.pc.hasReachablePenis()):

			saynn("Your cock is hard, very hard, all that humiliation has really turned you on. Tavi’s foot presses your shaft into your abdomen and gives it a gentle foot massage. It feels weird but also pleasurable, you open your mouth and let out a little noise, then another, and another. Tall cat chuckles and continues, one of her toes finds the tip of your cock and rubs it specifically, making you squirm.")

			saynn("[say=tavi]So easy to keep cuties like you under control~[/say]")

			saynn("You leak pre and Tavi uses her foot to spread it around and then continues to stroke your shaft in such a strange way. But it feels good, you begin to breathe deeply, random shivers appear throughout your body, your cock throbs and twitches, you’re getting kinda close and Tavi feels it.")

			if(!GM.pc.isFullyNaked()):
				saynn("[say=tavi]Gonna leave a mess in your pants, huh~?[/say]")
			else:
				saynn("[say=tavi]Gonna leave a mess, huh~?[/say]")

			saynn("Tavi increases the pressure, her foot strokes your cock with a steady pace, her foot pads are rubbing against your sensitive flesh, you arch your back and squirm harder. It only takes a few more seconds before you let out a passionate moan and cum, your throbbing cock bursting with many spurts of sticky stuff, creating a huge mess, just like Tavi predicted. When you discharge into nothing, Tavi can only offer you a cunning grin, her foot was far away from your cock and didn’t get any cum on it.")

			saynn("[say=tavi]Very good~. Go clean yourself, cutie. Unless you like being messy, I can understand that too~[/say]")

		elif(GM.pc.hasReachableVagina()):
			saynn("You’re wet between your legs, very wet, all that humiliation has really turned you on. Tavi’s foot finds your sensitive petals and gently rubs them, it feels strange and weird but also kinda pleasurable, you can’t help but to open your mouth and let out a few cute noises. Tall cat chuckles and continues to do her thing, one of her toes finds your clit and rubs it from side to side, making you squirm.")

			saynn("[say=tavi]You like it, huh? I see that you do~[/say]")

			saynn("Your pussy leaks more of your female juices, Tavi uses her foot to spread it around your crotch and then resumes rubbing you further, pleasuring you in such a strange way. But it feels good, you breathe deeply and keep moaning for your miss, random shivers appear throughout your body, you’re getting kinda close and Tavi feels it.")

			if(!GM.pc.isFullyNaked()):
				saynn("[say=tavi]Gonna cum like that, with your pants, huh~?[/say]")
			else:
				saynn("[say=tavi]Gonna cum like that, huh~?[/say]")

			saynn("Tavi increases the pressure, her foot rubs your needy slit at a steady pace, the foot pads are rubbing against your sensitive flesh, you arch your back and squirm harder. It only takes a few more seconds before you let out a passionate moan and cum, your pulsating cunt bursting with your female juices, creating a huge mess, just like Tavi predicted. You sound and look like a quivering mess, a cunning grin flashes on Tavi’s face, she rubs her foot dry against your thighs and then pulls it away.")

			saynn("[say=tavi]Very good~. Go clean yourself, cutie. Unless you like being messy, I can understand that too~[/say]")

		addButton("Continue", "Even greater humiliation..", "endthescene")


		

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "get_on_your_knees"):
		setModuleFlag("TaviModule", "Tavi_IsAngryAtPlayer", false)
		setModuleFlag("TaviModule", "Tavi_Submissiveness", 0)
		processTime(60*10)
	
	if(_action == "i_want_more"):
		GM.main.addRoomMemoryCurrentLoc("You can still smell the scent of Tavi's juices here..", 2)
		processTime(60*10)
		if(GM.pc.hasReachablePenis()):
			GM.pc.orgasmFrom("tavi")
			GM.pc.cummedOnBy("pc", FluidSource.Penis)
		elif(GM.pc.hasReachableVagina()):
			GM.pc.orgasmFrom("tavi")
			GM.pc.cummedOnBy("pc", FluidSource.Vagina)
	
	setState(_action)

