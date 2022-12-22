extends Node
class_name SceneBase

#signal sayText(text)
#signal clearText
#signal answered
#signal clearButtons
#signal addButton(text, method, tooltip)
#signal addDisabledButton(text, tooltip)
signal sceneEnded(result)
var state: String = ""
var sceneID: String = "UNREGISTERED_SCENE"
var currentCharactersVariants: Dictionary = {}
var sceneTag = ""
#var currentCharacter: String = ""
var sceneEndedFlag = false
var sceneEndedArgs
var showFightUI = false

func _run():
	pass

func _react(_action: String, _args):
	pass
	
	#if(has_method(method)):
	#	GM.ui.clearText()
	#	GM.ui.clearButtons()
		
	#	callv(method, [_args])
	#else:
	#	print("Error: method with the name '"+method+"' is not found in "+name + " ("+sceneID+")")

func _react_scene_end(_tag, _result):
	pass

func _initScene(_args = []):
	pass

func _reactInit():
	pass

# Utility
func initScene(args = []):
	clearCharacter()
	_initScene(args)
	_reactInit()
	
	checkSceneEnded()

func run():
	GM.ui.clearText()
	GM.ui.clearButtons()
	GM.ui.clearUItextboxes()
	_run()
	GM.ES.triggerRun(Trigger.SceneAndStateHook, [sceneID, state])
	
	GM.pc.updateEffectPanel(GM.ui.getPlayerStatusEffectsPanel())
	if(showFightUI):
		GM.ui.getCharactersPanel().switchToFightMode()
	else:
		GM.ui.getCharactersPanel().switchToNormalMode()
		
	for id in currentCharactersVariants:
		var character = GlobalRegistry.getCharacter(id)
		if(!character):
			continue
		character.updateNonBattleEffects()
	GM.ui.updateCharactersInPanel()
	GM.ui.setSceneCreator(getSceneCreator())
	
	checkSceneEnded()
		
func checkSceneEnded():
	if(sceneEndedFlag):
		_onSceneEnd()
		GM.main.removeScene(self, sceneEndedArgs)
		emit_signal("sceneEnded", sceneEndedArgs)
		print("removing scene "+name)
		
		queue_free()
	
func react(_action: String, _args):
	var result = _react(_action, _args)
	checkSceneEnded()
	return result

func setState(newState: String):
	state = newState

func say(_text: String):
	if(GM.ui):
		GM.ui.say(_text)
	#emit_signal("sayText", _text)

func sayn(_text: String):
	say(_text+"\n")

func saynn(_text: String):
	say(_text+"\n\n")

func addCharacter(id: String, variant: Array = []):
	if(id == ""):
		return
	currentCharactersVariants[id] = variant
	GM.ui.addCharacterToPanel(id, variant)
	GM.main.startUpdatingCharacter(id)

func removeCharacter(id: String):
	var _ok = currentCharactersVariants.erase(id)
	GM.ui.removeCharacterFromPanel(id)

func hasCharacter(id: String):
	if(currentCharactersVariants.has(id)):
		return true
	return false

func updateCharacter():
	GM.ui.clearCharactersPanel()
	for id in currentCharactersVariants:
		var character = GlobalRegistry.getCharacter(id)
		if(!character):
			continue
		GM.ui.addCharacterToPanel(id, currentCharactersVariants[id])

func clearCharacter():
	currentCharactersVariants.clear()
	GM.ui.clearCharactersPanel()

func _onSceneEnd():
	pass

func endScene(result = []):
	sceneEndedFlag = true
	sceneEndedArgs = result

func runScene(id: String, args = [], tag = ""):
	var scene = GM.main.runScene(id, args)
	scene.sceneTag = tag

func react_scene_end(_tag, _result):
	print(name+": The scene before me has ended")
	updateCharacter()
	_react_scene_end(_tag, _result)
	checkSceneEnded()

func addNextButton(method: String, args = []):
	if(GM.ui):
		GM.ui.addButton("Next", "", method, args)
	#addButton("Next")

func addButton(text: String, tooltip: String = "", method: String = "", args = []):
	GM.ui.addButton(text, tooltip, method, args)
	#emit_signal("addButton", text, method, tooltip)
	
func addDisabledButton(text: String, tooltip: String = ""):
	GM.ui.addDisabledButton(text, tooltip)
	#emit_signal("addDisabledButton", text, tooltip)

