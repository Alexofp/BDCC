extends Reference
class_name CodeContex

signal onPrint(text)
signal onError(codeBlock, text)
signal onGenericError(text)

var curLine:int = -1

var vars = {}
var varsDefinition = {}
var flags = {}
var flagsDefinition = {}

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

func throwError(_codeblock, _errorText):
	if(_codeblock == null):
		emit_signal("onGenericError", str(_errorText))
		Log.printerr("[CrotchScript Error] "+str(_errorText))
		return
	emit_signal("onError", _codeblock, str(_errorText))
	Log.printerr("[CrotchScript Error at line "+str(_codeblock.lineNum)+"] "+str(_errorText))

func execute(slotCalls):
	#clearVars()
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

func addButton(_nameText, _descText, _state, _codeSlot):
	doPrint("BUTTON ADDED: "+str(_nameText))

func addDisabledButton(_nameText, _descText):
	doPrint("DISABLED BUTTON ADDED: "+str(_nameText))

func addCharacter(charAlias, _variant):
	doPrint("ADDED CHAR: "+str(charAlias))

func removeCharacter(charAlias):
	doPrint("REMOVED CHAR: "+str(charAlias))

func aimCameraAndSetLocName(newLoc):
	doPrint("AIMING CAMERA AT "+str(newLoc))

func playAnim(animID, _animData):
	doPrint("PLAYING ANIMATION: "+str(animID))
