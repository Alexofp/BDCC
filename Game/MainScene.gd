extends Node
class_name MainScene

onready var gameUI = $GameUI
var sceneStack: Array = []
var messages: Array = []
var logMessages: Array = []
var currentDay = 0
var timeOfDay = 6*60*60 # seconds since 00:00
var flags = {}
var flagsCache = null
var moduleFlags = {}
var playerScene = preload("res://Player/Player.tscn")
var overridenPC
var originalPC
var roomMemories = {}

signal time_passed(_secondsPassed)

func _init():
	GlobalRegistry.recreateCharacters()
	flagsCache = Flag.getFlags()

func overridePC():
	if(overridenPC != null):
		assert(false, "Trying to override player twice!")
		return
	
	Util.remove_all_signals(originalPC)
			
	var newpc = playerScene.instance()
	overridenPC = newpc
	GM.pc = newpc
	connectSignalsToPC(newpc)
	add_child(newpc)
	
func clearOverridePC():
	if(overridenPC == null):
		assert(false, "Player wasn't overridden when we are trying to clear it")
		return
	overridenPC.queue_free()
	overridenPC = null
	GM.pc = originalPC
	connectSignalsToPC(originalPC)
	
func getCurrentPC():
	if(overridenPC != null):
		return overridenPC
	return originalPC

func getOriginalPC():
	return originalPC
	
func getOverriddenPC():
	return overridenPC

func connectSignalsToPC(who):
	var _s = who.connect("levelChanged", self, "_on_Player_levelChanged")
	_s = who.connect("orificeBecomeMoreLoose", self, "_on_Player_orificeBecomeMoreLoose")
	_s = who.connect("exchangedCumDuringRubbing", self, "_on_Player_exchangedCumDuringRubbing")
	_s = who.connect("skillLevelChanged", self, "_on_Player_skillLevelChanged")
	_s = who.connect("stat_changed", $GameUI, "_on_Player_stat_changed")

func _exit_tree():
	GM.main = null
	
# Called when the node enters the scene tree for the first time.
func _ready():
	var pc = playerScene.instance()
	originalPC = pc
	GM.pc = pc
	connectSignalsToPC(pc)
	add_child(pc)
	
	randomize()
	GM.main = self

	startNewGame()
	
	runCurrentScene()
	GM.ui.onTimePassed(0)
	
	Console.addCommand("setflag", self, "consoleSetFlagBool", ["flagID", "trueOrFalse"], "Changes the game flag, be very careful")
	Console.addCommand("clearflag", self, "consoleClearFlag", ["flagID"], "Resets the game flag, be very careful")
	Console.addCommand("setmoduleflag", self, "consoleSetModuleFlagBool", ["moduleID", "flagID", "trueOrFalse"], "Changes the game flag, be very careful")
	Console.addCommand("clearmoduleflag", self, "consoleClearModuleFlag", ["moduleID", "flagID"], "Resets the game flag, be very careful")
	applyAllWorldEdits()
	
func startNewGame():
	for scene in sceneStack:
		scene.queue_free()
	sceneStack = []
	
	runScene("IntroScene")
	#runScene("FightScene", ["testchar"])
	#runScene("FightScene", ["tavi"])

func runScene(id, _args = []):
	var scene = GlobalRegistry.createScene(id)
	assert(scene != null, "SCENE WITH ID "+str(id)+" IS NOT FOUND")
	add_child(scene)
	sceneStack.append(scene)
	print("Starting scene "+id)
	
	scene.initScene(_args)
	#scene.run()
	return scene

func removeScene(scene, args = []):
	if(sceneStack.has(scene)):
		if(scene == sceneStack.back()):
			var savedTag = scene.sceneTag
			sceneStack.erase(scene)
			if(sceneStack.size() > 0):
				sceneStack.back().react_scene_end(savedTag, args)
			#if(sceneStack.size() > 0):
			#	sceneStack.back().run()
		else:
			sceneStack.erase(scene)
	
	if(sceneStack.size() == 0):
		print("Error: no more scenes in the scenestack")
		gameUI.clearText()
		gameUI.clearButtons()
		gameUI.say("Error: no more scenes in the scenestack. Please let the developer know")
		return

