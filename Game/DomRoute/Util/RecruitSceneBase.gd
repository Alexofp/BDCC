extends SceneBase
class_name RecruitSceneBase

var RC:RecruitContext

func _initScene(_args = []):
	RC = _args[0]

func saveData():
	var data = .saveData()
	
	data["RC"] = RC.saveData()
	
	return data

func loadData(data):
	.loadData(data)

	RC = RecruitContext.new()
	RC.loadData(SAVE.loadVar(data, "RC", {}))
