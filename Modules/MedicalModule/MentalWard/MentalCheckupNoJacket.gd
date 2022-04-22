extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "MentalCheckupNoJacket"

func _run():
	if(state == ""):
		addCharacter("eliza")
		
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
		saynn("You decide to not resist. Eliza pins you down to the floor and forces a straitjacket back on you, locking all the straps tightly.")

		saynn("[say=eliza]Silly inmate, what did you think was gonna happen.[/say]")

		saynn("She finishes putting the jacket on and then sits on you. She grabs some injector and sticks it into your neck. Ow. You feel your limbs relaxing..")

		saynn("[say=eliza]You’re not leaving this place. Not with such awful behavior. And I’m gonna keep sticking you with needles until you start behaving. Or until your mind breaks. Hehe.[/say]")

		saynn("She stands up but keeps you pinned with her leg.")

		saynn("[say=eliza]Got it?[/say]")

		saynn("You have no choice but to nod, you feel like you can’t flex a muscle. So tired.. Eliza leaves your cell and closes the door.")
		
		addButton("Continue", "See what happens next", "endthescene")

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

	
	setState(_action)


func _react_scene_end(_tag, _result):
	if(_tag == "elizafight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			#if(wonHow == "lust"):
			#	setState("won_fight_lust")
			#else:
			#	setState("won_fight")
			endScene([true])
			addExperienceToPlayer(50)
		else:
			setState("surrender")
			GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("LatexStraitjacket"))
			addExperienceToPlayer(10)
