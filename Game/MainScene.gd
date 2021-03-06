extends Node
class_name MainThing

onready var gameUI = $GameUI
var sceneStack: Array = []
var messages: Array = []
var logMessages: Array = []
var currentDay = 0
var timeOfDay = 6*60*60 # seconds since 00:00
var flags = {}
var moduleFlags = {}
var playerScene = preload("res://Player/Player.tscn")
var overridenPC
var originalPC
var roomMemories = {}

signal time_passed(_secondsPassed)

func _init():
	GlobalRegistry.recreateCharacters()

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

func _on_GameUI_on_option_button(method, args):
	pickOption(method, args)
	
func pickOption(method, args):
	GM.main.clearMessages()
	GM.ES.clearDelayedEvents()
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
		
		GM.ES.doDelayedEvents()
		
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
	reRun()

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
	flags[flagID] = value

func increaseFlag(flagID, addvalue = 1):
	if(!flags.has(flagID)):
		flags[flagID] = 0
	flags[flagID] += addvalue

func getFlag(flagID, defaultValue = null):
	if(!flags.has(flagID)):
		return defaultValue
	
	return flags[flagID]

func setModuleFlag(moduleID, flagID, value):
	if(!moduleFlags.has(moduleID)):
		moduleFlags[moduleID] = {}
	moduleFlags[moduleID][flagID] = value

func increaseModuleFlag(moduleID, flagID, addvalue = 1):
	if(!moduleFlags.has(moduleID)):
		moduleFlags[moduleID] = {}
	if(!moduleFlags[moduleID].has(flagID)):
		moduleFlags[moduleID][flagID] = 0
	moduleFlags[moduleID][flagID] += addvalue

func getModuleFlag(moduleID, flagID, defaultValue = null):
	if(!moduleFlags.has(moduleID) || !moduleFlags[moduleID].has(flagID)):
		return defaultValue
	
	return moduleFlags[moduleID][flagID]

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

func getRandomSceneFor(sceneType):
	var resultScenes = []
	
	var modules = GlobalRegistry.getModules()
	for moduleID in modules:
		var module : Module = modules[moduleID]
		
		var moduleScenes = module.getRandomSceneFor(sceneType)
		if(moduleScenes == null || !(moduleScenes is Array)):
			continue
		if(moduleScenes.size() > 0 && !(moduleScenes[0] is Array)):
			printerr("Module "+str(moduleID)+" returns bad getRandomSceneFor() data")
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
