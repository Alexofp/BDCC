extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "MaleGuardCanineOffLimits"

func _run():
	if(state == ""):
		addCharacter("maleguard_canine")
		playAnimation(StageScene.Duo, "stand", {npc="maleguard_canine"})

	if(state == ""):
		saynn("You hear a raspy male voice coming from the shadow behind you.")

		saynn("[say=maleguard_canine]"+RNG.pick([
			"Hey, you’re not supposed to be here.",
			"You got lost, didn’t you.",
			"Someone is feeling risky today, huh.",
			"I see a stray inmate.",
			"Inmates never learn, do they.",
		])+"[/say]")

		saynn("You turn around and see a prison’s guard, judging by his blue uniform and armored look. He has clear canine features, perky wolf-like ears, long muzzle with a rough snout and a swishing tail.")

		saynn("He grabs his stun baton and casually approaches you, his predator eyes checking you out.")

		saynn("[say=maleguard_canine]"+RNG.pick([
			"What are we gonna do about this?",
			"Care to explain yourself?",
			"Why shouldn’t I report you right here and now?",
			"I don’t like your odds.",
		])+"[/say]")

		saynn("Seems like it’s a fight.")

		addButton("Fight", "Seems like there is no other way", "fight")

	if(state == "lost_fight"):
		saynn("You got defeated by a single guard. Unable to continue fighting, you drop to your knees and await your faith.")

		addButton("Continue", "See what happens", "getrestrained")

	if(state == "getrestrained"):
		saynn("The guard walks up to you.")

		saynn("[say=maleguard_canine]"+RNG.pick([
			"Time to dispense some justice",
			"Let’s see if this will be enough of a lesson.",
			"Resisting will only make this worse for you.",
			"This is gonna serve as a punishment.",
		])+"[/say]")

		saynn("He produces some restraint and tries to put it on you!")

		# (scene ends)

		addButton("Continue", "Oh no", "endthescene")

	if(state == "won_fight"):
		saynn("You pin the defeated guard to the floor. He doesn’t seem to struggle much.")

		# (if has hands)
		if(!GM.pc.hasBlockedHands()):
			saynn("You use his cuffs to cuff him, rendering him mostly helpless.")

		saynn("[say=maleguard_canine]"+RNG.pick([
			"What’s your plan?",
			"Don’t leave me like this, inmate.",
			"A short goodbye fuck before you leave would be nice.",
		])+"[/say]")

		addButton("Leave him be", "Just loot him and leave before anyone else sees you", "endthescene")

func _react(_action: String, _args):

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "fight"):
		runScene("FightScene", ["maleguard_canine"], "guardfight")
	
	if(_action == "getrestrained"):
		for item in GM.pc.getInventory().forceRestraintsWithTag(ItemTag.CanBeForcedByGuards, RNG.randi_range(1, 2)):
			addMessage(item.getForcedOnMessage())
	
	setState(_action)


func _react_scene_end(_tag, _result):
	if(_tag == "guardfight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("won_fight")
			addExperienceToPlayer(30)
		else:
			setState("lost_fight")
			addExperienceToPlayer(5)
			

