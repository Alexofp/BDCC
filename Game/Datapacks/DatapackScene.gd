extends Reference
class_name DatapackScene

var id:String = "error"
var name:String = "New scene"
var devcomment:String = ""

var states:Dictionary = {}
var vars:Dictionary = {}
var chars:Dictionary = {}
var triggers:Array = []
var images:Dictionary = {}

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
		"devcomment": {
			name = "Dev commentary",
			type = "bigString",
			value = devcomment,
		},
	}

func applyEditVar(varid, value):
	if(varid == "name"):
		name = value
	if(varid == "devcomment"):
		devcomment = value
	
	return false

func saveData():
	var stateData = {}
	for stateID in states:
		stateData[stateID] = states[stateID].saveData()
	
	var triggerData = []
	for trigger in triggers:
		triggerData.append(trigger.saveData())
	
	var imagesData = []
	for imageID in images:
		var imageEntry = images[imageID]
		imagesData.append({
			id = imageEntry.id,
			data = imageEntry.saveData(),
		})
	
	return {
		"name": name,
		"devcomment": devcomment,
		"states": stateData,
		"vars": vars,
		"chars": chars,
		"triggers": triggerData,
		"images": imagesData,
	}

func loadData(data):
	name = loadVar(data, "name", "No name")
	devcomment = loadVar(data, "devcomment", "")
	
	states = {}
	var stateData = loadVar(data, "states", {})
	for stateID in stateData:
		var newState = DatapackSceneState.new()
		newState.id = stateID
		newState.loadData(loadVar(stateData, stateID, {}))
		states[stateID] = newState
	
	var varsData = loadVar(data, "vars", {})
	vars = {}
	for varName in varsData:
		var varData = varsData[varName]
		
		if(!varData.has("type") || !varData.has("default")):
			continue
			
		vars[varName] = {
			type = varData["type"],
			default = varData["default"],
		}
	
	var charsData = loadVar(data, "chars", {})
	chars = {}
	for charID in charsData:
		var charData = charsData[charID]
		
		if(!charData.has("realid") || !charData.has("start") || !charData.has("variant")):
			continue
			
		chars[charID] = {
			realid = charData["realid"],
			start = charData["start"],
			variant = charData["variant"],
		}
	
	var triggerData = loadVar(data, "triggers", [])
	triggers = []
	for triggerEntry in triggerData:
		if(!(triggerEntry is Dictionary)):
			continue
		var newTrigger = DatapackSceneTrigger.new()
		newTrigger.loadData(triggerEntry)
		triggers.append(newTrigger)
	
	var imagesData = loadVar(data, "images", [])
	images = {}
	for imagesEntry in imagesData:
		if(!(imagesEntry is Dictionary)):
			continue
		var newImage:DatapackSceneImage = DatapackSceneImage.new()
		newImage.id = loadVar(imagesEntry, "id", "image")
		newImage.loadData(loadVar(imagesEntry, "data", {}))
		images[newImage.id] = newImage
		
		
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
