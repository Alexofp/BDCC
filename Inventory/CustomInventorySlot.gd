extends Reference
class_name CustomInventorySlot

var id : String = "errorslot"
var allowUndressInSexEngine:bool = true

func getVisibleName() -> String:
	return "Bad Slot"

func invCanEquipSlot(_char) -> bool:
	return true

# Inventory slots that need to be undressed before we can be undressed during sex engine
func getUndressChain() -> Array:
	return []
