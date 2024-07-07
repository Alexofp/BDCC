extends Reference
class_name DatapackSceneState

var id = "Error"

var code = preload("res://Game/Datapacks/UI/CrotchCode/SlotCalls.gd").new()

func saveData():
	return {
		"code": code.saveData(),
	}

func loadData(_data):
	code.loadData(loadVar(_data, "code", {}))

func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue

func getCode():
	return code
