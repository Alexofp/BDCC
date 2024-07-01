extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "TaviTalkScene"

func _reactInit():
	if(GM.ES.triggerReact(Trigger.TalkingToNPC, ["tavi"])):
		endScene()
		return

func _run():
	if(state == ""):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		
	if(state == ""):
		if(getModuleFlag("TaviModule", "Tavi_IsAngryAtPlayer")):
			saynn("You approach the tall feline that stands in the dimly lit space. Her face doesn’t show much emotion but you can tell that she is not happy. She glares at you with her mean eyes.")

			saynn("[say=tavi]The fuck do you want?[/say]")
		else:
			saynn("You walk up to Tavi, she seems to be sitting on some piece of machinery.")

			saynn("[say=pc]Miss Tavi?[/say]")

			saynn("She listens to you and smiles.")

			saynn("[say=tavi]Yes, my personal pet?[/say]")

		addButton("Talk", "Pick a topic to talk about", "talk")
		addButton("Appearance", "Take a closer look at Tavi", "appearance")
		addButton("Attack", "This can only go one way", "attack")
		if(getModuleFlag("TaviModule", "Tavi_IsAngryAtPlayer")):
			var day = getModuleFlag("TaviModule", "Tavi_AngryUntilDay", -10)
			if(GM.main.getDays() >= day):
				addButton("Submit", "Try and patch things up", "submit")
			else:
				addDisabledButton("Submit", "Tavi is still angry at you, try again in a day or two")
		else:
			# Player is friendly towards Tavi
			
			addButton("Punish me", "Ask Tavi to punish you", "askForPunishment")
			
			if(!getModuleFlag("TaviModule", "Tavi_ToldHowToEscape")):
				addButton("Plot to escape", "Tavi mentioned she can help you to escape", "plot_to_escape")
			
			if(getModuleFlag("TaviModule", "Tavi_NeedsApple") && !getModuleFlag("TaviModule", "Tavi_GotApple")):
				if(GM.pc.getInventory().hasItemID("appleitem")):
					addButton("Give apple", "Tavi wants an apple", "give_apple")
				else:
					addDisabledButton("Give apple", "You don't have one")
					
			if(GM.QS.isCompleted("TaviAppleQuest") && !getModuleFlag("TaviModule", "Tavi_Quest2Started", false)):
				addButton("What now", "Ask Tavi what now", "quest2start")
		
		addButton("Leave", "Do something else", "endthescene")
		GM.ES.triggerRun(Trigger.TalkingToNPC, ["tavi"])
		
	if(state == "appearance"):
		saynn("You see a very tall feline, about 2 meters high. Her most unique thing is her fur, it’s of a strange purple color bundled together with bright green spots and lines, which make her very visible in the dark, purple of her belly and maw areas are more light than the rest. She has side swept hair, length is medium, barely reaching her shoulder. The hair is purple as well with a few hair strands behind green. Her eyes are different in color, right one is red and left is green. You can see that the inside of her ears, mouth and tongue are all toxic-green, meaning that that’s the color of her flesh and blood. She seems pretty fit but you don’t spot any pronounced muscles, looks like most of her strength is focused in her legs, the femine hips look curvy. Behind her is a normal feline tail.")

		saynn("From what you can tell, her breasts are about D cup size but they don’t look that big considering her height. Her nipples spot that bright green color of her flesh, very exotic.")

		saynn("Between her legs is her pussy. The shape looks tight, it’s fair to assume this lady doesn’t do much fucking and managed to avoid the fate of becoming a sex toy like some inmates.")
		
		addButton("Back", "Go back", "")
		
	if(state == "attack"):
		if(!getModuleFlag("TaviModule", "Tavi_IsAngryAtPlayer")):
			saynn("[say=pc]I’m sick of being your slave, this ends now.[/say]")

			saynn("Tavi tilts her head at you and stands up.")

			saynn("[say=tavi]Really now? Someone finally grew a spine? I will make sure to snap it in half[/say]")

			saynn("Seems like it’s a fight")
		else:
			saynn("[say=pc]I’m here to beat you up.[/say]")

			saynn("Tavi cracks her knuckles and stretches slightly.")

			saynn("[say=tavi]Well.. It was a huge mistake and I will prove it[/say]")

			saynn("Seems like it’s a fight")
			
		addButton("Continue", "Fight!", "startfight")
	
	if(state == "won_fight"):
		TaviModule.makeTaviAngry()
		
		saynn("Defeated Tavi has collapsed onto the floor. She hisses and glares at you.")

		saynn("[say=tavi]What now, silly thing?[/say]")
		
	if(state == "won_fight_lust"):
		TaviModule.makeTaviAngry()
		
		saynn("Defeated Tavi has collapsed onto the floor, you see a slight green blush on her cheeks that she tries to hide.")

		saynn("[say=tavi]What are you gonna do with me now, silly thing..[/say]")
		
	if(state == "won_fight" || state == "won_fight_lust"):
		addButtonWithChecks("Dominate Tavi", "Make that bitch submit to you using violence", "dominateTavi", [], [ButtonChecks.NotHandsBlocked])
		if(getModuleFlag("TaviModule", "Tavi_Submissiveness", 0) >= 1):
			addButtonWithChecks("Degrade Tavi", "Force her to act like a puppy", "degradeTavi", [], [ButtonChecks.NotHandsBlocked])
		else:
			addDisabledButton("Degrade Tavi", "Tavi needs to be at least a little bit obedient")
		addDisabledButton("Fuck Tavi", "Not done :(")
		
		addButton("Continue", "Let her be", "endthescene")
	
	if(state == "lost_fight"):
		saynn("You drop onto your knees, lacking any strength to continue.")

		saynn("[say=tavi]Such a silly thing you are, did you really think you could win?. Guess it’s time to punish you.[/say]")

		addButton("Continue", "Oh no", "startrandompunishment")
	
	#if(state == "submit"):
	#	saynn("((SUBMITTING SCENE GOES HERE))")
		
	#	addButton("Continue", "You are forgiven", "endthescene")
	
	if(state == "talk"):
		if(getModuleFlag("TaviModule", "Tavi_IsAngryAtPlayer")):
			saynn("[say=pc]Can we talk?[/say]")

			saynn("She growls at your weak attempt to communicate, her hands are forming fists, her voice sounds strict and annoyed.")

			saynn("[say=tavi]You made your choice, I made mine. Don’t fucking waste my time.[/say]")
			
			addButton("Continue", "Well, you tried", "")
		else:
			saynn("[say=pc]Hey, can I ask you something?[/say]")

			saynn("Tavi lets out a little chuckle.")

			saynn("[say=tavi]You can try.[/say]")
			
			addButton("Fur", "Ask about her fur", "fur")
			addButton("How she got caught", "Ask Tavi how she got arrested", "how_she_got_caught")
			addButton("Why is she here", "Ask why is she sitting here", "why_is_she_here")
			addButton("Back", "Go back", "")

	if(state == "fur"):
		saynn("[say=pc]Why do you look like that?[/say]")

		saynn("Tavi keeps herself silent for a second, gathering her thoughts.")

		saynn("[say=tavi]Well I didn’t choose it if that’s what you’re asking. It’s a result of many genetic modifications.[/say]")

		saynn("She looks at her paw, at her digits, then wiggles them a bit before looking back at you.")

		saynn("[say=tavi]I was born in a lab. I don’t have a father or a mother, I’m basically a clone with random dna. That’s why. Satisfying enough?[/say]")

		saynn("You hum to yourself, trying to comprehend that. Lab-made feline, huh.")

		saynn("[say=pc]But what was the point? If you’re here then that means something went horribly wrong[/say]")

		saynn("Tavi chuckles and gives you a pat.")

		saynn("[say=tavi]If I’m gonna tell you that, the next day I will probably be spaced.[/say]")

		saynn("[say=pc]You don’t trust me?[/say]")

		saynn("Tavi hears your question and puts on a cunning smile.")

		saynn("[say=tavi]I trust you cutie. But some people know how to extract information even if you don’t plan on sharing. Let’s just say that it went better than they expected.[/say]")

		addButton("Back", "Go back", "talk")

	if(state == "how_she_got_caught"):
		saynn("[say=pc]How did you get caught?[/say]")

		saynn("[say=tavi]Everything was going too well. Got careless. Got caught. That’s about it.[/say]")

		saynn("[say=pc]What was going too well?[/say]")

		saynn("Tavi scritches you under the chin.")

		saynn("[say=tavi]I’m a hacker, I exploit the weakest link in any system - people. But you know, I’m a person too.[/say]")

		saynn("You can guess that Tavi was doing her criminal activities over the galactic-wide web and got caught eventually.")

		saynn("[say=pc]You don’t share much[/say]")

		saynn("[say=tavi]Information is the most valuable thing in today’s world, sweetie.[/say]")

		saynn("Seems like there is more to uncover but she just doesn’t want to share.")

		addButton("Back", "Go back", "talk")

	if(state == "why_is_she_here"):
		saynn("[say=pc]Why are you sitting here, away from everybody?[/say]")

		saynn("Tavi shrugs, it seems like the question caught her off guard.")

		saynn("[say=tavi]I don’t like crowds. I always worked alone. And you better stop asking those silly questions[/say]")

		saynn("She gives your butt a soft smack.")

		addButton("Back", "Go back", "talk")

	if(state == "plot_to_escape"):
		# (triggers once)
		setModuleFlag("TaviModule", "Tavi_ToldHowToEscape", true)
		setModuleFlag("TaviModule", "Tavi_NeedsApple", true)
		addMessage("You got a new task")

		saynn("You take a seat on one of the empty ore crates.")

		saynn("[say=pc]So.. About the whole escape thing. You think it's possible?[/say]")

		saynn("Tavi shifts closer to you and switches to a more quiet voice.")

		saynn("[say=tavi]Mmmh~ Someone is eager to help me, huh[/say]")

		saynn("[say=pc]Weighing out the options. What are you gonna do about the collar? Can’t they just fry your neck remotely[/say]")

		saynn("You tug on yours, it’s as tight as ever, always reminding you of its existence.")

		saynn("[say=tavi]If there is only one solution then it’s the right solution. We just make the captain take them off[/say]")

		saynn("Tavi watches your surprised face.")

		saynn("[say=pc]And how do you plan on doing that? Begging on your knees?[/say]")

		saynn("She chuckles and grabs you by the chin.")

		saynn("[say=tavi]Naah~. That’s your job, sweetie. I bet the captain is not as strong as he thinks he is. Given the right.. motivation.. he will let collars from just two inmates slip off[/say]")

		saynn("Tavi gently caresses your chin while trying to make eye contact with you.")

		saynn("[say=pc]Maybe.. But what's then.. Transport shuttles can’t even do an ftl jump, the big ship is just gonna destroy us.[/say]")

		saynn("[say=tavi]All I need is a computer with access to extranet~ I know people that would be very happy to know the coordinates of this station, in exchange for pulling us out. It’s all about information and the right people, cutie. Look at me.[/say]")

		saynn("She holds your head with her paws and forces eye contact. Little smirk can be seen on her face as she drills you with her gaze.")

		saynn("[say=tavi]Forget about it for now. I’m trusting you with a lot right now, as you can see. And I trust you to stay shush-shush if they are gonna ask. Sure you can handle it?[/say]")

		saynn("You nod subtly. Tavi tilts her head, her paws shift slightly, giving you scritches behind the ears. You can’t help but let out a cute noise from the pleasure. Her voice suddenly switches from soft to strict.")

		saynn("[say=tavi]Find me an apple, I’m hungry.[/say]")

		saynn("[say=pc]Um..[/say]")

		saynn("[say=tavi]Something is wrong, pet?[/say]")

		saynn("You shake your head, Tavi pulls her paws away. You stand up and look around.")

		saynn("[say=tavi]They grow them in the greenhouses. Consider this your test.[/say]")

		saynn("[say=pc]Yes, Miss..[/say]")

		addButton("Continue", "Continue on your way", "endthescene")


	if(state == "give_apple"):
		saynn("You walk up to Tavi and offer her the shiny apple.")

		saynn("[say=pc]Here, Miss, like you wanted[/say]")

		saynn("She grabs it, holds it, even breathes on it but then gives it back.")

		saynn("[say=tavi]Good. Keep it. Bet you went through some things to get it.[/say]")

		saynn("Her words leave you confused. She watches your reaction with great interest.")

		saynn("[say=pc]But..[/say]")

		saynn("[say=tavi]Kneel before me, little pet[/say]")

		saynn("You do as she says, slowly lowering yourself onto your knees. She leans down and caresses your cheek, sliding a paw across one. Then she pulls you closer and gives you a sudden quick kiss on the lips. Light blush shows up on your face.")

		saynn("[say=tavi]You wanna be a good pet, right?[/say]")

		saynn("You nod and blush harder.")

		saynn("[say=tavi]Say it[/say]")

		saynn("[say=pc]I wanna be a good pet for my Miss..[/say]")

		if(GM.pc.getGender() == Gender.Male):
			saynn("[say=tavi]Good boy~. Keep the apple.[/say]")
		else:
			saynn("[say=tavi]Good girl~. Keep the apple.[/say]")

		saynn("[say=pc]Thank you, Miss..[/say]")

		addButton("Continue", "Continue on your way", "endthescene")
		
	if(state == "askForPunishment"):
		saynn("You sit on your knees and nuzzle Tavi's legs")
		
		saynn("[say=pc]Can you punish me, Miss Tavi?[/say]")
		
		saynn("[say=tavi]Why would I punish my cutie[/say]")
		
		saynn("[say=pc]For all the bad things I did.[/say]")
		
		saynn("[say=tavi]Hmm[/say]")
		
		addButton("Continue", "See what happens", "startrandompunishment")
		

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "startfight"):
		runScene("FightScene", ["tavi"], "tavifight")
	
	if(_action == "give_apple"):
		addExperienceToPlayer(50)
		setModuleFlag("TaviModule", "Tavi_GotApple", true)
	
	if(_action == "submit"):
		#setModuleFlag("TaviModule", "Tavi_IsAngryAtPlayer", false)
		runScene("TaviSubmitToScene")
		endScene()
		return
	
	if(_action == "startrandompunishment"):
		runScene(TaviModule.getPunishmentScene())
		endScene()
		return
		
	if(_action == "dominateTavi"):
		runScene("DominateTaviScene")
		endScene()
		return
		
	if(_action == "degradeTavi"):
		runScene("DegradeTaviScene")
		endScene()
		return
		
	if(_action == "quest2start"):
		runScene("TaviQuest2Start")
		endScene()
		return
	
	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "tavifight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		var wonHow = _result[1]
		
		if(battlestate == "win"):
			if(wonHow == "lust"):
				setState("won_fight_lust")
			else:
				setState("won_fight")
			addExperienceToPlayer(20)
		else:
			setState("lost_fight")
			addExperienceToPlayer(5)
