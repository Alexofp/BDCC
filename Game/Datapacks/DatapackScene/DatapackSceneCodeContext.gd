extends CodeContex
class_name DatapackSceneCodeContext

var scene:SceneBase
var datapackScene:DatapackScene
var datapack:Datapack

var buttons = {}
var curButtonIndex = 0
var usind = 0 #Unique scene index

var storedErrors = []

var sceneReactEndCode = {}

var runMode = false
var reactMode = false

func setDatapackScene(theScene):
	datapackScene = theScene

func setDatapack(theDatapack):
	datapack = theDatapack

func setScene(theScene):
	scene = theScene

func getCharacterActualID(charID:String):
	if(datapackScene.chars.has(charID)):
		return datapackScene.chars[charID]["realid"]
	return charID

func say(text):
	scene.say(processOutputString(text))

func sayn(text):
	scene.sayn(processOutputString(text))

func saynn(text):
	scene.saynn(processOutputString(text))

func hasFlag(theVar:String, _codeblock = null):
	if(GM.main == null):
		return .hasFlag(theVar, _codeblock)
	
	if(!datapack.flags.has(theVar)):
		return false
	return true

func getFlag(theVar:String, defaultValue = null, _codeblock = null):
	if(GM.main == null):
		return .getFlag(theVar, defaultValue, _codeblock)
	
	if(datapack.flags.has(theVar)):
		return GM.main.getDatapackFlag(datapack.id, theVar, defaultValue)
	
	return GM.main.getFlag(theVar, defaultValue)

func setFlag(theVar:String, newValue, _codeblock):
	if(GM.main == null):
		return .setFlag(theVar, newValue, _codeblock)
	
	if(datapack.flags.has(theVar)):
		var varType = datapack.flags[theVar]["type"]
		
		if(varType == DatapackSceneVarType.BOOL && !(newValue is bool)):
			throwError(_codeblock, "Trying to assign a '"+str(newValue)+"' value to a BOOLEAN flag "+str(theVar))
			return
		if(varType == DatapackSceneVarType.STRING && !(newValue is String)):
			throwError(_codeblock, "Trying to assign a '"+str(newValue)+"' value to a STRING flag "+str(theVar))
			return
		if(varType == DatapackSceneVarType.NUMBER && !(newValue is int) && !(newValue is float)):
			throwError(_codeblock, "Trying to assign a '"+str(newValue)+"' value to a NUMBER flag "+str(theVar))
			return
		GM.main.setDatapackFlag(datapack.id, theVar, newValue)
		return
	GM.main.setFlag(theVar, newValue)

func throwError(_codeBlock, _errorText):
	.throwError(_codeBlock, _errorText)
	
	if(_codeBlock == null):
		storedErrors.append("[CrotchScript Error] "+str(_errorText))
	else:
		storedErrors.append("[CrotchScript Error at line "+str(_codeBlock.lineNum)+", block: "+str(_codeBlock.id)+"] "+str(_errorText))

func run():
	runMode = true
	buttons.clear()
	
	var currentStateID = scene.getState()
	
	if(datapackScene.states.has(currentStateID)):
		var currentState:DatapackSceneState = datapackScene.states[currentStateID]
		
		var code = currentState.getCode()
		
		execute(code)
	else:
		saynn("[color=red]State '"+str(currentStateID)+"' is not defined in this scene, bug the creator![/color]")
		scene.addButton("End scene", "Force-end this scene", "endthescene")
		
	if(storedErrors.size() > 0):
		saynn("[color=red]"+Util.join(storedErrors, "\n")+"[/color]")
		storedErrors = []
	runMode = false
	
func react(_id, _args):
	reactMode = true
	if(buttons.has(_id)):
		var buttonData:Dictionary = buttons[_id]
		
		if(buttonData.has("wearstraponon")):
			var strapon = buttonData["wearstraponon"][0]
			var theChar = getCharacter(buttonData["wearstraponon"][1])
			
			if(theChar != null):
				strapon.destroyMe()
				theChar.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)
		
		scene.setState(buttonData["state"])
		execute(buttonData["code"])
		reactMode = false
		return true
	reactMode = false
	return false
	
func saveData():
	var reactEndCodeData = {}
	for sceneTag in sceneReactEndCode:
		reactEndCodeData[sceneTag] = sceneReactEndCode[sceneTag].saveData()
	
	return {
		"vars": vars,
		"usind": usind,
		"sceneEnds": reactEndCodeData,
	}

func loadData(_data):
	vars = loadVar(_data, "vars", {})
	usind = loadVar(_data, "usind", 0)
	
	sceneReactEndCode = {}
	var reactEndCodeData = loadVar(_data, "sceneEnds", {})
	for sceneTag in reactEndCodeData:
		var newSlot:CrotchSlotCalls = CrotchSlotCalls.new()
		newSlot.loadData(reactEndCodeData[sceneTag])
		sceneReactEndCode[sceneTag] = newSlot

