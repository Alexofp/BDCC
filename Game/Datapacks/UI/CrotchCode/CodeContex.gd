extends Reference
class_name CodeContex

signal onPrint(text)
signal onError(codeBlock, text)
signal onGenericError(text)

var curLine:int = -1
var errored = false
var returning = false

var vars = {}
var varsDefinition = {}
var flags = {}
var flagsDefinition = {}

func hasVar(theVar:String):
	if(!vars.has(theVar)):
		return false
	return true

func getVar(theVar:String, defaultValue = null):
	if(!vars.has(theVar)):
		if(varsDefinition.has(theVar)):
			return varsDefinition[theVar]["default"]
		return defaultValue
	return vars[theVar]

func setVar(theVar:String, newValue, _codeblock):
	if(varsDefinition.has(theVar)):
		var varType = varsDefinition[theVar]["type"]
		
		if(varType == DatapackSceneVarType.BOOL && !(newValue is bool)):
			throwError(_codeblock, "Trying to assign a '"+str(newValue)+"' value to a BOOLEAN variable "+str(theVar))
			return
		if(varType == DatapackSceneVarType.STRING && !(newValue is String)):
			throwError(_codeblock, "Trying to assign a '"+str(newValue)+"' value to a STRING variable "+str(theVar))
			return
		if(varType == DatapackSceneVarType.NUMBER && !(newValue is int) && !(newValue is float)):
			throwError(_codeblock, "Trying to assign a '"+str(newValue)+"' value to a NUMBER variable "+str(theVar))
			return
	vars[theVar] = newValue

func clearVars():
	vars = {}

func hasFlag(theVar:String, _codeblock = null):
	if(!flagsDefinition.has(theVar)):
		return false
	return true

func getFlag(theVar:String, defaultValue = null, _codeblock = null):
	if(!flags.has(theVar)):
		if(flagsDefinition.has(theVar)):
			return flagsDefinition[theVar]["default"]
		return defaultValue
	return flags[theVar]

func setFlag(theVar:String, newValue, _codeblock):
	if(flagsDefinition.has(theVar)):
		var varType = flagsDefinition[theVar]["type"]
		
		if(varType == DatapackSceneVarType.BOOL && !(newValue is bool)):
			throwError(_codeblock, "Trying to assign a '"+str(newValue)+"' value to a BOOLEAN flag "+str(theVar))
			return
		if(varType == DatapackSceneVarType.STRING && !(newValue is String)):
			throwError(_codeblock, "Trying to assign a '"+str(newValue)+"' value to a STRING flag "+str(theVar))
			return
		if(varType == DatapackSceneVarType.NUMBER && !(newValue is int) && !(newValue is float)):
			throwError(_codeblock, "Trying to assign a '"+str(newValue)+"' value to a NUMBER flag "+str(theVar))
			return
	flags[theVar] = newValue

func doPrint(text):
	emit_signal("onPrint", text)
	Log.print(str(text))

func doDebugPrint(text):
	doPrint(text)

func hadAnError() -> bool:
	return errored

func resetErrored():
	errored = false

func shouldReturn() -> bool:
	return returning

func shouldBreak() -> bool:
	return false

func shouldContinue() -> bool:
	return false

func throwError(_codeblock, _errorText):
	errored = true
	
	if(_codeblock == null):
		emit_signal("onGenericError", str(_errorText))
		Log.printerr("[CrotchScript Error] "+str(_errorText))
		return
	emit_signal("onError", _codeblock, str(_errorText))
	Log.printerr("[CrotchScript Error at line "+str(_codeblock.lineNum)+"] "+str(_errorText))

func execute(slotCalls):
	#clearVars()
	returning = false
	errored = false
	calcLineNums(slotCalls)
	slotCalls.execute(self)

func getValue(slotVar):
	var result = slotVar.getValue(self)
	
	return result

func calcLineNums(slotCalls):
	curLine = 0
	slotCalls.calcLineNums(self)

func say(text):
	if(text.length() > 80):
		text = text.substr(0, 78)+"..."
	doPrint(text)

func sayn(text):
	say(text)

func saynn(text):
	say(text)

func sayAsCharacter(charID:String, sayText:String):
	saynn("[say="+charID+"]"+sayText+"[/say]")

func addMessage(text):
	doPrint("Adding message: "+str(text))

func addButton(_nameText, _descText, _state, _codeSlot, _buttonChecks):
	doPrint("BUTTON ADDED: "+str(_nameText))

func addDisabledButton(_nameText, _descText):
	doPrint("DISABLED BUTTON ADDED: "+str(_nameText))

func addCharacter(charAlias, _variant):
	if(charAlias == "pc"):
		throwError(null, "Trying to add the player character (pc) into the scene. There is no need to do that")
		return
	doPrint("ADDED CHAR: "+str(charAlias))

func removeCharacter(charAlias):
	doPrint("REMOVED CHAR: "+str(charAlias))

func aimCameraAndSetLocName(newLoc):
	doPrint("AIMING CAMERA AT "+str(newLoc))

