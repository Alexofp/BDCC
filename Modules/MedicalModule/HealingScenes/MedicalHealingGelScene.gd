extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "MedicalHealingGelScene"

func isFirstTime():
	return !getFlag("MedicalModule.Medical_FirstTimeHealingGelHappened", false)

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="stand"})
		
	if(state == ""):
		saynn("[say=pc]Yeah, I think I will need the healing gel treatment..[/say]")

		saynn("Eliza raises her brow and glances at your lower part of the body.")

		saynn("[say=eliza]Had a rough night, huh? Let’s go fix that.[/say]")

		saynn("She clips a leash to your collar and escorts you somewhere.")

		addButton("Follow", "See where she brings you", "follow")

	if(state == "follow"):
		playAnimation(StageScene.BDSMMachineFuck, "tease", {bodyState={naked=true, hard=true}})
		aimCameraAndSetLocName("med_researchlab")
		
		saynn("You and the doctor enter the lab, a sterile looking space with no shortage of expensive equipment. Eliza brings you into the middle of the room where some kind of hi-tech table is placed. It has a computer attached to it and a bunch of extra hardware that you don’t even recognize.")

		# (if has clothes)
		if(!GM.pc.isFullyNaked()):
			saynn("[say=eliza]You can give me your clothes. Then lay down on your back and spread your legs.[/say]")

		# (else)
		else:
			saynn("[say=eliza]Lay down on your back for me and spread your legs.[/say]")

		# (if FIRST TIME)
		if(isFirstTime()):
			saynn("[say=pc]What are you gonna do?[/say]")

			saynn("Eliza picks up on your concerned tone and smiles.")

			saynn("[say=eliza]Almost nothing. I’m not qualified even if I wanted to.[/say]")

			saynn("That sounds even more scary.")

			saynn("[say=pc]Huh?[/say]")

			saynn("The doctor taps you on your shoulder.")

			saynn("[say=eliza]Relax. The machine will do everything. With the precision of the world’s best surgeon. Now do what I told you to do.[/say]")

		# (END FIRST TIME)

		# (if has clothes)
		if(!GM.pc.isFullyNaked()):
			saynn("You weigh your options and decide that the machine’s touch is probably better rather than having to suffer with the constant pain. You {pc.undressMessage} before giving all your belongings to Eliza. Then you lie down on the table and spread your legs, exposing your damaged private bits.")

		# (else)
		else:
			saynn("You weigh your options and decide that the machine’s touch is probably better rather than having to suffer with the constant pain. You give all your belongings to Eliza and then lie down on the table before spreading your legs and exposing your damaged private bits.")

		saynn("[say=eliza]Alright, yeah. I see some damage. Let’s try to fix it. But first.[/say]")

		saynn("Eliza grabs your wrists and puts cuffs on them. Cuffs that are chained to the table’s little hooks. Then she does the same with your ankles, rendering you pretty much helpless. And your legs are now held spread.")

		# (if FIRST TIME)
		if(isFirstTime()):
			saynn("[say=pc]Why? Is this really necessary?[/say]")

			saynn("[say=eliza]Yep~.[/say]")

		# (ELSE)
		else:
			saynn("[say=pc]I can just try to be still?[/say]")

			saynn("[say=eliza]No you can’t~.[/say]")

		# (END FIRST TIME)

		saynn("Eliza presses a button on the computer..")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		if(GM.pc.hasReachableVagina()):
			playAnimation(StageScene.BDSMMachineFuck, "insidedouble", {cum=true, bodyState={naked=true, hard=true}})
		else:
			playAnimation(StageScene.BDSMMachineFuck, "inside", {cum=true, bodyState={naked=true, hard=true}})
		
		saynn("You hear hydraulic motors working as the table brings some kind of tool out. You look down and see a sturdy metal arm with.. some kind of phallic object attached to it. Looks like a blue dildo that has a transparent tube running through it. And the tip of that tube is leaking something.. The arm is hovering between your legs.")

		# (if has pussy)
		if(GM.pc.hasReachableVagina()):
			saynn("[say=eliza]Oh, right, I forgot.[/say]")

			saynn("Eliza presses another button a second similar dildo shows up, same size, same blue color.")

		# (end)

		# (if FIRST TIME)
		if(isFirstTime()):
			saynn("[say=eliza]There we go~. Don’t be afraid. These are the healing gel.. dispensers.[/say]")

			saynn("[say=pc]Uhhh. Are you sure?[/say]")

		# (ELSE)
		else:
			saynn("[say=eliza]There we go~. Don’t be afraid. These are the healing gel.. dispensers.[/say]")

			saynn("[say=pc]Yeah, I remember..[/say]")

		# (END FIRST TIME)

		# (if has pussy)
		if(GM.pc.hasReachableVagina()):
			saynn("Eliza chuckles and starts pressing more buttons. The arms bring the long phallic objects to your holes. When the tips touch your sensitive flesh you can’t help but to flinch away. They’re cold!")

		# (else)
		else:
			saynn("Eliza chuckles and starts pressing more buttons. The arm brings the long phallic object to your hole. When the tip touches your sensitive flesh you can’t help but to flinch away. It’s cold!")

		# (if FIRST TIME)
		if(isFirstTime()):
			saynn("[say=eliza]It will help, trust me.[/say]")

		# (ELSE)
		else:
			saynn("[say=eliza]Best part.[/say]")

		# (END FIRST TIME)

		# (if has pussy)
		if(GM.pc.hasReachableVagina()):
			saynn("At this point you’re not sure if this is actually designed to heal your holes or if Eliza just wants to torture you. Blue dildos press against your irritated damaged flesh again and this time they don’t pull away, making you squirm from sudden sensations. But the more they rub against your privates, the less pain you feel, they must be coated with something. But before you get used to them completely, they both suddenly penetrate you and slide inside, making everything numb and cold inside too. You can’t help but to let out a moan and arch your back when that happens.. These damn cuffs seem to be so strong.")

		# (else)
		else:
			saynn("At this point you’re not sure if this is actually designed to heal your butt or if Eliza just wants to torture you. Blue dildo presses against your irritated damaged flesh again and this time it doesn’t pull away, making you squirm from sudden sensations. But the more it rubs against your hole, the less pain you feel, it must be coated with something. But before you get used to this completely, it suddenly penetrates you and slides inside, making everything numb and cold inside too. You can’t help but to let out a moan and arch your back when that happens.. These damn cuffs seem to be so strong.")

		saynn("[say=eliza]Apples won’t keep me away~.[/say]")

		# (if has pussy)
		if(GM.pc.hasReachableVagina()):
			saynn("At least they seem to just rest inside you, slowly numbing more and more of your lower part of the body. Your holes are constantly stretched by these dildo-like tools but you don’t feel any discomfort. Which is a nice change.")

			saynn("[say=eliza]We need to heal you from the inside too.[/say]")

			saynn("Eliza lets you rest like that for a bit before pressing something else. The bases of the dildos suddenly begin to inflate with something, it’s like they are growing knots. And at the same time the arms start applying more pressure onto your holes, trying to force the fat orbs inside too. They are struggling at first but the machine has no mercy, it whirls louder and louder until finally squeezing both knots inside you!")

			# (if has penis)
			if(GM.pc.hasPenis()):
				saynn("Your {pc.penis} throbs and then shoots out a load, your prostate enjoyed being smashed a little too much. Eliza chuckles.")

			saynn("You arch your back harder, squirming while the dildos begin stuffing your holes with something. Something cold and sticky. One of them is pressed directly against your womb entering, painting the insides. The other one stuffs your guts full of this unknown stuff too. And since the knots prevent any leakage, your belly quickly begins to look somewhat inflated.. Eliza takes note of that.")

			saynn("[say=eliza]That’s the healing gel~, don’t worry. There were only a few accidents where a real cum got used instead.[/say]")

			saynn("Even though your holes are being stretched a lot, you only feel a slight tickling down there. Whatever it is, it seems to be doing its job, soothing the pain and healing your bits.")

		# (else)
		else:
			saynn("At least it seems to just rest inside you, slowly numbing more and more of your lower part of the body. Your hole is constantly stretched by this dildo-like tool but you don’t feel any discomfort. Which is a nice change.")

			saynn("[say=eliza]We need to heal you from the inside too.[/say]")

			saynn("Eliza lets you rest like that for a bit before pressing something else. The base of the dildo suddenly begins to inflate with something, it’s like it’s growing a knot. And at the same time the arm starts applying more pressure onto your hole, trying to force the fat orb inside. The arm is struggling at first but the machine has no mercy, it whirls louder and louder until finally squeezing the knot inside you!")

			# (if has penis)
			if(GM.pc.hasPenis()):
				saynn("Your {pc.penis} throbs and then shoots out a load, your prostate enjoyed being smashed a little too much. Eliza chuckles.")

			saynn("You arch your back harder, squirming while the dildo begins stuffing your hole with something. Something cold and sticky. It stuffs your guts full of this stuff. And since the knot prevents any leakage, your belly quickly begins to look somewhat inflated.. Eliza takes note of that.")

			saynn("[say=eliza]That’s the healing gel~, don’t worry. There were only a few accidents where a real cum got used instead.[/say]")

			saynn("Even though your hole is being stretched a lot, you only feel a slight tickling down there. Whatever it is, it seems to be doing its job, soothing the pain and healing your bits.")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="stand"})
		
		# (if has pussy)
		if(GM.pc.hasReachableVagina()):
			saynn("You’re left to rest like that for about ten minutes before Eliza presses the button to deflate the knots and retract the dildos out of your holes. And as they are being pulled out, the last of the healing gel pours onto your pussy and ass, creating a lewd mess.")

		# (else)
		else:
			saynn("You’re left to rest like that for about ten minutes before Eliza presses the button to deflate the knot and retract the dildo out of your hole. And as it's being pulled out, the last of the healing gel pours onto your crotch and ass, creating a lewd mess.")

		saynn("[say=eliza]There you go. Try to avoid rough sex if you can. Unless you want more of this~.[/say]")

		saynn("Eliza uncuffs your hands and legs before giving you your belongings back. All the while you’re still leaking healing gel..")

		saynn("You get up and look at the mess on the table.")

		saynn("[say=eliza]Don’t worry, I will clean it up. I opened the door for you. Take care, patient.[/say]")

		saynn("Well, that was something. But it’s time to go. You walk out into the corridor.")

		# (scene ends)
		addButton("Leave", "Time to go", "endthescene")
		


func _react(_action: String, _args):
	if(_action in ["follow", "continue1"]):
		processTime(60*3)
	
	if(_action == "continue"):
		GM.pc.afterHealingGelTreatment()
		processTime(60*20)
	
	if(_action == "endthescene"):
		GM.pc.setLocation("med_nearlab")
		setFlag("MedicalModule.Medical_FirstTimeHealingGelHappened", true)
		endScene()
		return
		
	setState(_action)
