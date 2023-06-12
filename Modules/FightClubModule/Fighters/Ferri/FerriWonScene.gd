extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "FerriWonScene"

func _run():
	if(state == ""):
		addCharacter("ferri")
		playAnimation(StageScene.Duo, "stand", {npc="ferri", npcAction="kneel"})

	if(state == ""):
		saynn("Ferri cries out and drops to her knees, she is clearly unable to continue fighting. You approach her and grab her by one of her horns. She is panting heavily but you do hear her growling.")

		saynn("[say=ferri]Let go!..[/say]")

		saynn("She grabs onto your hand but she is too weak to open it. You force her to shake her head and the growling becomes louder.")

		saynn("[say=pc]How about no? So much animal noises, are you someone’s pet?[/say]")

		saynn("She snarls and shows off her sharp fangs.")

		saynn("[say=ferri]I will bite you![/say]")

		addButton("Let her go", "You feel merciful", "let_her_go")
		addButton("Petplay", "Make that dracat act like a puppy", "petplay")
		GM.ES.triggerRun("ArenaFighterPCWon", ["ferri"])

	if(state == "let_her_go"):
		saynn("[say=pc]Fine, then I won’t do anything to you.[/say]")

		saynn("[say=ferri]Huh? Why? Wait. I mean! Good![/say]")

		saynn("The dracat seems very confused by your lack of actions. The crowd didn’t like your choice either, some are booing. Ferri is still snarling and trying to bite your hand that you use to hold her horn. Though, when you let go, the hybrid suddenly calms down and hides her fangs and claws.")

		saynn("You chuckle and head pat the girl once, causing her face to blush slightly. Then you get over the fence while being constantly watched by her. Time to go get your reward.")

		# (scene ends)
		addButton("Continue", "Time to leave", "endthescene")

	if(state == "petplay"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="ferri", npcAction="stand"})
		
		saynn("You keep the girl pinned to the floor while she keeps resisting and growling at you. Even after using her horns to shove her head into the floor she keeps snarling. The crowd cheers, some yell ‘Break the brat! Choke her! Does anyone have a muzzle?’.")

		saynn("[say=pc]If you wanna act like a spoiled pup I will treat you like one.[/say]")

		saynn("[say=ferri]No you won’t![/say]")

		saynn("You forcibly turn her over and wrench her arms behind her back, trying to avoid her scratching you. Ferri is still weak after losing her fight so you just about manage, the only problem was the tail that kept trying to whip you but you pinned that part too.")

		saynn("The dracat keeps squirming and trying to break free so you give her round butt a few smacks. That only made her more furious, she began trashing against you but the more extra swats her poor rear receivers the louder her whimpering is.")

		saynn("Suddenly someone in the audience says ‘Use this!’ and throws some duct tape over the fence. Ferri’s eyes open wide as she sees you reach for it.")

		saynn("[say=ferri]Don’t you dare![/say]")

		saynn("[say=pc]Behave, stupid pup.[/say]")

		saynn("[say=ferri]Fuck you![/say]")

		saynn("Well then, the way she said it sounded more like ‘Make me’. You grab the tape and decide to start with restraining her ability to bite. As you attempt to wrap it around her muzzle, she struggles and shakes her head a lot, fangs are out and trying to bite your hand.")

		saynn("[say=ferri]My fur![/say]")

		saynn("That sounds like a her problem. You roughly wrap the duct tape around her maw, creating a make-shift muzzle that forces her to keep her mouth shut. She tries to pierce the tape with her fangs but can’t, there is only enough leeway to stick the tongue out.")

		saynn("Then you forcefully bend her arms and wrap tape around each one, making it so her paws are touching the shoulders. The crowd laughs seeing how desperate the future pup looks and sounds, Ferri whimpers and wiggles but her resistance seems to slowly die down, only her tail sways and taps furiously against you.")

		saynn("You finish with the arms and then do a similar thing to her legs, bending them so the feet are touching the hips and then wrapping the remaining tape around them, finishing creating a cheap bitchsuit for the brat. Then you stand up and take a step back, curious about what Ferri will do.")

		saynn("[say=ferri]Hmmhphff–.. hmphf..[/say]")

		saynn("She tries to sit but her tied up limbs don’t allow for that, all she can do is propping her elbows and knees into the floor and pulling herself forward like that towards the nearest fence. Nah, that won’t do, you push your leg into the pup’s back and pin her to the floor before delivering another few smacks on her ass! Ferri whimpers while the audience giggles watching the pup in training.")

		saynn("[say=pc]Now you are helpless. So you better start behaving, pup. Mhm?[/say]")

		saynn("Ferri struggles to look at you but you do notice some sparks of submission in her eyes, she looks kinda sorry. You move your leg away and watch as the pup pushes her knees and elbows into the floor before raising onto all fours! You take a few steps back and get her attention.")

		saynn("[say=pc]To me, pup.[/say]")

		saynn("Ferri hears your order and obeys, slowly turning and then using her restrained limbs to crawl towards you at a snail’s pace. You see bright blush on her cheeks as the horny crowd blows up with screams like ‘Breed the bitch! Slut pup!’. Eventually Ferri manages to reach you, she tilts her head down and rests her chin on your foot, so cute.")

		saynn("You crouch before the pup and give her some headpats. As you do that, you notice her tail wagging happily.")

		saynn("[say=pc]Voice.[/say]")

		saynn("[say=ferri]wuff..[/say]")

		saynn("You smack the brat’s ass again, causing her to whimper some more.")

		saynn("[say=pc]Louder.[/say]")

		saynn("[say=ferri]Ruff! Wuff.. Arff?..[/say]")

		saynn("You do some scritches behind Ferri’s ear and she reacts by wiggling and purring quietly, such a different view from before.")

		saynn("[say=pc]Give paw.[/say]")

		saynn("And she does it, raising her elbow and offering it to you. You give it a shake and headpat the smart pup that seems to know all the tricks already.")

		saynn("[say=pc]You like walkies?[/say]")

		saynn("[say=ferri]R-ruff!..[/say]")

		saynn("You stand up straight and step away a bit from the pup. Then you tap on your {pc.masc} thighs, inviting the pup to follow. At first Ferri seems a bit reluctant but eventually she starts crawling towards you while swaying her butt a lot. You take her around the whole arena, some inmate manages to stick his hand through the fence and stroke the pup’s back as she crawls, making the pup bark at it.")

		saynn("[say=pc]You let others pet you, pup.[/say]")

		saynn("[say=ferri]Huff-f..[/say]")

		saynn("You bring the pup back to the center and then push her over. Ferri yelps as she gets forced onto her back but soon starts purring after when you begin to give her belly rubs.")

		saynn("[say=pc]Good girl.[/say]")

		saynn("Hearing the sacred words makes the pup squirm harder, you can’t see through her clothing but you can guess that she is aroused after all the humiliation.")

		saynn("[say=pc]Gonna leave you like this, have fun, pup~[/say]")

		saynn("Ferri’s eyes suddenly open wide again as she sees you climb over the fence. Then she looks around and sees many hungry inmates that are only stopped by the confines of the arena. You sure she will escape somehow, shouldn’t have been so eager to bite you.")

		# (scene ends)

		addButton("Continue", "Time to leave", "endthescene")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func getDevCommentary():
	return "You might have noticed that for some reason only Kait, Avy and Ferri have portraits drawn by me x3. Kait and Avy make sense, they play a part in the story. But Ferri.. She is just a cute brat.\n\nWell, Ferri is one of the 'invited' characters ^^. She is not my OC but they allowed me to use her and write for her ^^.\n\nWill she get more content? I doubt it. Since the community is slowly becoming bigger, the characters are also becoming more popular. And Ferri doesn't want that. And I will respect that ^^. She is a cute little brat still ^^"

func hasDevCommentary():
	return true