func getCurrentScene():
	if(sceneStack.size() > 0):
		return sceneStack.back()
	return null

func endCurrentScene():
	var currentScene = getCurrentScene()
	if(currentScene != null):
		currentScene.endScene()

func _on_GameUI_on_option_button(method, args):
	pickOption(method, args)
	
func pickOption(method, args):
	GM.main.clearMessages()
	GlobalTooltip.resetTooltips()
	
	if(GM.ES.checkButtonInput(method, args)):
		pass
		
	elif(sceneStack.size() > 0):
		sceneStack.back().react(method, args)
		#if(sceneStack.back().react(method, args)):
		#	return

	runCurrentScene()

func runCurrentScene():
	if(sceneStack.size() > 0):
		sceneStack.back().run()
		
		if(messages.size() > 0):
			GM.ui.trimLineEndings()
			GM.ui.say("\n\n")
			GM.ui.say("[center][i]")
			for message in messages:
				GM.ui.say(message)
				GM.ui.say("\n")
			GM.ui.say("[/i][/center]\n")
	updateStuff()

func reRun():
	runCurrentScene()

func loadingSavefileFinished():
	GM.ui.recreateWorld()
	reRun()
	
	applyAllWorldEdits()
	
func applyAllWorldEdits():
	var worldEdits = GlobalRegistry.getWorldEdits()
	for worldEditID in worldEdits:
		var worldEdit = worldEdits[worldEditID]
		worldEdit.apply(GM.world)

func applyWorldEdit(id):
	var worldEdits = GlobalRegistry.getWorldEdits()
	if(worldEdits.has(id)):
		worldEdits[id].apply(GM.world)

func canSave():
	for scene in sceneStack:
		if(!scene.canSave()):
			return false
	
	return true

func supportsBattleTurns():
	for scene in sceneStack:
		if(scene.supportsBattleTurns()):
			return true
	
	return false

func saveData():
	var data = {}
	data["messages"] = messages
	data["timeOfDay"] = timeOfDay
	data["currentDay"] = currentDay
	data["flags"] = flags
	data["moduleFlags"] = moduleFlags
	data["EventSystem"] = GM.ES.saveData()
	data["ChildSystem"] = GM.CS.saveData()
	data["logMessages"] = logMessages
	data["roomMemories"] = roomMemories
	
	data["scenes"] = []
	for scene in sceneStack:
		var sceneData = {}
		sceneData["id"] = scene.sceneID
		sceneData["sceneData"] = scene.saveData()
		data["scenes"].append(sceneData)
	
	return data

func loadData(data):
	if(SAVE.isUpdatingFromSaveVersion(1)):
		SaveConversion.fixFlagsFromVersion1(self, data)
	
	messages = SAVE.loadVar(data, "messages", [])
	timeOfDay = SAVE.loadVar(data, "timeOfDay", 6*60*60)
	currentDay = SAVE.loadVar(data, "currentDay", 0)
	GM.ui.onTimePassed(0)
	flags = SAVE.loadVar(data, "flags", {})
	moduleFlags = SAVE.loadVar(data, "moduleFlags", {})
	GM.ES.loadData(SAVE.loadVar(data, "EventSystem", {}))
	GM.CS.loadData(SAVE.loadVar(data, "ChildSystem", {}))
	logMessages = SAVE.loadVar(data, "logMessages", [])
	roomMemories = SAVE.loadVar(data, "roomMemories", {})
	
	var scenes = SAVE.loadVar(data, "scenes", [])
	
	for scene in sceneStack:
		scene.queue_free()
	sceneStack = []
	
	GM.ui.setCharacterData(null)
	GM.ui.setCharactersPanelVisible(false)
	for sceneData in scenes:
		var id = SAVE.loadVar(sceneData, "id", "error")
		
		var scene = GlobalRegistry.createScene(id)
		add_child(scene)
		sceneStack.append(scene)
		print("Starting scene "+id)
		
		#scene.initScene(_args)
		scene.loadData(SAVE.loadVar(sceneData, "sceneData", {}))