func addButtonAt(index:int, text: String, tooltip: String = "", method: String = "", args = []):
	GM.ui.addButtonAt(index, text, tooltip, method, args)
	
func addDisabledButtonAt(index:int, text: String, tooltip: String = ""):
	GM.ui.addDisabledButtonAt(index, text, tooltip)

func addButtonUnlessLate(text: String, tooltip: String = "", method: String = "", args = [], latetext: String = "It's way too late for that"):
	if(GM.main.isVeryLate()):
		addDisabledButton(text, latetext)
	else:
		addButton(text, tooltip, method, args)

func addButtonWithChecks(text: String, tooltip: String, method: String, args, checks: Array):
	var badCheck = ButtonChecks.check(checks)
	if(badCheck == null):
		addButton(text, ButtonChecks.getPrefix(checks) + tooltip, method, args)
	else:
		var reasonText = ButtonChecks.getReasonText(badCheck)
		if(reasonText != ""):
			reasonText = "["+reasonText+"] "
		addDisabledButton(text, ButtonChecks.getPrefix(checks) + reasonText +tooltip)

func addTextbox(id):
	GM.ui.addUITextbox(id)

func getTextboxData(id):
	return GM.ui.getUIdata(id)

func addMessage(text: String):
	GM.main.addMessage(text)

func addExperienceToPlayer(ex: int, showMessage: bool = true):
	if(showMessage):
		addMessage("You received "+str(ex)+" experience")
	GM.pc.addExperience(ex)

func processTime(seconds: int):
	GM.main.processTime(seconds)

func startNewDay():
	return GM.main.startNewDay()

func setFlag(flagID, value):
	GM.main.setFlag(flagID, value)

func getFlag(flagID, defaultValue = null):
	return GM.main.getFlag(flagID, defaultValue)

func increaseFlag(flagID, addvalue = 1):
	GM.main.increaseFlag(flagID, addvalue)

func setModuleFlag(moduleID, flagID, value):
	GM.main.setModuleFlag(moduleID, flagID, value)

func increaseModuleFlag(moduleID, flagID, addvalue = 1):
	GM.main.increaseModuleFlag(moduleID, flagID, addvalue)

func getModuleFlag(moduleID, flagID, defaultValue = null):
	return GM.main.getModuleFlag(moduleID, flagID, defaultValue)

func resolveCustomCharacterName(_charID):
	return null

func canSave():
	return true

func supportsBattleTurns():
	return false

func supportsSexEngine():
	return false

func setLocationName(locationName: String):
	if(GM.pc.isBlindfolded()):
		locationName = "???"
	
	GM.ui.setLocationName(locationName)

func aimCamera(roomID: String):
	GM.world.aimCamera(roomID)

func aimCameraAndSetLocName(roomID: String):
	GM.world.aimCamera(roomID)
	
	var room = GM.world.getRoomByID(roomID)
	if(!room):
		return
	setLocationName(room.getName())

func getCharacter(charID: String) -> BaseCharacter:
	return GlobalRegistry.getCharacter(charID)

func getModule(modID: String) -> Module:
	return GlobalRegistry.getModule(modID)

func getDebugActions():
	return []

func doDebugAction(_id, _args = {}):
	pass

func getSceneCreator():
	var registryCreator = GlobalRegistry.getSceneCreator(sceneID)
	
	if(registryCreator != null && registryCreator != ""):
		return str(registryCreator)
	return null

func playAnimation(theSceneID, theActionID, args = {}):
	if(GM.main != null):
		GM.main.playAnimation(theSceneID, theActionID, args)

func saveData():
	var data = {}
	data["state"] = state
	data["currentCharactersVariants"] = currentCharactersVariants
	data["sceneTag"] = sceneTag
	data["sceneEndedFlag"] = sceneEndedFlag
	data["sceneEndedArgs"] = sceneEndedArgs
	
	return data

func loadData(data):
	state = SAVE.loadVar(data, "state", "")
	currentCharactersVariants = SAVE.loadVar(data, "currentCharactersVariants", {})
	sceneTag = SAVE.loadVar(data, "sceneTag", "")
	sceneEndedFlag = SAVE.loadVar(data, "sceneEndedFlag", false)
	sceneEndedArgs = SAVE.loadVar(data, "sceneEndedArgs", null)
	updateCharacter()