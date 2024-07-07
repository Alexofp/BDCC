extends CodeContex
class_name DatapackSceneCodeContext

var scene:SceneBase
var datapackScene:DatapackScene
var datapack:Datapack

var buttons = {}
var curButtonIndex = 0

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

func run():
	buttons.clear()
	
	var currentStateID = scene.getState()
	
	var currentState:DatapackSceneState = datapackScene.states[currentStateID]
	
	var code = currentState.getCode()
	
	execute(code)
	
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