func addMessage(text: String):
	messages.append(text)

func getMessages():
	return messages

func clearMessages():
	messages = []

func getTimeCap():
	return 23 * 60 * 60

func isVeryLate():
	return timeOfDay >= getTimeCap()

func processTime(_seconds):
	_seconds = int(round(_seconds))
	
	timeOfDay += _seconds
	
	doTimeProcess(_seconds)

func doTimeProcess(_seconds):
	# This splits long sleeping times into 1 hour chunks
	var copySeconds = _seconds
	while(copySeconds > 0):
		var clippedSeconds = min(60*60, copySeconds)
		GM.pc.processTime(clippedSeconds)
		var characters = GlobalRegistry.getCharacters()
		for characterID in characters:
			var character = characters[characterID]
			character.processTime(clippedSeconds)
		
		copySeconds -= clippedSeconds
	
	GM.ui.onTimePassed(_seconds)
	
	var oldHours = int((timeOfDay - _seconds) / 60 / 60)
	var newHours = int(timeOfDay / 60 / 60)
	var hoursPassed = newHours - oldHours

	if(hoursPassed > 0):
		hoursPassed(hoursPassed)
	
	emit_signal("time_passed", _seconds)

func hoursPassed(howMuch):
	GM.pc.hoursPassed(howMuch)
	var characters = GlobalRegistry.getCharacters()
	for characterID in characters:
		var character = characters[characterID]
		character.hoursPassed(howMuch)

func processTimeUntil(newseconds):
	if(timeOfDay >= newseconds):
		return
	
	var timeDiff = newseconds - timeOfDay
	
	timeOfDay = newseconds
	doTimeProcess(timeDiff)
	return timeDiff
	
func startNewDay():
	# We assume that you always go to sleep at 23:00
	if(timeOfDay > getTimeCap()):
		timeOfDay = getTimeCap()
	
	var newtime = 6 * 60 * 60
	var timediff = 24 * 60 * 60 - timeOfDay + newtime
	
	currentDay += 1
	timeOfDay = newtime
	
	Flag.resetFlagsOnNewDay()
	roomMemoriesProcessDay()
	
	doTimeProcess(timediff)
	
	return timediff

func getVisibleTime():
	var text = ""
	if(isVeryLate()):
		text = "Night time"
	else:
		text = Util.getTimeStringHHMM(timeOfDay)
	
	text += ", day " + str(currentDay)
	return text

func getTime():
	return timeOfDay

func getDays():
	return currentDay

func setFlag(flagID, value):
	# Handling "ModuleID.FlagID" here
	var splitData = Util.splitOnFirst(flagID, ".")
	if(splitData.size() > 1):
		setModuleFlag(splitData[0], splitData[1], value)
		return
	
	if(!flagsCache.has(flagID)):
		Log.printerr("setFlag(): Detected the usage of an unknown flag: "+str(flagID)+" "+Util.getStackFunction())
		return
	
	if("type" in flagsCache[flagID]):
		var flagType = flagsCache[flagID]["type"]
		if(!FlagType.isCorrectType(flagType, value)):
			Log.printerr("setFlag(): Wrong type for flag "+str(flagID)+". Value: "+str(value)+" "+Util.getStackFunction())
			return
			
	flags[flagID] = value

func clearFlag(flagID):
	var splitData = Util.splitOnFirst(flagID, ".")
	if(splitData.size() > 1):
		clearModuleFlag(splitData[0], splitData[1])
		return
	
	flags.erase(flagID)

func increaseFlag(flagID, addvalue = 1):
	setFlag(flagID, getFlag(flagID, 0) + addvalue)

