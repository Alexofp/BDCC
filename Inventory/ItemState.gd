extends Reference
class_name ItemState

var item: WeakRef
var removed = false

func isRemoved():
	return removed

func remove():
	removed = true

func getItem():
	if(item == null):
		return null
	return item.get_ref()

func getActions():
	return []

func resetState():
	removed = false

func saveData():
	var data = {}

	return data
	
func loadData(_data):
	pass

func blocksInventorySlots():
	return []

func coversBodyparts():
	return []

func getStateText():
	return ""
