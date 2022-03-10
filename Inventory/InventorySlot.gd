extends Object
class_name InventorySlot

const Eyes = "eyes"
const Mouth = "mouth"
const Neck = "neck"
const Wrists = "wrists"
const Ankles = "ankles"
const Body = "body"

static func getAll():
	return [Eyes, Mouth, Neck, Body, Wrists, Ankles]

static func getVisibleName(slot: String):
	return slot.capitalize()