func getFlag(flagID, defaultValue = null):
	var splitData = Util.splitOnFirst(flagID, ".")
	if(splitData.size() > 1):
		return getModuleFlag(splitData[0], splitData[1], defaultValue)
	
	if(!flagsCache.has(flagID)):
		Log.printerr("getFlag(): Detected the usage of an unknown flag: "+str(flagID)+" "+Util.getStackFunction())
		return defaultValue
	
	if(!flags.has(flagID)):
		return defaultValue
	
	return flags[flagID]

func setModuleFlag(moduleID, flagID, value):
	var modules = GlobalRegistry.getModules()
	if(!modules.has(moduleID)):
		Log.printerr("getModuleFlag(): Module "+str(moduleID)+" doesn't exist "+Util.getStackFunction())
		return
	
	var module:Module = modules[moduleID]
	var moduleFlagsCache = module.getFlagsCache()
	
	if(!moduleFlagsCache.has(flagID)):
		Log.printerr("setModuleFlag(): Module is "+str(moduleID)+". Detected the usage of an unknown flag: "+str(flagID)+" "+Util.getStackFunction())
		return
	
	if("type" in moduleFlagsCache[flagID]):
		var flagType = moduleFlagsCache[flagID]["type"]
		if(!FlagType.isCorrectType(flagType, value)):
			Log.printerr("setModuleFlag(): Module is "+str(moduleID)+". Wrong type for flag "+str(flagID)+". Value: "+str(value)+" "+Util.getStackFunction())
			return
	
	if(!moduleFlags.has(moduleID)):
		moduleFlags[moduleID] = {}
	moduleFlags[moduleID][flagID] = value
	

func increaseModuleFlag(moduleID, flagID, addvalue = 1):
	setModuleFlag(moduleID, flagID, getModuleFlag(moduleID, flagID, 0) + addvalue)

func getModuleFlag(moduleID, flagID, defaultValue = null):
	var modules = GlobalRegistry.getModules()
	if(!modules.has(moduleID)):
		Log.printerr("getModuleFlag(): Module "+str(moduleID)+" doesn't exist "+Util.getStackFunction())
		return defaultValue
	
	var module:Module = modules[moduleID]
	var moduleFlagsCache = module.getFlagsCache()
	
	if(!moduleFlagsCache.has(flagID)):
		Log.printerr("getModuleFlag(): Module is "+str(moduleID)+". Detected the usage of an unknown flag: "+str(flagID)+" "+Util.getStackFunction())
		return defaultValue
	
	if(!moduleFlags.has(moduleID) || !moduleFlags[moduleID].has(flagID)):
		return defaultValue
	
	return moduleFlags[moduleID][flagID]

func clearModuleFlag(moduleID, flagID):
	if(!moduleFlags.has(moduleID) || !moduleFlags[moduleID].has(flagID)):
		return
	moduleFlags[moduleID].erase(flagID)

func resolveCustomCharacterName(charID):
	if(sceneStack.size() > 0):
		return sceneStack.back().resolveCustomCharacterName(charID)
	return null

func updateStuff():
	if(GM.pc == null):
		return
	
	var playerIsBlindfolded = GM.pc.isBlindfolded()
	GM.world.setDarknessVisible(playerIsBlindfolded)
	if(playerIsBlindfolded):
		if(GM.pc.canHandleBlindness()):
			GM.world.setDarknessSize(64)
		else:
			GM.world.setDarknessSize(16)
			
	for worldEdit in GlobalRegistry.getRegularWorldEdits():
		worldEdit.apply(GM.world)


func _on_Player_levelChanged():
	if(GM.ui):
		GM.ui.makeSkillsButtonFlash()
		addMessage("You reached a new level!")