func getVar(theVar:String, defaultValue = null):
	if(!vars.has(theVar)):
		if(datapackScene.vars.has(theVar)):
			return datapackScene.vars[theVar]["default"]
	return .getVar(theVar, defaultValue)

func hasVar(theVar:String):
	return vars.has(theVar) || datapackScene.vars.has(theVar)

func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue

func addButton(_nameText, _descText, _state, _codeSlot, _buttonChecks):
	var newButtonID = "button"+str(curButtonIndex)
	
	buttons[newButtonID] = {
		name = _nameText,
		desc = _descText,
		code = _codeSlot,
		state = _state,
	}
	
	if(_buttonChecks is Array && _buttonChecks.size() > 0):
		scene.addButtonWithChecks(_nameText, _descText, newButtonID, [], _buttonChecks)
	else:
		scene.addButton(_nameText, _descText, newButtonID)
	
	curButtonIndex += 1
	return newButtonID

func addStraponButtonsFor(_charName, _nextState, _codeSlot):
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		var buttonID = addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), _nextState, _codeSlot, [])
		buttons[buttonID]["wearstraponon"] = [strapon, _charName]

func returnStraponToPcFrom(_charName):
	var character = getCharacter(_charName)
	if(character != null && character.isWearingStrapon()):
		var strapon = character.getWornStrapon()
		character.getInventory().removeEquippedItem(strapon)
		GM.pc.getInventory().addItem(strapon)
		return true
	return false

func addFilledCondomToLootIfPerk(_charName):
	var character = getCharacter(_charName)
	if(character != null):
		scene.addFilledCondomToLootIfPerk(character.createFilledCondom())

func addDisabledButton(_nameText, _descText):
	scene.addDisabledButton(_nameText, _descText)

func addCharacter(charAlias, _variant):
	if(charAlias == "pc"):
		throwError(null, "Trying to add the player character (pc) into the scene. There is no need to do that")
		return
	
	if(datapackScene.chars.has(charAlias)):
		scene.addCharacter(datapackScene.chars[charAlias]["realid"], _variant.split("-", false))
	else:
		scene.addCharacter(charAlias, _variant.split("-", false))

func removeCharacter(charAlias):
	if(datapackScene.chars.has(charAlias)):
		scene.removeCharacter(datapackScene.chars[charAlias]["realid"])
	else:
		scene.removeCharacter(charAlias)

# Replaces =charID: at the start of the lines with [say=charID] tags
func processSayStatements(text:String):
	var lines = text.split("\n", true)
	var result:Array = []
	for linea in lines:
		var line:String = linea
		
		if(line.begins_with("=")):
			var splitData = Util.splitOnFirst(line.substr(1), ": ")
			if(splitData.size() < 2):
				result.append(line)
			else:
				result.append("[say="+str(splitData[0]).strip_edges()+"]"+str(splitData[1]).strip_edges()+"[/say]")
		else:
			result.append(line)
	return Util.join(result, "\n")

var simpleStringInterpolator:SimpleStringInterpolator = SimpleStringInterpolator.new()

# Handles things like {{varName}} and {{"meow" if varName else "mow"}}
func processOutputVars(text:String):
	return simpleStringInterpolator.process(text, self)

func processOutputString(text:String):
	return processOutputVars(processSayStatements(text))

func doDebugPrint(text):
	doPrint(processOutputVars(text))

func aimCameraAndSetLocName(newLoc):
	scene.aimCameraAndSetLocName(str(newLoc))

func setLocName(newText):
	scene.setLocationName(newText)

func playAnim(animID, animData):
	if(animID == null || animID == "" || animData == null || !GlobalRegistry.getStageScenesClasses().has(animID)):
		throwError(null, "Animation not found! AnimID: "+str(animID))
		return
	if(!animData.has("state") && !animData["state"].has("value")):
		throwError(null, "Animation state not specified, can't play! AnimID: "+str(animID))
		return
	var animStateData = animData["state"]
	var finalState = animStateData["value"]
	if(animStateData.has("isVar") && animStateData["isVar"] && animStateData.has("varName")):
		var newValue = getVar(animStateData["varName"])
		if(newValue == null):
			throwError(null, "Variable for the animation state not found or contains a null, can't play an animation! AnimID: "+str(animID)+" VarName: "+str(animStateData["varName"]))
		else:
			finalState = str(newValue)
			
	if(!GlobalRegistry.getStageScenesCachedStates()[animID].has(finalState)):
		throwError(null, "Animation doesn't support this state! Can't play! AnimID: "+str(animID)+" State: "+str(finalState))
		return
			
	var finalAnimData = {}
	if(animData.has("data")):
		for entryID in animData["data"]:
			var theEntry = animData["data"][entryID]
			
			if("." in entryID):
				var splitData = Util.splitOnFirst(entryID, ".")
				var firstThing = splitData[0]
				var secondThing = splitData[1]
				if(!finalAnimData.has(firstThing)):
					finalAnimData[firstThing] = {}
					
				if(secondThing in ["leashedBy"]):
					var theCharID = getVarOrValueFromAnimEntryString(theEntry, entryID)
					
					var resolvedID = scene.resolveCustomCharacterName(theCharID)
					if(resolvedID != null):
						theCharID = resolvedID
					
					finalAnimData[firstThing][secondThing] = theCharID
				else:
					finalAnimData[firstThing][secondThing] = getVarOrValueFromAnimEntry(theEntry, entryID)
			else:
				if(entryID in ["pc", "npc", "npc2", "npc3", "npc4"]):
					var theCharID = getVarOrValueFromAnimEntryString(theEntry, entryID)
					
					var resolvedID = scene.resolveCustomCharacterName(theCharID)
					if(resolvedID != null):
						theCharID = resolvedID
					
					finalAnimData[entryID] = theCharID
				else:
					finalAnimData[entryID] = getVarOrValueFromAnimEntry(theEntry, entryID)
	
	scene.playAnimation(animID, finalState, finalAnimData)

func getVarOrValueFromAnimEntryString(animStateData, entryID):
	if(!animStateData.has("value")):
		throwError(null, "Wrong anim entry detected. Entry: "+str(entryID))
		return "" # something is wrong
	var finalValue = animStateData["value"]
	if(animStateData.has("isVar") && animStateData["isVar"] && animStateData.has("varName")):
		var newValue = getVar(animStateData["varName"])
		if(newValue == null):
			throwError(null, "Variable for the anim entry not found or contains a null! Entry: "+str(entryID)+", variable name: "+str(animStateData["varName"]))
		else:
			finalValue = str(newValue)
	return finalValue

func getVarOrValueFromAnimEntry(animStateData, entryID):
	if(!animStateData.has("value")):
		throwError(null, "Wrong anim entry detected. Entry: "+str(entryID))
		return false # something is wrong
	var finalValue = animStateData["value"]
	if(animStateData.has("isVar") && animStateData["isVar"] && animStateData.has("varName")):
		var newValue = getVar(animStateData["varName"])
		if(newValue == null):
			throwError(null, "Variable for the anim entry not found or contains a null! Entry: "+str(entryID)+", variable name: "+str(animStateData["varName"]))
		else:
			finalValue = (newValue)
	return finalValue

func setState(newState:String):
	if(!datapackScene.states.has(newState)):
		throwError(null, "Scene state not found: "+str(newState))
	scene.setState(newState)

func getState():
	return scene.getState()

func endScene():
	scene.endScene()

func runScene(sceneID:String, args = [], _codeSlot = null):
	var uniqueTag = getUniqueSceneTag()
	if(_codeSlot != null): # Do this first in case the scene ends instantly
		sceneReactEndCode[uniqueTag] = _codeSlot
	scene.runScene(sceneID, args, uniqueTag)

func runFightScene(charID:String, _codeWin, _codeLose):
	var uniqueTag = "fight_"+getUniqueSceneTag()
	sceneReactEndCode[uniqueTag+"_w"] = _codeWin
	sceneReactEndCode[uniqueTag+"_l"] = _codeLose
	scene.runScene("FightScene", [getCharacterActualID(charID)], uniqueTag)

func runGenericSexScene(domID:String, subID:String, sexType:String, _codeSlot = null):
	runScene("GenericSexScene", [getCharacterActualID(domID), getCharacterActualID(subID), sexType], _codeSlot)

func runLeashParadeScene(domID:String, finalLoc:String, _codeSlot = null):
	runScene("ParadedOnALeashScene", [getCharacterActualID(domID), GM.pc.getLocation(), finalLoc], _codeSlot)

func getUniqueSceneTag():
	usind += 1
	return "scene"+str(usind)

func reactSceneEnd(sceneTag, _args):
	reactMode = true
	if(sceneTag.begins_with("fight_") && sceneReactEndCode.has(sceneTag+"_w") && sceneReactEndCode.has(sceneTag+"_l")):
		var battlestate = _args[0]
		
		if(battlestate == "win"):
			execute(sceneReactEndCode[sceneTag+"_w"])
		else:
			execute(sceneReactEndCode[sceneTag+"_l"])
		sceneReactEndCode.erase(sceneTag+"_w")
		sceneReactEndCode.erase(sceneTag+"_l")
		reactMode = false
		return true
	
	if(sceneReactEndCode.has(sceneTag)):
		execute(sceneReactEndCode[sceneTag])
		sceneReactEndCode.erase(sceneTag)
		reactMode = false
		return true
	reactMode = false
	return false

func addMessage(text):
	scene.addMessage(text)

func isInRunMode():
	return runMode

func isInReactMode():
	return reactMode

func addImageByID(_imageID:String):
	if(!datapackScene.images.has(_imageID)):
		throwError(null, "Scene image with id "+str(_imageID)+" wasn't found")
		return
	
	var entry:DatapackSceneImage = datapackScene.images[_imageID]
	if(GM.ui != null && is_instance_valid(GM.ui)):
		GM.ui.setSceneArtWork({
			artist = entry.artist,
			imagePath = entry.image.getTexture(),
			imageScale = entry.imageScale,
		})
