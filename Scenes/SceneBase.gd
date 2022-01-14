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
var sceneArgs = []
var sceneID: String = "UNREGISTERED_SCENE"
var currentCharacters: Array = []
var fightCharacter: String = ""
#var currentCharacter: String = ""

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

func _react_scene_end(_result):
	pass

func _initScene(_args = []):
	pass

# Utility
func initScene(args = []):
	sceneArgs = args
	clearCharacter()
	clearFightCharacter()
	_initScene(args)

func run():
	GM.ui.clearText()
	GM.ui.clearButtons()
	_run()
	GM.pc.updateEffectPanel(GM.ui.getPlayerStatusEffectsPanel())
	if(fightCharacter):
		var character = GlobalRegistry.getCharacter(fightCharacter)
		character.updateEffectPanel(GM.ui.getNPCStatusEffectsPanel())
		
	
func react(_action: String, _args):
	return _react(_action, _args)

func setState(newState: String):
	state = newState

func say(_text: String):
	if(GM.ui):
		GM.ui.say(_text)
	#emit_signal("sayText", _text)

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

func endScene(result = []):
	GM.main.removeScene(self, result)
	emit_signal("sceneEnded", result)
	print("removing self")
	
	queue_free()

func runScene(id: String, args = []):
	GM.main.runScene(id, args)

func react_scene_end(_result):
	print(name+": The scene before me has ended")
	updateCharacter()
	updateFightCharacter()
	_react_scene_end(_result)

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

func canSave():
	return true

func saveData():
	var data = {}
	data["state"] = state
	data["sceneArgs"] = sceneArgs
	data["currentCharacters"] = currentCharacters
	data["fightCharacter"] = fightCharacter
	
	return data

func loadData(data):
	state = SAVE.loadVar(data, "state", "")
	sceneArgs = SAVE.loadVar(data, "sceneArgs")
	currentCharacters = SAVE.loadVar(data, "currentCharacters", [])
	fightCharacter = SAVE.loadVar(data, "fightCharacter", "")
