extends SkinBase
class_name DatapackSkin

var name:String = "New skin"
var skinImage:DatapackImage = DatapackImage.new()
var skinTypeWeights:Dictionary = {}

func getEditorName():
	return "id="+id+" name="+name

func getName():
	return name

func getPatternTexture():
	return skinImage.getTexture()

func getFittingSkinTypes():
	return skinTypeWeights

func getEditVars():
	return {
		"name": {
			name = "Name",
			type = "string",
			value = name,
		},
		"skinImage": {
			name = "Skin",
			type = "image",
			value = skinImage.getImage(),
		},
		"skinTypeWeights": {
			name = "Skin type weights (0 = never, 1.0 = normal, >1.0 = more often)",
			type = "skinTypeWeights",
			value = skinTypeWeights,
		},
	}

func applyEditVar(varid, value):
	if(varid == "name"):
		name = value
	if(varid == "skinImage"):
		skinImage.setImage(value)
		return true
	if(varid == "skinTypeWeights"):
		skinTypeWeights = value
	
	return false

func saveData():
	return {
		"name": name,
		"skinImage": skinImage.saveData(),
		"skinTypeWeights": skinTypeWeights,
	}

func loadData(data):
	name = loadVar(data, "name", "No name")
	skinImage.loadData(loadVar(data, "skinImage", PoolByteArray()))
	skinTypeWeights = loadVar(data, "skinTypeWeights", {})

func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue
