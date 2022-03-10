extends Node
class_name MainThing

onready var gameUI = $GameUI
var sceneStack: Array = []
var messages: Array = []
var currentDay = 0
var timeOfDay = 6*60*60 # seconds since 00:00
var flags = {}

signal time_passed(_secondsPassed)

func _init():
	GlobalRegistry.recreateCharacters()

func _exit_tree():
	GM.main = null
	
# Called when the node enters the scene tree for the first time.
func _ready():
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
	var scene = GlobalRegistry.getScene(id)
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
	GM.main.clearMessages()
	GM.ES.clearDelayedEvents()
	
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

func saveData():
	var data = {}
	data["messages"] = messages
	data["timeOfDay"] = timeOfDay
	data["currentDay"] = currentDay
	data["flags"] = flags
	data["EventSystem"] = GM.ES.saveData()
	
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
	GM.ES.loadData(SAVE.loadVar(data, "EventSystem", {}))
	
	var scenes = SAVE.loadVar(data, "scenes", [])
	
	for scene in sceneStack:
		scene.queue_free()
	sceneStack = []
	
	GM.ui.setCharacterData(null)
	GM.ui.setCharactersPanelVisible(false)
	for sceneData in scenes:
		var id = SAVE.loadVar(sceneData, "id", "error")
		
		var scene = GlobalRegistry.getScene(id)
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
	
	if(timeOfDay > getTimeCap()):
		timeOfDay = getTimeCap()

	doTimeProcess(_seconds)

func doTimeProcess(_seconds):
	GM.pc.processTime(_seconds)
	GM.ui.onTimePassed(_seconds)
	
	emit_signal("time_passed", _seconds)

func processTimeUntil(newseconds):
	if(timeOfDay >= newseconds):
		return
	
	var timeDiff = newseconds - timeOfDay
	
	timeOfDay = newseconds
	doTimeProcess(timeDiff)
	return timeDiff
	
func startNewDay():
	var newtime = 6 * 60 * 60
	var timediff = 24 * 60 * 60 - timeOfDay + newtime
	
	currentDay += 1
	timeOfDay = newtime
	
	Flag.resetFlagsOnNewDay()
	
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
