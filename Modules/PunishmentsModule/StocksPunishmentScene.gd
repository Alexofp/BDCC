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

		addButton("Wait", "Stay quiet and try to get some rest (You might get something done to you but you will never be fucked unwillingly)", "afterWait")
		addButton("Be loud", "Ask to be freed. You might not get the type of attention that you want. (Anything can happen)", "be_loud")
		addButton("Struggle", "Maybe you can escape somehow", "struggle")
		if(!GM.pc.getInventory().hasLockedStaticRestraints()):
			addButton("Escape", "Sweet freedom!", "endthescene")
		else:
			addDisabledButton("Escape", "You can't escape while the stocks are locked")

	if(state == "afterWait"):
		saynn("You decide to stay quiet. You’re forced to stand in an uncomfortable pose, it’s humiliating but you get some rest.")
		
		addButton("Continue", "What now", "afterjustwait")


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

func triggerRandomEvent(escapeChance, _lewdChance, _willingSexChance, _unWillingSexChance, _nothingChance):
	var eventType = RNG.pickWeighted([RandomSceneType.StocksEscape, RandomSceneType.StocksEvent, RandomSceneType.StocksWillingSex, RandomSceneType.StocksUnWillingSex, ""], [escapeChance, _lewdChance, _willingSexChance, _unWillingSexChance, _nothingChance])
	
	if(eventType == RandomSceneType.StocksEscape):
		var sceneID = GM.main.getRandomSceneFor(RandomSceneType.StocksEscape)
		if(sceneID != null):
			runScene(sceneID)
			endScene()
			return true
	
	if(eventType == RandomSceneType.StocksEvent):
		var sceneID = GM.main.getRandomSceneFor(RandomSceneType.StocksEvent)
		if(sceneID != null):
			runScene(sceneID)
			return true
			
	if(eventType == RandomSceneType.StocksWillingSex):
		var sceneID = GM.main.getRandomSceneFor(RandomSceneType.StocksWillingSex)
		if(sceneID != null):
			runScene(sceneID)
			return true
			
	if(eventType == RandomSceneType.StocksUnWillingSex):
		var sceneID = GM.main.getRandomSceneFor(RandomSceneType.StocksUnWillingSex)
		if(sceneID != null):
			runScene(sceneID)
			return true
	
	return false

func _react(_action: String, _args):
	if(_action == "afterbeloud"):
		processTime(60*30)
		GM.pc.addStamina(50)
		triggerRandomEvent(3, 50, 50, 30, 20)
		setState("")
		GM.main.showLog()
		return
	
	if(_action == "afterjustwait"):
		processTime(60*30)
		GM.pc.addStamina(50)
		triggerRandomEvent(2, 20, 20, 0, 50)
		setState("")
		GM.main.showLog()
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
