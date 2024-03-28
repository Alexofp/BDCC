extends "res://Scenes/SceneBase.gd"

var uniqueItemID = ""

func _initScene(_args = []):
	if(_args.size() > 0):
		uniqueItemID = _args[0]

func _init():
	sceneID = "PortalPantiesTakeOffScene"

func _run():

	if(state == ""):
		if(!GM.QS.isActive("PortalPantiesQuest")):
			playAnimation(StageScene.Solo, "stand", {bodyState={exposedCrotch=true}})
			saynn("What do you wanna do with your portal panties?")
			
			var currentMode = getFlag("PortalPantiesModule.Panties_Mode", 0)
			if(currentMode == 0):
				saynn("Current event frequency: normal")
			elif(currentMode == 1):
				saynn("Current event frequency: rare")
			elif(currentMode == 2):
				saynn("Current event frequency: very rare")
			elif(currentMode == -1):
				saynn("Current event frequency: often")
			
			var item = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
			if(item != null):
				if(item.coversPenis):
					saynn("Your portal panties will currently also create a portal for your penis."+(" (If you'd had one)" if !GM.pc.hasPenis() else ""))
				else:
					saynn("Your portal panties are not hiding your penis, allowing you to use it."+(" (If you'd had one)" if !GM.pc.hasPenis() else ""))
			
			addButton("Take off", "Take portal panties off", "takeoff")
			addButton("Change mode", "Change how often the events are happening", "changemode")
			addButton("Penis", "Toggle if you want the portal panties to hide your penis or not", "changepenismode")
			addButton("Nothing", "Don't touch them", "endthescene")
		else:		
			saynn("You try to take off your portal panties but no matter what you do, the magnetic locks prevent you from doing so.")

			saynn("They seem to only allow being temporarily taken off on very rare occasions.")

			addButton("Continue", "Oh well, what can you do", "endthescene")
	
	if(state == "changemode"):
		saynn("How often you want the events to happen")
		
		var currentMode = getFlag("PortalPantiesModule.Panties_Mode", 0)
		if(currentMode == 0):
			saynn("Current frequency: normal")
		elif(currentMode == 1):
			saynn("Current frequency: rare")
		elif(currentMode == 2):
			saynn("Current frequency: very rare")
		elif(currentMode == -1):
			saynn("Current frequency: often")
			
		addButton("Very rare", "You will be poked very rarely", "setMode", [2])
		addButton("Rare", "You will be poked sometimes", "setMode", [1])
		addButton("Normal", "You will be poked sometimes", "setMode", [0])
		addButton("Often", "You will be poked quite often", "setMode", [-1])
		addButton("Back", "You don't wanna change the mode", "")

func _react(_action: String, _args):
	if(_action == "setMode"):
		setFlag("PortalPantiesModule.Panties_Mode", _args[0])
		setFlag("PortalPantiesModule.Panties_SceneCooldown", 0)
		return
		
	if(_action == "changepenismode"):
		var item = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
		if(item != null):
			item.coversPenis = !item.coversPenis
		return
	
	if(_action == "takeoff"):
		endScene()
		runScene("TakeAnyItemOffScene", [uniqueItemID])
		return
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()
	
	data["uniqueItemID"] = uniqueItemID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	uniqueItemID = SAVE.loadVar(data, "uniqueItemID", "")
