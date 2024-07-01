extends SkinBase
class_name DatapackSkin

var name:String = "New skin"
var skinImage:Image
var skinTexture
var skinTypeWeights:Dictionary = {}

func getEditorName():
	return "id="+id+" name="+name

func getName():
	return name

func getPatternTexture():
	if(skinTexture == null):
		if(skinImage != null):
			skinTexture = ImageTexture.new()
			skinTexture.create_from_image(skinImage, 4)
	return skinTexture

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
			value = skinImage,
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
		skinImage = value
		skinTexture = null
		return true
	if(varid == "skinTypeWeights"):
		skinTypeWeights = value
	
	return false

func saveData():
	return {
		"name": name,
		"skinImage": (skinImage.save_png_to_buffer() if skinImage else PoolByteArray()),
		"skinTypeWeights": skinTypeWeights,
	}

func loadData(data):
	name = loadVar(data, "name", "No name")
	skinImage = loadImageVar(data, "skinImage")
	skinTexture = null
	skinTypeWeights = loadVar(data, "skinTypeWeights", {})

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
