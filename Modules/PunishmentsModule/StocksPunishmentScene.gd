extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "StocksPunishmentScene"

func _reactInit():
	GM.pc.getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("StocksStatic"))

func _run():
	if(state == ""):
		GM.pc.setLocation("main_punishment_spot")
		aimCamera("main_punishment_spot")
		
		saynn("You’re stuck in stocks, there is very little you can do, the movement of your head and arms is blocked by a giant metal frame with 3 holes, its angle is forcing you to constantly stay bent forward, exposing your butt, your ankles are chained so you can’t really move them too. You’re completely helpless.")

		saynn("All you can do is wait while inmates and staff walk past you, minding their stuff. Though some look intrigued.")

		saynn("((There are no sex scenes here yet so you will just be saved immediately))")

		addButton("Wait", "Stay quiet and try to get some rest (You might get something done to you but you will never be fucked unwillingly)", "justwait")
		addButton("Be loud", "Ask to be freed. You might not get the type of attention that you want. (Anything can happen)", "be_loud")
		addButton("Struggle", "Maybe you can escape somehow", "struggle")
		if(!GM.pc.getInventory().hasLockedStaticRestraints()):
			addButton("Escape", "Sweet freedom!", "endthescene")
		else:
			addDisabledButton("Escape", "You can't escape while the stocks are locked")

	if(state == "afterWait"):
		saynn("You decide to stay quiet. You’re forced to stand in an uncomfortable pose, it’s humiliating but you get some rest.")
		
		addButton("Continue", "What now", "")


	if(state == "be_loud"):
		# (if not blindfolded)
		if(!GM.pc.isBlindfolded()):
			saynn("You look around to the best of your abilities and beg loudly.")

		# (if blindfolded)
		else:
			saynn("You can’t really see if anyone is around but you beg anyway.")

		saynn("[say=pc]"+RNG.pick([
			"Can someone help me?",
			"Someone, please, unlock me.",
			"I’m stuck here, can someone help me?",
			"I can’t move, I’m stuck here.",
			"A little help?",
		])+"[/say]")

		# (forced random interaction)

		addButton("Continue", "See what happens", "afterbeloud")

	if(state == "rahi_saves_you"):
		addCharacter("rahi")
		
		saynn("With the corner of your eye you notice some movement, a brown feline that was sitting on the bench has stood up. She is not very big and wears a general block uniform.")

		saynn("She looks around for a bit and then carefully approaches you. Firstly, she unchains your legs and then unlocks the top part of the stocks, allowing you to finally escape from it. You stand up and stretch.")

		saynn("[say=rahi]Sorry she couldn’t do it earlier, it’s scary when others are watching..[/say]")

		if(!GM.main.getFlag(RahiModule.Rahi_Introduced)):
			saynn("Huh, she is talking about herself in third person?")

			saynn("[say=pc]Um.. thanks anyways[/say]")

			saynn("[say=rahi]Don’t mention it..[/say]")
		else:
			saynn("[say=pc]Thank you, kitty[/say]")

			saynn("She offers you a smile and nods.")

			saynn("[say=rahi]All good[/say]")


		saynn("The brown feline makes sure you’re okay and then goes back to resting on the bench in the corner.")

		addButton("Leave", "You got saved!", "endthescene")


	if(state == "tavi_saves_you"):
		addCharacter("tavi")
		
		saynn("You hear a voice behind.")

		saynn("[say=tavi]Oh hey, that butt looks familliar.[/say]")

		saynn("You try to look back but your neck has a very small angle of freedom. You feel your butt being spanked and let out a soft moan.")

		saynn("[say=tavi]My pet has been naughty, huh~?[/say]")

		saynn("Tavi walks into your view and crouches before you, her paw slides along your cheek and taps a few times.")

		saynn("[say=tavi]You look cute there, maybe I shouldn’t unlock you. But oh well[/say]")

		saynn("Tall feline unchains your legs and then unlocks the stocks, letting you stand up at last.")

		saynn("[say=tavi]Don’t get used to it~[/say]")

		saynn("She gives you a little head pat and then leaves.")

		addButton("Leave", "You got saved!", "endthescene")

func getPossibleScenes(escapeChance, _lewdChance, _willingSexChance, _unWillingSexChance):
	var result = []
	
	if(RNG.chance(escapeChance)):
		result.append(["rahi_saves_you"])
		if(GM.main.getFlag(TaviModule.Tavi_IntroducedTo) && !GM.main.getFlag(TaviModule.Tavi_IsAngryAtPlayer)):
			result.append("tavi_saves_you")
	
	return result

func _react(_action: String, _args):
	if(_action == "afterbeloud"):
		processTime(60*1)
		var possibleStates = getPossibleScenes(20, 100, 100, 100)
		if(possibleStates.size() == 0):
			setState("")
		else:
			setState(RNG.pick(possibleStates))
		return
	
	if(_action == "justwait"):
		var possibleStates = getPossibleScenes(10, 10, 10, 0)
		
		if(RNG.chance(80) || possibleStates.size() == 0):
			processTime(60*30)
			GM.pc.addStamina(50)
			setState("afterWait")
		else:
			processTime(60*1)
			setState(RNG.pick(possibleStates))
		return
	
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "struggle"):
		runScene("StrugglingScene")
		setState("")
		return
	
	setState(_action)

func _onSceneEnd():
	GM.pc.getInventory().clearStaticRestraints()
