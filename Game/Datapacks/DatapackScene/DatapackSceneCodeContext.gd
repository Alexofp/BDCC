extends CodeContex
class_name DatapackSceneCodeContext

var scene:SceneBase
var datapackScene:DatapackScene
var datapack:Datapack

var buttons = {}
var curButtonIndex = 0

var storedErrors = []

func setDatapackScene(theScene):
	datapackScene = theScene

func setDatapack(theDatapack):
	datapack = theDatapack

func setScene(theScene):
	scene = theScene

func say(text):
	scene.say(text)

func sayn(text):
	scene.sayn(text)

func saynn(text):
	scene.saynn(text)

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
	buttons.clear()
	
	var currentStateID = scene.getState()
	
	var currentState:DatapackSceneState = datapackScene.states[currentStateID]
	
	var code = currentState.getCode()
	
	execute(code)
	
	if(storedErrors.size() > 0):
		saynn("[color=red]"+Util.join(storedErrors, "\n")+"[/color]")
		storedErrors = []
	
func react(_id, _args):
	if(buttons.has(_id)):
		execute(buttons[_id]["code"])
		scene.setState(buttons[_id]["state"])
		return true
	return false
	
func saveData():
	return {
		"vars": vars,
	}

func loadData(_data):
	vars = loadVar(_data, "vars", {})

func getVar(theVar:String, defaultValue = null):
	if(!vars.has(theVar)):
		if(datapackScene.vars.has(theVar)):
			return datapackScene.vars[theVar]["default"]
	return .getVar(theVar, defaultValue)

func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue

func addButton(_nameText, _descText, _state, _codeSlot):
	var newButtonID = "button"+str(curButtonIndex)
	
	buttons[newButtonID] = {
		name = _nameText,
		desc = _descText,
		code = _codeSlot,
		state = _state,
	}
	
	scene.addButton(_nameText, _descText, newButtonID)
	
	curButtonIndex += 1

func addDisabledButton(_nameText, _descText):
	scene.addDisabledButton(_nameText, _descText)

func addCharacter(charAlias, _variant):
	if(datapackScene.chars.has(charAlias)):
		scene.addCharacter(datapackScene.chars[charAlias]["realid"], _variant.split("-", false))
	else:
		scene.addCharacter(charAlias, _variant.split("-", false))

func removeCharacter(charAlias):
	if(datapackScene.chars.has(charAlias)):
		scene.removeCharacter(datapackScene.chars[charAlias]["realid"])
	else:
		scene.removeCharacter(charAlias)
