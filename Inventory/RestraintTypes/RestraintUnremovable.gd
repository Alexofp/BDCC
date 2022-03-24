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

	return data
	
func loadData(_data):
	pass
