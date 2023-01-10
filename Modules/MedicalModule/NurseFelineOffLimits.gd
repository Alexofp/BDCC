extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "NurseFelineOffLimits"

func _run():
	if(state == ""):
		addCharacter("nurse")
		playAnimation(StageScene.Duo, "stand", {npc="nurse"})

	if(state == ""):
		saynn("You stumble upon a nurse. You try to hide but it's too late.")

		saynn("[say=nurse]"+RNG.pick([
			"This is a mental ward, you can't be here without a leash.",
			"You got lost? I can help you.",
			"You can't be here.",
			"Hey, you. Did you escape?",
			"Whacha doin’ there.",
		])+"[/say]")

		saynn("Her voice sounds feminine, even though she is just a nurse she pulls out a stun baton. She looks tall and quite fit, as most felines are.")

		saynn("She waits for a moment to pounce at you.")

		saynn("[say=nurse]"+RNG.pick([
			"Give up and I won't hurt you. Too much",
			"Get on the floor. I give you one chance.",
			"Don’t make me use my claws, just surrender.",
			"Time to teach you a lesson.",
		])+"[/say]")

		saynn("Seems like it’s a fight.")

		addButton("Fight", "Seems like there is no other way", "fight")

	if(state == "lost_fight"):
		saynn("You got defeated by a nurse. Unable to continue fighting, you drop to your knees and await your fate.")
		
		addButton("Continue", "See what happens", "getrestrained")

	if(state == "getrestrained"):
		saynn("The nurse walks up to you. She produces some restraint and tries to put it on you!")

		saynn("[say=nurse]"+RNG.pick([
			"Now get out of here.",
			"This will be a lesson for you. Now go away.",
			"Resisting will only make this worse for you.",
			"This is gonna serve as a punishment.",
		])+"[/say]")

		# (scene ends)

		addButton("Continue", "Oh no", "endthescene")

	if(state == "won_fight"):
		saynn("You pin the defeated nurse to the floor. She doesn’t seem to struggle much.")

		# (if has hands)
		if(!GM.pc.hasBlockedHands()):
			saynn("You use her cuffs to cuff her, rendering her mostly helpless.")

		saynn("[say=nurse]"+RNG.pick([
			"Nice moves. What’s your plan?",
			"Don’t leave me like this, inmate.",
			"A little kiss before you leave?",
		])+"[/say]")

		addButton("Leave her be", "Just loot her and leave before anyone else sees you", "endthescene")

	if(state == "catchEscapedPC"):
		saynn("The nurse pins you down to the floor.")

		saynn("[say=nurse]Thought you can escape, test bitch?[/say]")

		saynn("She forces a straitjacket on you! You try to resist but it’s too late.")

		saynn("[say=nurse]Not so fast, you’re coming with me.[/say]")

		saynn("She leashes you and brings you to Eliza. The doctor doesn’t seem to be happy about you.")

		addButton("Oh no", "Escape failed", "oh_no")

func _react(_action: String, _args):

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "fight"):
		runScene("FightScene", ["nurse"], "nursefight")
	
	if(_action == "getrestrained"):
		for item in GM.pc.getInventory().forceRestraintsWithTag(ItemTag.CanBeForcedByGuards, RNG.randi_range(1, 2)):
			addMessage(item.getForcedOnMessage())
	
	if(_action == "oh_no"):
		runScene("ElizaCaughtEscapedPC")
		endScene()
		return
	
	setState(_action)


func _react_scene_end(_tag, _result):
	if(_tag == "nursefight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("won_fight")
			addExperienceToPlayer(30)
		else:
			addExperienceToPlayer(5)
			
			if(getModuleFlag("MedicalModule", "Mental_PlayerEscaped", false)):
				setState("catchEscapedPC")
			else:
				setState("lost_fight")
			

