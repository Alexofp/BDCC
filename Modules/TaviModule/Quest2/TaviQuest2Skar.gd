extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "TaviQuest2Skar"


func _run():
	if(state == ""):
		addCharacter("skar")
		playAnimation(StageScene.Duo, "stand", {npc="skar", npcAction="stand"})
		
	if(state == ""):
		saynn("The captain’s office is in sight. But the door is guarded by one of the guards, clearly a wolf. But you notice that his appearance is quite unique.")

		saynn("Light brown fur, black hair gathered into a careful ponytail, strong build and a medium height, about 1.7 meters tall. What intrigues you is his massive amount of prosthetics, his eyes seem to be fully replaced with white digital irises, the red glowing sclera around them gives the guy a very mean look, his lower jaw is replaced with a bulky angular prosthetic and his arms look like they are armored but they’re actually replaced too. Otherwise he is wearing a set of default guard armor and equipment.")

		saynn("He stands in the way and has clearly noticed you. Though he is not doing much about it, he is just standing still with his arms crossed, probably waiting for you to do the first move.")

		addButton("Approach", "See what will happen", "approach")

	if(state == "approach"):
		addCharacter("tavi")
		
		saynn("You take a few steps towards him. The guy carefully watches your motions and breathes deeply. His voice is low and raspy, it sounds synthesized.")

		saynn("[say=skar]That’s a bad idea.[/say]")

		saynn("[say=tavi]You think so?[/say]")

		saynn("Tavi shows up behind and stops in front of you, the bright smile is still shining on her face as she is eyeing out her next prey. She closes her arms too to mimic the guard’s stance.")

		saynn("[say=tavi]Two versus one, I really don’t like your chances. We just came to chat with our great captain, how about you just let us through. Save your health~. What’s left of it anyways.[/say]")

		saynn("The guard keeps staring at Tavi with an emotionless expression, his prosthetic eyes scan her uniform.")

		saynn("[say=skar]Inmate number 12429. A.k.a Tavi. Completed countless assasination contracts, has many records of hacking terminals, exploiting zero-day AlphaOS vulnerabilities in order to steal data and then using it for blackmailing and/or illegally obtaining wealth. Has unproven ties to the full destruction of a research space station “Exodus”.[/say]")

		saynn("Tavi growls at that sudden description, she gives you a quick look and turns her head back to the guy. She walks up very close to the guard and grabs onto his chest armor piece.")

		saynn("[say=tavi]You have zero fucking idea who I am.[/say]")

		saynn("[say=skar]Enlighten me.[/say]")

		saynn("Tavi growls at his cheeky altitude, she frowns and seems to be ready to sink her claws into his flesh. But then she suddenly changes her expression and takes a step back, her growling is now replaced with giggling. The smile shines brightly on her face.")

		saynn("[say=tavi]I’m just trying to make this world a better place, why can’t I have some fun while doing so~.[/say]")

		saynn("[say=skar]By killing people?[/say]")

		saynn("[say=tavi]My paws are totally clean, officer. How can you blame me if all these people suddenly decided to kill themselves or each other. Ah, this digital century is truly wonderful.[/say]")

		saynn("Tavi raises her paws and starts slowly circling around the guy, checking him out from all directions.")

		saynn("[say=tavi]And forget that, I see so many old wounds on you. You’re an ex-soldier, it’s obvious. How many people did you kill? Tens? Hundreds? I know, I know. They were all bad people, did bad things, had a very different view of the world, a bad one.[/say]")

		saynn("You hear a quiet growling coming from the guard, he grabs his stun baton and squeezes the handle. Tavi stops in front of him.")

		saynn("[say=tavi]We’re similar. But we’re also the exact opposites. I fight my own wars, you fight the wars of other people. But you know, we still both ended up in this prison. Isn’t that kinda funny~?[/say]")

		saynn("At that moment, the guard lunges forward and tries to strike the red with his weapon. She, of course, expects it and swiftly gets out of the way, instead leaving a few scratch marks on the guard’s face while doing so. He grunts and covers his wounds.")

		saynn("[say=tavi]You still have a chance to give up~.[/say]")

		saynn("Tavi extends her claws fully and tries to leave another set of scratch but her hands are stopped by his prosthetic arm, the motors audibly whine inside as he stresses it. Tavi tries to take a step back and deliver a powerful kick instead but the guard closes the distance himself and lands a strike with his stun baton, instantly dropping Tavi down to the floor. She cries out from painful shock as her feline body shakes and shivers.")

		saynn("Then he looks at you.")

		saynn("Seems like it’s a fight.")

		addButton("Continue", "Time to fight", "fight")


	if(state == "lost_fight"):
		saynn("You lost any will to continue fighting, can’t even find enough strength to stand up. You hear Skar’s stun baton being turned off. Then he walks up to you and fetches cuffs off of his belt. He wrenches your arms and tries to cuff them.")

		saynn("But Tavi suddenly grabs him from behind and kicks the back side of his knees until he is on the ground. Then she tries to disarm him but he holds onto his stun baton very tightly, thanks to his robot arms, so Tavi instead tries to choke him with it, forcing the stick into his neck while pushing her knee into the back of his head. She finds the switch on his weapon and ticks it on, sending a revenge shock through him. The guy grunts and gives up fighting.")

		saynn("Tavi helps you to get up.")

		addButton("Continue", "See what happens next", "continue")

	if(state == "won_fight"):
		saynn("Exhausted, the guard falls to his knee and drops his weapon. You walk up to Tavi and help her to get up.")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		saynn("The guard presses a button on his earpiece and speaks into it.")

		saynn("[say=skar]Couldn’t stop them.[/say]")

		saynn("Tavi looks at him and growls again. She was about to stomp on his chest when the intercom suddenly turns on and the captain’s voice comes through.")

		saynn("[say=captain]Come in, let’s have a chat.[/say]")

		saynn("[say=tavi]Huh?[/say]")

		saynn("The doors to the captain’s office open wide.")

		saynn("[say=tavi]Let’s go then.[/say]")

		addButton("Follow", "Enter the captain's office", "captainsoffice")


func _react(_action: String, _args):
	if(_action == "fight"):
		runScene("FightScene", ["skar"], "skarfight")
	
	if(_action == "captainsoffice"):
		runScene("TaviQuest2CaptainsOffice")
		endScene()
		return
	
	if(_action == "endthescene"):
		endScene()
		return


	setState(_action)


func _react_scene_end(_tag, _result):
	if(_tag == "skarfight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_fight")
			addExperienceToPlayer(150)
		else:
			setState("lost_fight")
			addExperienceToPlayer(150)
