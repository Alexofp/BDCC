extends Object
class_name InventorySlot

const Eyes = "eyes"
const Mouth = "mouth"
const Neck = "neck"
const Wrists = "wrists"
const Ankles = "ankles"
const Body = "body"
const UnderwearTop = "underwearTop"
const UnderwearBottom = "underwearBottom"

static func getAll():
	return [Eyes, Mouth, Neck, Body, UnderwearTop, UnderwearBottom, Wrists, Ankles]

static func getVisibleName(slot: String):
	if(slot == UnderwearTop):
		return "Underwear, top"
	if(slot == UnderwearBottom):
		return "Underwear, bottom"
	
	return slot.capitalize()

