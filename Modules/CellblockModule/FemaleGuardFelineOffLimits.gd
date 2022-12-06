extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "FemaleGuardFelineOffLimits"

func _run():
	if(state == ""):
		addCharacter("femaleguard_feline")
		playAnimation(StageScene.Duo, "stand", {npc="femaleguard_feline"})

	if(state == ""):
		saynn("You hear footsteps behind you, the ones that bulky boots usually make. You try to hide but they announce their presence to you, the voice sounds feminine.")

		saynn("[say=femaleguard_feline]"+RNG.pick([
			"Hey there~.",
			"I see a new prey.",
			"How did you end up here, silly.",
			"Excuse you.",
			"Whacha doin’ there.",
		])+"[/say]")

		saynn("You turn around and see a prison’s guard, judging by her blue uniform and armored look. She looks tall and quite fit, as most felines are.")

		saynn("She grabs her stun baton and carefully approaches you.")

		saynn("[say=femaleguard_feline]"+RNG.pick([
			"Hmmm.. Just give up.",
			"Put your hands up for me. I give you one chance.",
			"Don’t make me use my claws, just surrender.",
			"Time to teach you a lesson.",
		])+"[/say]")

		saynn("Seems like it’s a fight.")

		addButton("Fight", "Seems like there is no other way", "fight")

	if(state == "lost_fight"):
		saynn("You got defeated by a single guard. Unable to continue fighting, you drop to your knees and await your faith.")
		
		addButton("Continue", "See what happens", "getrestrained")

	if(state == "getrestrained"):
		saynn("The guard walks up to you.")

		saynn("[say=femaleguard_feline]"+RNG.pick([
			"Time to dispense some justice",
			"Let’s see if this will be enough of a lesson.",
			"Resisting will only make this worse for you.",
			"This is gonna serve as a punishment.",
		])+"[/say]")

		saynn("She produces some restraint and tries to put it on you!")

		# (scene ends)

		addButton("Continue", "Oh no", "endthescene")

	if(state == "won_fight"):
		saynn("You pin the defeated guard to the floor. She doesn’t seem to struggle much.")

		# (if has hands)
		if(!GM.pc.hasBlockedHands()):
			saynn("You use her cuffs to cuff her, rendering her mostly helpless.")

		saynn("[say=femaleguard_feline]"+RNG.pick([
			"Nice moves. What’s your plan?",
			"Don’t leave me like this, inmate.",
			"A little kiss before you leave?",
		])+"[/say]")

		addButton("Leave her be", "Just loot her and leave before anyone else sees you", "endthescene")

func _react(_action: String, _args):

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "fight"):
		runScene("FightScene", ["femaleguard_feline"], "guardfight")
	
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
			

