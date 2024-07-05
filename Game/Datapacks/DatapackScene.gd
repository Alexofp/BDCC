extends Reference
class_name DatapackScene

var id:String = "error"
var name:String = "New scene"

var states:Dictionary = {}

func initStartingData():
	states[""] = DatapackSceneState.new()

func _init():
	initStartingData()

func getEditorName():
	return "id="+id+" name="+name

func getName():
	return name

func getEditVars():
	return {
		"name": {
			name = "Name",
			type = "string",
			value = name,
		},
	}

func applyEditVar(varid, value):
	if(varid == "name"):
		name = value
	
	return false

func saveData():
	var stateData = {}
	for stateID in states:
		stateData[stateID] = states[stateID].saveData()
	
	return {
		"name": name,
		"states": stateData,
	}

func loadData(data):
	name = loadVar(data, "name", "No name")
	
	states = {}
	var stateData = loadVar(data, "states", {})
	for stateID in stateData:
		var newState = DatapackSceneState.new()
		newState.id = stateID
		newState.loadData(loadVar(stateData, stateID, {}))
		states[stateID] = newState

func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue

func loadImageVar(_data, thekey):
	var imageData = loadVar(_data, thekey, PoolByteArray())
	if(imageData != null):
		if(imageData is Image):
			return imageData
		elif(imageData is PoolByteArray):
			if(imageData.empty()):
				return null
			else:
				var newIm = Image.new()
				var _ok = newIm.load_png_from_buffer(imageData)
				if(_ok == OK):
					return newIm
				else:
					return null
		else:
			return null
	else:
		return null
