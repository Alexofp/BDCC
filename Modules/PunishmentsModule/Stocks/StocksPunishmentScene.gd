extends "res://Scenes/SceneBase.gd"

var amountOfEventsPassed = 0

func _init():
	sceneID = "StocksPunishmentScene"

func _reactInit():
	GM.pc.getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("StocksStatic"))

func _run():
	if(state == ""):
		playAnimation(StageScene.Stocks, "idle")
		GM.pc.setLocation("main_punishment_spot")
		aimCamera("main_punishment_spot")
		
		saynn("You’re stuck in stocks, there is very little you can do, the movement of your head and arms is blocked by a giant metal frame with 3 holes, its angle is forcing you to constantly stay bent forward, exposing your butt, your ankles are chained so you can’t really move them too. You’re completely helpless.")

		saynn("All you can do is wait while inmates and staff walk past you, minding their stuff. Though some look intrigued.")

		addButton("Wait", "Stay quiet and try to get some rest (You might get something done to you but you will never be fucked unwillingly)", "wait")
		addButton("Be loud", "Ask to be freed. You might not get the type of attention that you want. (Anything can happen)", "be_loud")
		addButton("Struggle", "Maybe you can escape somehow", "struggle")
		if(!GM.pc.getInventory().hasLockedStaticRestraints()):
			addButton("Escape", "Sweet freedom!", "endthescene")
		else:
			addDisabledButton("Escape", "You can't escape while the stocks are locked")

	if(state == "wait"):
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

	if(state == "sleeping"):
		saynn("You can’t sense anyone around, it seems to be very late. All the lights around you begin to turn off one by one. Wow, did they forget about you.")
		
		saynn("Seems like you will have to sleep like this, stuck in stocks.")
		
		addButton("Sleep", "Oh well", "aftersleep")

	if(state == "aftersleep"):
		saynn("You wake up on time just like everyone else but with one difference, you’re still bound in stocks.")

		saynn("Welcome to day "+str(GM.main.getDays())+" of your sentence")
		
		addButton("Continue", "What's next", "")

func triggerRandomEvent(escapeChance, _lewdChance, _willingSexChance, _unWillingSexChance, _nothingChance):
	var eventType = RNG.pickWeighted(["StocksEscape", "StocksEvent", "StocksWillingSex", "StocksUnWillingSex", ""], [escapeChance, _lewdChance, _willingSexChance, _unWillingSexChance, _nothingChance])
	
	if(eventType == "StocksEscape"):
		if(GM.ES.triggerReact("StocksEscape")):
			endScene()
			return true
	
	if(eventType == "StocksEvent"):
		if(GM.ES.triggerReact("StocksEvent")):
			return true

			
	if(eventType == "StocksWillingSex"):
		if(GM.ES.triggerReact("StocksWillingSex")):
			return true
			
	if(eventType == "StocksUnWillingSex"):
		if(GM.ES.triggerReact("StocksUnWillingSex")):
			return true
	
	return false

func getEscapeChance(isLoud = false):
	if(amountOfEventsPassed < 10):
		return 0.0
	if(amountOfEventsPassed > 40):
		return 10.0
		
	if(isLoud):
		return max(3.0, amountOfEventsPassed / 8.0)
		
	return max(2.0, amountOfEventsPassed / 10.0)

func _react(_action: String, _args):
	if(_action == "aftersleep"):
		GM.main.startNewDay()
		GM.pc.afterSleeping()
		GM.main.showLog()
	
	if(_action == "wait" || _action == "be_loud"):
		processTime(60*30)
		if(GM.main.isVeryLate()):
			setState("sleeping")
			return

	
	if(_action == "afterbeloud"):
		GM.pc.addStamina(50)
		triggerRandomEvent(getEscapeChance(true), 20, 30, 30, 30)
		setState("")
		GM.main.showLog()
		amountOfEventsPassed += 1
		return
	
	if(_action == "afterjustwait"):
		GM.pc.addStamina(50)
		triggerRandomEvent(getEscapeChance(), 20, 20, 0, 50)
		setState("")
		GM.main.showLog()
		amountOfEventsPassed += 1
		return
	
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "struggle"):
		runScene("StrugglingScene", [false, false])
		setState("")
		return
	
	setState(_action)

func _onSceneEnd():
	GM.pc.getInventory().clearStaticRestraints()


func saveData():
	var data = .saveData()
	
	data["amountOfEventsPassed"] = amountOfEventsPassed
	
	return data
	
func loadData(data):
	.loadData(data)
	
	amountOfEventsPassed = SAVE.loadVar(data, "amountOfEventsPassed", 0)

func getDebugActions():
	return [
		{
			"id": "instantEscape",
			"name": "Instant escape",
			"args": [
			],
		},
	]

func doDebugAction(_id, _args = {}):
	if(_id == "instantEscape"):
		endScene()
		GM.main.reRun()