func _on_Player_skillLevelChanged(_skillID):
	if(GM.ui):
		GM.ui.makeSkillsButtonFlash()
		
		var skill: SkillBase = GM.pc.getSkillsHolder().getSkill(_skillID)
		
		addMessage("Your '"+skill.getVisibleName()+"' skill has increased to level "+str(skill.getLevel())+"!")
		

func _on_Player_orificeBecomeMoreLoose(orificeName, _newvalue, _oldvalue):
	addMessage("Your "+orificeName+" is stretched and is now more used to the insertions")

func _on_Player_exchangedCumDuringRubbing(senderName, receiverName):
	addMessage(receiverName + " stole some cum from "+senderName+" during tribbing")

func getRandomSceneFor(sceneType):
	var resultScenes = []
	
	var modules = GlobalRegistry.getModules()
	for moduleID in modules:
		var module : Module = modules[moduleID]
		
		var moduleScenes = module.getRandomSceneFor(sceneType)
		if(moduleScenes == null || !(moduleScenes is Array)):
			continue
		if(moduleScenes.size() > 0 && !(moduleScenes[0] is Array)):
			Log.printerr("Module "+str(moduleID)+" returns bad getRandomSceneFor() data")
			continue
		resultScenes.append_array(moduleScenes)
	
	return RNG.pickWeightedPairs(resultScenes)

func addLogMessage(title: String, message: String):
	logMessages.append({
		"title": title,
		"message": message,
	})

func showLog():
	if(logMessages.size() > 0):
		var scene = runScene("MessagesLogScene", [])
		scene.sceneTag = "messageslog"
		return true
	return false

func getLogMessages():
	return logMessages

func clearLog():
	logMessages.clear()

func playAnimation(sceneID, actionID, args = []):
	if(GM.ui != null):
		GM.ui.getStage3d().play(sceneID, actionID, args)

func updateSubAnims():
	if(GM.ui != null):
		GM.ui.getStage3d().updateSubAnims()

func addRoomMemory(roomID, text, days):
	roomMemories[roomID] = {
		"text": text,
		"days": days,
	}
	
func addRoomMemoryCurrentLoc(text, days):
	if(GM.pc == null):
		return
	addRoomMemory(GM.pc.getLocation(), text, days)

func getRoomMemory(roomID):
	if(!roomMemories.has(roomID)):
		return null
	return roomMemories[roomID]["text"]

func roomMemoriesProcessDay():
	for roomID in roomMemories.keys():
		var data = roomMemories[roomID]
		data["days"] -= 1
		
		if(data["days"] <= 0):
			roomMemories.erase(roomID)

func getDebugActions():
	return [
		{
			"id": "giveItem",
			"name": "Give player item",
			"args": [
				{
					"id": "itemID",
					"name": "Item id",
					"type": "list",
					"item": true,
				},
				{
					"id": "amount",
					"name": "Amount",
					"type": "number",
					"value": 1,
					"onlyPositive": true,
				},
			]
		},
		{
			"id": "addPain",
			"name": "Add pain PC",
			"args": [
				{
					"id": "amount",
					"name": "Amount",
					"type": "number",
					"value": 10,
				},
			]
		},
		{
			"id": "addLust",
			"name": "Add lust PC",
			"args": [
				{
					"id": "amount",
					"name": "Amount",
					"type": "number",
					"value": 10,
				},
			]
		},
		{
			"id": "addStamina",
			"name": "Add stamina PC",
			"args": [
				{
					"id": "amount",
					"name": "Amount",
					"type": "number",
					"value": 100,
				},
			]
		},
		{
			"id": "addCredits",
			"name": "Add Credits PC",
			"args": [
				{
					"id": "amount",
					"name": "Amount",
					"type": "number",
					"value": 10,
				},
			]
		},
		{
			"id": "healPC",
			"name": "Heal PC",
			"args": [
			]
		},
		{
			"id": "addExp",
			"name": "Add experience PC",
			"args": [
				{
					"id": "amount",
					"name": "Amount",
					"type": "number",
					"value": 100,
				},
			]
		},
		{
			"id": "addSkillExp",
			"name": "Add skill exp. PC",
			"args": [
				{
					"id": "skillID",
					"name": "Skill",
					"type": "list",
					"skill": true,
				},
				{
					"id": "amount",
					"name": "Amount",
					"type": "number",
					"value": 100,
				},
			]
		},
		{
			"id": "resetPCPerks",
			"name": "Reset picked perks",
		},	
		{
			"id": "resetPCStats",
			"name": "Reset picked stats",
		},
		{
			"id": "characterCreator",
			"name": "Open character creator",
		},
		{
			"id": "runScene",
			"name": "Run scene",
			"args": [
				{
					"id": "sceneID",
					"name": "Scene ID",
					"type": "string",
					"value": "",
				},
			]
		},
		{
			"id": "removePCRestraints",
			"name": "Remove all restraints",
		},
		{
			"id": "openConsole",
			"name": "Open console",
		},
	]

