extends ItemState
class_name ItemStateUnremovable

func canBeRemoved() -> bool:
	return false

func isRemoved():
	return false

func remove():
	pass

func saveData():
	var data = {
	}

	return data
	
func loadData(_data):
	pass
