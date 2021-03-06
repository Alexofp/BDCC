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
var currentCharacters: Array = []
var fightCharacter: String = ""
var sceneTag = ""
#var currentCharacter: String = ""
var sceneEndedFlag = false
var sceneEndedArgs

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
	clearFightCharacter()
	_initScene(args)
	_reactInit()
	
	checkSceneEnded()

func run():
	GM.ui.clearText()
	GM.ui.clearButtons()
	GM.ui.clearUItextboxes()
	_run()
	
	GM.pc.updateEffectPanel(GM.ui.getPlayerStatusEffectsPanel())
	if(fightCharacter):
		var character = GlobalRegistry.getCharacter(fightCharacter)
		character.updateEffectPanel(GM.ui.getNPCStatusEffectsPanel())
	for id in currentCharacters:
		var character = GlobalRegistry.getCharacter(id)
		if(!character):
			continue
		character.updateNonBattleEffects()
	GM.ui.getCharactersPanel().updateStatuses()
	
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

func setFightCharacter(id: String):
	if(id == ""):
		clearFightCharacter()
		return
	
	var character = GlobalRegistry.getCharacter(id)
	if(!character):
		return
	GM.ui.setCharacterData(character)
	fightCharacter = id

func clearFightCharacter():
	GM.ui.setCharacterData(null)

func updateFightCharacter():
	setFightCharacter(fightCharacter)

func updateCharactersPanelVisibility():
	if(currentCharacters.size() > 0):
		GM.ui.setCharactersPanelVisible(true)
	else:
		GM.ui.setCharactersPanelVisible(false)

func setCharacter(id: String):
	if(id == ""):
		clearCharacter()
		return
	
	var character = GlobalRegistry.getCharacter(id)
	if(!character):
		return
	currentCharacters = [id]
	GM.ui.getCharactersPanel().clear()
	GM.ui.getCharactersPanel().addCharacter(id)
	updateCharactersPanelVisibility()

func addCharacter(id: String):
	if(id == ""):
		return
	if(currentCharacters.has(id)):
		return
	currentCharacters.append(id)
	GM.ui.getCharactersPanel().addCharacter(id)
	updateCharactersPanelVisibility()

func removeCharacter(id: String):
	if(currentCharacters.has(id)):
		currentCharacters.erase(id)
		GM.ui.getCharactersPanel().removeCharacter(id)
		updateCharactersPanelVisibility()

func updateCharacter():
	GM.ui.getCharactersPanel().clear()
	for id in currentCharacters:
		var character = GlobalRegistry.getCharacter(id)
		if(!character):
			continue
		GM.ui.getCharactersPanel().addCharacter(id)
	updateCharactersPanelVisibility()

func clearCharacter():
	currentCharacters = []
	GM.ui.getCharactersPanel().clear()
	updateCharactersPanelVisibility()

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
	updateFightCharacter()
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

func saveData():
	var data = {}
	data["state"] = state
	data["currentCharacters"] = currentCharacters
	data["fightCharacter"] = fightCharacter
	data["sceneTag"] = sceneTag
	
	return data

func loadData(data):
	state = SAVE.loadVar(data, "state", "")
	currentCharacters = SAVE.loadVar(data, "currentCharacters", [])
	fightCharacter = SAVE.loadVar(data, "fightCharacter", "")
	sceneTag = SAVE.loadVar(data, "sceneTag", "")
	updateCharacter()
