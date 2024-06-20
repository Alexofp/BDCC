extends Reference
class_name DatapackCharacter

var id:String = "error"
var name:String = "Rahi"
var bodyparts:Dictionary = {}

func getEditorName():
	return "id="+id+" name="+name

func getEditVars():
	return {
		"name": {
			name = "Name",
			type = "string",
			value = name,
		},
		"bodyparts": {
			type = "bodyparts",
			value = bodyparts,
		},
	}

func applyEditVar(varid, value):
	if(varid == "name"):
		name = value
	if(varid == "bodyparts"):
		bodyparts = value
		return true
	
	return false

func saveData():
	return {
		"name": name,
		"bodyparts": bodyparts,
	}

func loadData(_data):
	name = loadVar(_data, "name", "No name")
	bodyparts = loadVar(_data, "bodyparts", {})

func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue
