extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "MentalShower"

func _run():
	if(state == ""):
		addCharacter("eliza")
		
	if(state == ""):
		saynn("Eliza enters your cell and crouches before you. She grabs a leash and tries to attach it to your collar.")

		saynn("[say=eliza]"+RNG.pick([
			"Shower time~.",
			"Let’s get you showered.",
			"Follow me to the shower.",
		])+"[/say]")

		addButton("Shower!", "Follow Eliza", "shower!")
		addButton("Resist", "Who knows what she will do to you, you don’t need no shower. Behavior-", "resist")

	if(state == "resist"):
		saynn("You growl softly and kick her away. Eliza recoils away and huffs.")

		saynn("[say=eliza]Fine, stay like that. See if I care.[/say]")

		saynn("Eliza leaves your cell and shuts the door.")

		# (scene ends)
		addButton("Continue", "Awww", "endthescene")
		

	if(state == "shower!"):
		aimCamera("medical_shower")
		playAnimation(StageScene.Solo, "walk")
		setLocationName("Shower")
		
		saynn("She brings you to the shower room. Bland gray floor, tiled walls, a few rows of shower heads.")

		saynn("[say=eliza]Can’t have you showering with the straitjacket so I will remove it, mhm?[/say]")

		saynn("You stand still and wait for your arms to be freed. You quickly cover yourself.")

		saynn("[say=eliza]There is nothing you can surprise me with~[/say]")

		saynn("She puts the straitjacket away for now and turns one of the showers for you, the water seems pleasingly warm.")

		# (if bad behavior)
		if(getModuleFlag("MedicalModule", "Mental_PCBehavior", 0.0) < 0.4):
			if(getModuleFlag("MedicalModule", "Mental_PCBehavior", 0.0) < 0.2):
				saynn("[say=eliza]Since you’re such a bratty test subject I will be looking at you to make sure you don’t cause any trouble.[/say]")
			else:
				saynn("[say=eliza]I don't trust you enough so I will be looking at you to make sure you don’t cause any trouble.[/say]")
			addDisabledButton("Ask to look away", "You don't behave well enough to ask that")
		else:
			addButton("Ask to look away", "You don’t want Eliza to watch you", "ask_to_look_away")
		addButton("Be watched", "Eliza will be watching you taking a shower", "be_watched")
		addButtonWithChecks("Show", "Give Eliza a little show", "show", [], [[ButtonChecks.SkillCheck, Skill.Exhibitionism, 2]])

	if(state == "ask_to_look_away"):
		playAnimation(StageScene.Showering, "body", {pc="pc", bodyState={naked=true}})
		
		saynn("[say=pc]Can you not watch, please?[/say]")

		saynn("[say=eliza]Sure, if you’re asking so nicely.[/say]")

		saynn("Eliza turns away and waits for you to be done. You step under the shower head and proceed to wash yourself. Hair, face, shoulders, {pc.breasts}, your {pc.masc} body. You quickly wash your privates too. It’s very refreshing.")

		addButton("Steal keycard", "Try and pickpocket Eliza, this will be easier the better your behavior is. (Current chance: "+str(round(calculateStealChance()*10.0)/10.0)+"%)", "steal_keycard")
		addButton("Clean inside", "Wash out anything you have inside your holes", "clean_inside")
		addButton("Done", "You’re finished showering", "done")
		
	if(state == "steal_keycard_failed"):
		playAnimation(StageScene.Duo, "defeat", {npc="eliza"})
		# (if failed)

		saynn("You sneak up to the doctor and try to steal the keycard that she has on her belt.")

		saynn("But the moment you try to get a grasp on it she turns around and catches your hand. She doesn’t seem to be happy. Less than one second passes as she presses a button on her remote, sending a powerful shock impulse to your collar. You grab onto it and fall to your knees. Ow!")

		saynn("[say=eliza]That was a very bad idea, inmate.[/say]")

		saynn("Eliza pins you to the floor and forces a straitjacket back on you. She then leashes you and shoves you back into your cell so you can think about your behavior.")

		# (scene ends)
		addButton("Continue", "Oww", "endthescene")

		# (if succ)
	if(state == "steal_keycard_succ"):
		saynn("You sneak up to the doctor and try to steal the keycard that she has on her belt.")

		saynn("The sound of water helps against noise and your good behavior means Eliza isn’t paying as much attention as normally. You manage to snatch her keycard and hide it.. somewhere.")

		addButton("Clean inside", "Wash out anything you have inside your holes", "clean_inside")
		addButton("Done", "You’re finished showering", "done")

	if(state == "clean_inside"):
		playAnimation(StageScene.Showering, "crotch", {pc="pc", bodyState={naked=true}})
		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("You spread your {pc.pussyStretch} pussy lips and wait if anything comes out. It all quickly goes down the drain. You then do the same with your butt. At least you don’t have to do this while Eliza is watching.")

		# (else)
		else:
			saynn("You spread your butt and wait if anything comes out from your {pc.analStretch}. It all quickly goes down the drain. At least you don’t have to do this while Eliza is watching.")

		addButton("Done", "You’re finished showering", "done")

	if(state == "done"):
		saynn("You turn off the water, Eliza walks up to you and puts the straitjacket back on you. She then puts a leash on you and walks you back to your cell.")

		# (scene finished)
		addButton("Continue", "You feel fresh", "endthescene")
		

	if(state == "be_watched"):
		playAnimation(StageScene.ShoweringDuo, "tease", {pc="pc", npc="eliza", bodyState={naked=true}})

#ACEOREGEXPAC - Experiments Shower has a few lines for being heavily pregnant
		if(GM.pc.isHeavilyPregnant()):
			saynn("You step under the shower head and proceed to wash yourself. Hair, face, shoulders, {pc.breasts}, your {pc.masc} body. You can’t cover yourself forever so Eliza catches a few glimpses of your privates.")
			saynn("With how heavy and burdensome your pregnancy is, you have to really give yourself a stretch and rub down over your belly. It's fine, It's not like you can't do it, just takes longer, but Eliza's gaze does remain firmly on your strained midriff as you work.")
		else:
			saynn("You step under the shower head and proceed to wash yourself. Hair, face, shoulders, {pc.breasts}, your {pc.masc} body. You can’t cover yourself forever so Eliza catches a few glimpses of your privates.")

		addButton("Clean inside", "Wash out anything you have inside your holes", "clean_inside1")
		addButton("Done", "You’re finished showering", "done1")

	if(state == "clean_inside1"):
		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("You spread your {pc.pussyStretch} pussy lips and wait if anything comes out. It all quickly goes down the drain. You then do the same with your butt. Eliza smirks watching you do that and it makes you blush.")

		# (else)
		else:
			saynn("You spread your butt and wait if anything comes out from your {pc.analStretch}. It all quickly goes down the drain. Eliza smirks watching you do that and it makes you blush.")

		addButton("Done", "You’re finished showering", "done1")

	if(state == "done1"):
		saynn("You turn off the water, Eliza walks up to you and puts the straitjacket back on you. She then puts a leash on you and walks you back to your cell.")

		# (scene end)
		addButton("Continue", "You feel fresh", "endthescene")
		
#ACEPREGEXPAC - experiments shower lines for being heavily pregnant
	if(state == "show"):
		saynn("You notice Eliza staring and decide to do a little performance for her, you get under the shower head and start with slowly swaying your {pc.masc} hips to the sides. Your palms capture some water and then slide along your {pc.thick} body, going over your {pc.breasts} and then giving your butt a little smack. You notice Eliza raising her brow.")

		# (if has pussy and cock)
		if(GM.pc.hasVagina() && GM.pc.hasPenis()):
			saynn("You do a bold move and bend forward, spreading your legs "+str("showing the underside of your heavy pregnancy between your legs" if GM.pc.isHeavilyPregnant() else "")+"and offering Eliza a good view on your {pc.analStretch} anal ring, {pc.pussyStretch} pussy and a {pc.cock}, the full package!")

		# (if has just pussy)
		elif(GM.pc.hasVagina()):
			saynn("You do a bold move and bend forward, spreading your legs "+str("showing the underside of your heavy pregnancy between your legs" if GM.pc.isHeavilyPregnant() else "")+"and offering Eliza a good view on your {pc.analStretch} anal ring and {pc.pussyStretch} pussy, all your girly bits!")

		# (if just cock)
		elif(GM.pc.hasPenis()):
			saynn("You do a bold move and bend forward, spreading your legs "+str("showing the underside of your heavy pregnancy between your legs" if GM.pc.isHeavilyPregnant() else "")+"and offering Eliza a good view on your {pc.analStretch} anal ring and a {pc.cock}, all your bits!")

		# (else)
		else:
			saynn("You do a bold move and bend forward, spreading your legs"+str("showing the underside of your heavy pregnancy between your legs" if GM.pc.isHeavilyPregnant() else "")+" and offering Eliza a good view on your {pc.analStretch} anal ring, all your privates!")

		saynn("Eliza seems to be quite shocked, you look behind and see her blushing. You let out a soft chuckle and sway your {pc.thick} butt more for her while you pretend to clean yourself, water drips down your back.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("You even spread your pussy for her, just to stun her for longer and show that you’re not afraid to show off your body.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			if(GM.pc.isWearingChastityCage()):
				saynn("You even rub your cage sneakily until your member is hard behind the chastity.")
			else:
				saynn("You even stroke yourself sneakily until your {pc.cock} is fully hard.")

		saynn("[say=eliza]You certainly are quite something, I gotta say.[/say]")

		saynn("You giggle and straighten your posture, just continuing showering.")

		addButton("Done", "You’re finished showering", "done2")

	if(state == "done2"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You turn off the water, Eliza walks up to you and puts the straitjacket back on you. She then puts a leash on you and walks you back to your cell.")
		
		addButton("Continue", "You feel fresh", "endthescene")

func _react(_action: String, _args):
	if(_action == "shower!"):
		runScene("ParadedOnALeashScene", ["eliza", GM.pc.getLocation(), "medical_shower", [
			"Almost there, patient",
		]])

	if(_action in ["clean_inside", "clean_inside1"]):
		GM.pc.clearOrificeFluids()
		processTime(60 * 10)

	if(_action in ["ask_to_look_away" , "be_watched", "show"]):
		GM.pc.afterTakingAShower()
		processTime(60 * 10)
		
		addMessage("You feel fresh and clean")
		
		if(_action == "be_watched"):
			GM.pc.addSkillExperience(Skill.Exhibitionism, 10)
		if(_action == "clean_inside1"):
			GM.pc.addSkillExperience(Skill.Exhibitionism, 10)
		if(_action == "show"):
			MedicalModule.addPCBehavior(0.05)
			GM.pc.addSkillExperience(Skill.Exhibitionism, 40)

	if(_action == "resist"):
		MedicalModule.addPCBehavior(-0.1)

	if(_action == "steal_keycard"):
		
		if(!RNG.chance(calculateStealChance())):
			setState("steal_keycard_failed")
			MedicalModule.addPCBehavior(-0.7)
		else:
			setState("steal_keycard_succ")
			setModuleFlag("MedicalModule", "Mental_HasKeycard", true)
		return

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func calculateStealChance():
	var result = -30.0 + getModuleFlag("MedicalModule", "Mental_PCBehavior", 0.0) * 130.0 + GM.pc.getStat(Stat.Agility) * 2.0
	
	return clamp(result, 0.0, 100.0)