func doDebugAction(id, args = {}):
	print(id, " ", args)
	
	if(id == "healPC"):
		GM.pc.addPain(-GM.pc.painThreshold())
		GM.pc.addLust(-GM.pc.lustThreshold())
		GM.pc.addStamina(GM.pc.getMaxStamina())
	
	if(id == "addPain"):
		GM.pc.addPain(args["amount"])
	
	if(id == "addLust"):
		GM.pc.addLust(args["amount"])
		
	if(id == "addStamina"):
		GM.pc.addStamina(args["amount"])
		
	if(id == "addCredits"):
		GM.pc.addCredits(args["amount"])
	
	if(id == "addExp"):
		GM.pc.addExperience(args["amount"])
	
	if(id == "addSkillExp"):
		GM.pc.addSkillExperience(args["skillID"], args["amount"])
	
	if(id == "resetPCPerks"):
		GM.pc.getSkillsHolder().resetPickedPerks()
	
	if(id == "resetPCStats"):
		GM.pc.getSkillsHolder().resetStats()
	
	if(id == "characterCreator"):
		runScene("CharacterCreatorScene", [true])
	
	if(id == "runScene"):
		runScene(args["sceneID"])
	
	if(id == "removePCRestraints"):
		GM.pc.removeAllRestraints()
	
	if(id == "giveItem"):
		var item:ItemBase = GlobalRegistry.createItem(args["itemID"])
		if(item.canCombine()):
			item.setAmount(args["amount"]) 
			GM.pc.getInventory().addItem(item)
			Log.print("Item "+item.getStackName()+" added to player")
		else:
			GM.pc.getInventory().addItem(item)
			args["amount"] -= 1
			while(args["amount"] > 0):
				item = GlobalRegistry.createItem(args["itemID"])
				GM.pc.getInventory().addItem(item)
				args["amount"] -= 1
			Log.print("Item "+item.getStackName()+" added to player")
		
	if(id == "openConsole"):
		Console.toggleConsole()

func consoleSetFlagBool(flagID, valuestr):
	var value = false
	if(valuestr in ["true", "TRUE", "True", "1"]):
		value = true
	elif(valuestr in ["false", "FALSE", "False", "0"]):
		value = false
	else:
		Console.printLine("Accept values are true or false")
		return
		
	setFlag(flagID, value)
	Console.printLine("Flag set")

func consoleSetModuleFlagBool(moduleID, flagID, valuestr):
	var value = false
	if(valuestr in ["true", "TRUE", "True", "1"]):
		value = true
	elif(valuestr in ["false", "FALSE", "False", "0"]):
		value = false
	else:
		Console.printLine("Accept values are true or false")
		return
		
	setModuleFlag(moduleID, flagID, value)
	Console.printLine("Flag set")

func consoleClearFlag(flagID):
	clearFlag(flagID)
	Console.printLine("Flag cleared")
	
func consoleClearModuleFlag(moduleID, flagID):
	clearModuleFlag(moduleID, flagID)
	Console.printLine("Flag cleared")
