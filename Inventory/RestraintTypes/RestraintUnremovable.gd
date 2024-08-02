extends RestraintData
class_name RestraintUnremovable

func canStruggle():
	return false

func canUnlockWithKey():
	return false

func getVisibleLevel(_isBlind = false):
	return "999, impossible to remove"

func saveData():
	var data = {}
	data["aiWontResist"] = aiWontResist
	
	if(smartLock != null):
		data["smartLock"] = {
			id = smartLock.id,
			data = smartLock.saveData(),
		}
	return data
	
func loadData(_data):
	if(_data.has("aiWontResist")):
		aiWontResist = SAVE.loadVar(_data, "aiWontResist", false)
	loadSmartLock(_data)