func setLocName(newText):
	doPrint("Setting loc name to "+str(newText))

func playAnim(animID, _animData):
	doPrint("PLAYING ANIMATION: "+str(animID))

func doRunEvent():
	doPrint("EVENT WILL HAPPEN")
	setIsReturning()

func setIsReturning():
	returning = true

func markQuestAsVisible():
	pass

func markQuestAsCompleted():
	pass

func hasInterpolatorVar(varID):
	if(hasVar(varID) || hasFlag(varID)):
		return true
	return false

func getInterpolatorVar(varID):
	if(hasVar(varID)):
		return getVar(varID)
	if(hasFlag(varID)):
		return getFlag(varID)
	return null

func isNumber(val):
	if((val is float || val is int)):
		return true
	return false

func isString(val):
	if(val is String):
		return true
	return false

func getCharacterActualID(charID:String):
	return charID

func getCharacter(charID:String):
	var result = GlobalRegistry.getCharacter(getCharacterActualID(charID))
	if(result == null):
		throwError(null, "No character found: "+str(charID))
		return null
	return result

func isInGame():
	if(GM.main == null || !is_instance_valid(GM.main)):
		return false
	return true

func addPain(charID:String, amValue:int):
	if(!isInGame()):
		return
	
	var theChar = getCharacter(charID)
	if(theChar == null):
		return
	theChar.addPain(amValue)

func addLust(charID:String, amValue:int):
	if(!isInGame()):
		return
	
	var theChar = getCharacter(charID)
	if(theChar == null):
		return
	theChar.addLust(amValue)

func addStamina(charID:String, amValue:int):
	if(!isInGame()):
		return
	
	var theChar = getCharacter(charID)
	if(theChar == null):
		return
	theChar.addStamina(amValue)

func getPain(charID:String) -> int:
	if(!isInGame()):
		return 0
	
	var theChar = getCharacter(charID)
	if(theChar == null):
		return 0
	return theChar.getPain()

func getLust(charID:String) -> int:
	if(!isInGame()):
		return 0
	
	var theChar = getCharacter(charID)
	if(theChar == null):
		return 0
	return theChar.getLust()

func getStamina(charID:String) -> int:
	if(!isInGame()):
		return 0
	
	var theChar = getCharacter(charID)
	if(theChar == null):
		return 0
	return theChar.getStamina()

func charMethod(charID:String, themethod:String, args:Array = [], defaultValue = null):
	if(!isInGame()):
		return defaultValue
	
	var theChar = getCharacter(charID)
	if(theChar == null):
		return defaultValue
	if(!theChar.has_method(themethod)):
		throwError(null, "No method found: "+str(themethod)+" for the character: "+str(charID))
		return defaultValue
	return theChar.callv(themethod, args)

func charInventoryMethod(charID:String, themethod:String, args:Array = [], defaultValue = null):
	if(!isInGame()):
		return defaultValue
	
	var theChar = getCharacter(charID)
	if(theChar == null):
		return defaultValue
	if(!theChar.getInventory().has_method(themethod)):
		throwError(null, "No method found: "+str(themethod)+" for the character's inventory: "+str(charID))
		return defaultValue
	return theChar.getInventory().callv(themethod, args)

func charPersonalityMethod(charID:String, themethod:String, args:Array = [], defaultValue = null):
	if(!isInGame()):
		return defaultValue
	
	var theChar = getCharacter(charID)
	if(theChar == null):
		return defaultValue
	if(!theChar.getPersonality().has_method(themethod)):
		throwError(null, "No method found: "+str(themethod)+" for the character's personality: "+str(charID))
		return defaultValue
	return theChar.getPersonality().callv(themethod, args)

func charFetishHolderMethod(charID:String, themethod:String, args:Array = [], defaultValue = null):
	if(!isInGame()):
		return defaultValue
	
	var theChar = getCharacter(charID)
	if(theChar == null):
		return defaultValue
	if(!theChar.getFetishHolder().has_method(themethod)):
		throwError(null, "No method found: "+str(themethod)+" for the character's personality: "+str(charID))
		return defaultValue
	return theChar.getFetishHolder().callv(themethod, args)

func getStat(charID:String, statName) -> int:
	if(!isInGame()):
		return 0
	
	var theChar = getCharacter(charID)
	if(theChar == null):
		return 0
	return theChar.getStat(statName)

func setState(newState:String):
	doPrint("Setting state to "+str(newState))

func getState():
	return ""

func endScene():
	doPrint("Ending the scene..")

func runScene(sceneID:String, _args = [], _codeSlot = null):
	doPrint("Gonna run scene: "+sceneID)

func runFightScene(charID:String, _codeWin, _codeLose):
	doPrint("Gonna start a fight with: "+charID)

func runGenericSexScene(domID:String, subID:String, _sexType:String, _codeSlot = null):
	doPrint("Gonna start a sex between "+domID+" and "+subID)

func runLeashParadeScene(domID:String, finalLoc:String, _codeSlot = null):
	doPrint("Gonna start a leashing scene with dom "+domID+" and target location being "+finalLoc)

func addStraponButtonsFor(_charName, _nextState, _codeSlot):
	pass

func returnStraponToPcFrom(_charName):
	return true

func addFilledCondomToLootIfPerk(_charName):
	return

func isInRunMode():
	return true

func isInReactMode():
	return true

func giveBirth(charName):
	var theChar = getCharacter(charName)
	if(theChar == null):
		return false
	
	var bornChilds = theChar.giveBirth()
	var bornChildAmount = bornChilds.size()
	var bornString = GM.CS.getChildBirthInfoString(bornChilds)
	
	if(bornChildAmount > 0 && GM.main != null && is_instance_valid(GM.main)):
		GM.main.addLogMessage("New life", ""+theChar.getName()+" gave birth to "+str(bornChildAmount)+" kid"+("s" if bornChildAmount != 1 else "")+":\n\n"+bornString)
		GM.main.showLog()
		
		return true
	return false

func addLog(_logName, _logText):
	if(GM.main != null && is_instance_valid(GM.main)):
		GM.main.addLogMessage(_logName, _logText)
	else:
		doPrint("Adding log with title: "+str(_logName))

func showLog():
	if(GM.main != null && is_instance_valid(GM.main)):
		GM.main.showLog()

func characterExists(charID:String):
	return GlobalRegistry.characterExists(getCharacterActualID(charID))

func getChildAmount(charID:String):
	if(GM.CS != null && is_instance_valid(GM.CS)):
		return GM.CS.getChildrenAmountOf(getCharacterActualID(charID))
	
	return 0
func getChildAmountOnlyMother(charID:String):
	if(GM.CS != null && is_instance_valid(GM.CS)):
		return GM.CS.getChildrenAmountOfOnlyMother(getCharacterActualID(charID))
	
	return 0
func getChildAmountOnlyFather(charID:String):
	if(GM.CS != null && is_instance_valid(GM.CS)):
		return GM.CS.getChildrenAmountOfOnlyFather(getCharacterActualID(charID))
	
	return 0
func getChildAmountFatherMother(charID:String, charID2:String):
	if(GM.CS != null && is_instance_valid(GM.CS)):
		return GM.CS.getSharedChildrenAmountFatherMother(getCharacterActualID(charID), getCharacterActualID(charID2))
	
	return 0

func addImageByID(_imageID:String):
	pass

func shouldExecuteCodeOnce() -> bool:
	if(GM.main == null || !is_instance_valid(GM.main)):
		return true
	return GM.main.shouldExecuteOnceCodeblocksRun()

func setBreastSize(charID:String, breastSize):
	var character:BaseCharacter = getCharacter(charID)
	
	if(character == null):
		return false
	if(!character.hasBodypart(BodypartSlot.Breasts)):
		return false
	var breasts = character.getBodypart(BodypartSlot.Breasts)
	breasts.setBreastSizeSafe(breastSize)
	character.updateAppearance()

func setPenisAndBallsSize(charID:String, penisLen:float, ballsSize:float = 1.0):
	var character = getCharacter(charID)
	
	if(character == null):
		return false
	if(!character.hasBodypart(BodypartSlot.Penis)):
		return false
	var penis = character.getBodypart(BodypartSlot.Penis)
	penis.lengthCM = penisLen
	penis.ballsScale = ballsSize
	character.updateAppearance()

func getBreastSize(charID:String):
	var character:BaseCharacter = getCharacter(charID)
	
	if(character == null):
		return 0
	if(!character.hasBodypart(BodypartSlot.Breasts)):
		return 0
	return character.getBodypart(BodypartSlot.Breasts).getSize()

func getOriginalBreastSize(charID:String):
	var character:BaseCharacter = getCharacter(charID)
	
	if(character == null):
		return 0
	if(!character.hasBodypart(BodypartSlot.Breasts)):
		return 0
	return character.getBodypart(BodypartSlot.Breasts).size

func getPenisLen(charID:String):
	var character:BaseCharacter = getCharacter(charID)
	
	if(character == null):
		return 0
	if(!character.hasBodypart(BodypartSlot.Penis)):
		return 0
	return character.getBodypart(BodypartSlot.Penis).getLength()

func getPenisBallsScale(charID:String):
	var character:BaseCharacter = getCharacter(charID)
	
	if(character == null):
		return 0
	if(!character.hasBodypart(BodypartSlot.Penis)):
		return 0
	return character.getBodypart(BodypartSlot.Penis).getBallsScale()

func setExcludeNpcFromEncounters(charID:String, newVal:bool):
	var character:BaseCharacter = getCharacter(charID)
	
	if(character == null):
		throwError(null, "No character found with id "+str(charID))
		return
	
	if(!(character.isDynamicCharacter())):
		throwError(null, "Character with id "+str(charID)+" is not a dynamic character. Unable to exclude (or include) them from encounters")
		return
	
	if(character.extraSettings == null):
		character.extraSettings = DynCharExtraSettings.new()
	
	character.extraSettings.excludeEncounters = newVal
	
