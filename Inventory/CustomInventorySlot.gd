extends Reference
class_name CustomInventorySlot

var id : String = "errorslot"

func getVisibleName() -> String:
	return "Bad Slot"

func invCanEquipSlot(_char) -> bool:
	return true

# Makes it so you can undress this slot in sex engine. Return empty array if you don't want that
# If you return something like [InventorySlot.Body, id], it will make it so you have to undress the Body slot first
func getUndressChain() -> Array:
	return [id]
