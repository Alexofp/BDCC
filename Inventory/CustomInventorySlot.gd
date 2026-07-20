extends Reference
class_name CustomInventorySlot

var id : String = "errorslot"

func getVisibleName() -> String:
	return "Bad Slot"

func invCanEquipSlot(_char) -> bool:
	return true
