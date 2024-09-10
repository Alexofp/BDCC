extends Reference
class_name DatapackSceneImage

var id:String = ""
var artist:String = ""
var image:DatapackImage = DatapackImage.new()
var imageScale:float = 1.0

func saveData():
	return {
		"artist": artist,
		"imageScale": imageScale,
		"image": image.saveData(),
	}

func loadData(data):
	artist = loadVar(data, "artist", "")
	imageScale = loadVar(data, "imageScale", 1.0)
	image.loadData(loadVar(data, "image", PoolByteArray()))

func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue
