extends Object
class_name InventorySlot

const Mouth = "mouth"
const Neck = "Neck"

static func getAll():
	return [Mouth, Neck]

static func getVisibleName(slot: String):
	return slot.capitalize()

