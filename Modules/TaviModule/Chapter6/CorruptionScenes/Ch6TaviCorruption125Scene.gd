extends SceneBase

func _init():
	sceneID = "Ch6TaviCorruption125Scene"

func _run():
	if(state == ""):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("Things feel different today. As you step into Tavi's room, you find her standing there, smiling. She isn't even naked, huh.")

		saynn("[say=pc]Hey there.[/say]")

		saynn("Tavi boldly walks up to you, her voice has a seductive tone to it.")

		saynn("[say=tavi]I wanna show you something.. Look closely.[/say]")

		saynn("She moves her paw to her head and then moves her hair aside, uncovering.. small, devilish horns that have emerged on her forehead. What? Were these always there?")

		saynn("[say=pc]Um..[/say]")

		saynn("[say=tavi]How do they look~?[/say]")

		saynn("[say=pc]Like.. horns.[/say]")

		saynn("Tavi smiles.")

		saynn("[say=tavi]They sprung up today. I have zero idea why. But you know, I kinda like them~.[/say]")

		saynn("She lets go of the hair, which hides her horns neatly. But for how long will these be invisible?")

		saynn("[say=pc]Is Eliza somehow involved? Did she feed you weird drugs?[/say]")

		saynn("Tavi shrugs and starts slowly stepping around you, her tail brushing against your chest.. against your crotch..")

		saynn("[say=tavi]No, she did not~. But I think her.. treatment.. is what pushed my body.. to start uncovering its true potential~.[/say]")

		saynn("Tavi stops behind you and wraps her paws around your waist, gently caressing your curves.")

		saynn("[say=tavi]And you.. You are the real reason I'm changing~. Please keep it up.[/say]")

		saynn("She leans in closer to your ear, her touches are so warm..")

		saynn("[say=tavi]Keep using me~. Fuck me, lick me, force me.. Corrupt me into your little.. demon.. slut.[/say]")

		saynn("Her voice tugs on all sorts of strings.. You feel like you can't say no.. At least not now..")

		addButton("Kiss her", "Her lips are so inviting", "kiss_tavi")
	if(state == "kiss_tavi"):
		playAnimation(StageScene.Hug, "hug", {npc="tavi"})
		saynn("The voice coming from her lips is so alluring. You can't help but to turn around and kiss Tavi..")

		saynn("The tall kitty purrs softly. But as soon as you try to end this little interaction, she pulls you in for a deeper kiss, thrusting her.. long.. feline tongue into your mouth and playing with yours, exchanging saliva.")

		saynn("The more you are kissing.. the more you feel your.. lust.. and pain.. fading.. almost like they're getting sucked away.. replaced by a feeling of exhaustion. Tavi's differently-colored eyes flash brightly, her paws explore your body, her claws gently scratching you.")

		saynn("Only after a few minutes, the feline finally satisfies her.. heat. She allows you to end the kiss and then just looks at you, smiling.")

		saynn("[say=tavi]Whatever it is.. It's clearly meant to be~. When you find yourself in hell, dance with the devil~.[/say]")

		saynn("You slowly catch your breath. Wow.")

		addButton("Continue", "See what happens next", "start_talking")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "kiss_tavi"):
		processTime(2*60)
		GM.pc.addLust(-200)
		GM.pc.addPain(-200)
		GM.pc.addStamina(-50)
		addMessage("You feel weak..")

	if(_action == "start_talking"):
		runScene("Ch6TaviTalkScene")
		endScene()
		return

	setState(_action)
