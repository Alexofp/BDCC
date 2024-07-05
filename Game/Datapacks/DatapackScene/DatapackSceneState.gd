extends Reference
class_name DatapackSceneState

var id = "Error"

var code

func saveData():
	return {}

func loadData(_data):
	pass

func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue
