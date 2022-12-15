extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "MentalCheckupNoJacket"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
	if(state == ""):
		saynn("You can hear faint footsteps as someone approaches the cells. Because you’re not wearing the straitjacket anymore, you decide to hide so you wouldn’t be seen through the little window. Maybe they will just pass by.")

		saynn("But they don’t. You hear a noise coming through the intercom followed by the doctor’s voice.")

		saynn("[say=eliza]How are we doing, inmate?[/say]")

		saynn("You don’t respond so she tries to look inside.")

		saynn("[say=eliza]Hm? Where is the inmate?[/say]")

		saynn("She sounds concerned. The door to your cell slowly goes through its opening sequence. She peeks inside and gasps as she spots you.")

		saynn("[say=eliza]Hey, how did you..[/say]")

		addButton("Attack", "Don’t let her call for backup. Behavior---", "attack")
		addButton("Surrender", "Say that it’s all a mistake. Behavior-", "surrender")

	if(state == "attack"):
		saynn("You try to shove Eliza away but thanks to her feline agility she dodges at the last second.")

		saynn("[say=eliza]Oh, is that how you’re gonna play?[/say]")

		saynn("Seems like it’s a fight.")

		addButton("Continue", "Fight!", "startfight")

	if(state == "surrender"):
		playAnimation(StageScene.Duo, "defeated", {npc="eliza"})
		
		saynn("You decide to not resist. Eliza pins you down to the floor and forces a straitjacket back on you, locking all the straps tightly.")

		saynn("[say=eliza]Silly inmate, what did you think was gonna happen.[/say]")

		saynn("She finishes putting the jacket on and then sits on you. She grabs some injector and sticks it into your neck. Ow. You feel your limbs relaxing..")

		saynn("[say=eliza]You’re not leaving this place. Not with such awful behavior. And I’m gonna keep sticking you with needles until you start behaving. Or until your mind breaks. Hehe.[/say]")

		saynn("She stands up but keeps you pinned with her leg.")

		saynn("[say=eliza]Got it?[/say]")

		saynn("You have no choice but to nod, you feel like you can’t flex a muscle. So tired.. Eliza leaves your cell and closes the door.")
		
		addButton("Continue", "See what happens next", "endthescene")

	if(state == "won_fight"):
		saynn("Unable to fight you any longer, Eliza drops to her knees. But she has not given up yet, she attempts to use her last ace, her hand reaches her belt and fetches a remote from it. You see that and pounce at her, pinning her hands to the floor.")

		saynn("You straddle her, your hand prevents Eliza from pressing any buttons on the remote. She pants and glances at you with intrigued eyes.")

		saynn("[say=eliza]Mmm-m.. This is quite kinky. You know.. I’m not mad at you, inmate.[/say]")

		saynn("You hear loud footsteps coming from another room. Eliza chuckles softly in your grasp.")

		saynn("[say=eliza]You better run before they find us like this~.[/say]")

		addButton("Leave her", "Time to run", "leave_her")
		addButton("Kiss her", "Goodbye gift", "kiss_her")

	if(state == "kiss_her"):
		saynn("You suddenly land a kiss on Eliza’s lips. A quite long one. She opens her eyes wide, clearly surprised. She blinks a few times in a row and slowly shuts them, a soft blush appears on her cheeks.")

		saynn("But as quickly as you start the kiss, you also swiftly stop it and make your escape, leaving Eliza on the floor.")

		# (scene ends)
		addButton("Continue", "Time to run", "endthesceneEscape")
		

	if(state == "leave_her"):
		saynn("You direct your attention to the source of footsteps and Eliza uses that opportunity to free one of her hands and scratch your cheek. Ow! She offers you a cheeky smile. You growl at her")

		saynn("[say=eliza]You will never understand it. How important science is.[/say]")

		saynn("Footsteps become even louder so you decide to make your escape, leaving Eliza on the floor.")

		# (add a bit of pain)
		addButton("Continue", "Time to run", "endthesceneEscape")
		# (scene ends)

func _react(_action: String, _args):

	if(_action == "surrender"):
		MedicalModule.addPCBehavior(-0.1)

		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("LatexStraitjacket"))

	if(_action == "attack"):
		MedicalModule.addPCBehavior(-0.9)

	if(_action == "startfight"):
		runScene("FightScene", ["eliza"], "elizafight")

	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "endthesceneEscape"):
		endScene([true])
		return
	
	if(_action == "leave_her"):
		GM.pc.addPain(5)
	
	setState(_action)


func _react_scene_end(_tag, _result):
	if(_tag == "elizafight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("won_fight")
			setModuleFlag("MedicalModule", "Mental_PlayerEscaped", true)
			#endScene([true])
			addExperienceToPlayer(50)
		else:
			setState("surrender")
			GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("LatexStraitjacket"))
			addExperienceToPlayer(10)
