extends Reference
class_name CrotchSlotAnim

var animID = StageScene.Solo
var animData = {}

signal onAnimChanged(animID, animData)

func setAnimAndData(newAnim, newData):
	animID = newAnim
	animData = newData
	emit_signal("onAnimChanged", animID, animData)

func getValue(_contex:CodeContex):
	return false

func calcLineNums(_contex:CodeContex):
	pass

func saveData():
	var data = {}
	
	data["animID"] = animID
	data["animData"] = animData
	
	return data

func loadData(_data):
	animID = loadVar(_data, "animID", "")
	animData = loadVar(_data, "animData", {})
	
func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue
