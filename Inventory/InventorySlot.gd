extends Object
class_name InventorySlot

const Eyes = "eyes"
const Mouth = "mouth"
const Neck = "neck"
const Wrists = "wrists"
const Hands = "hands"
const Ankles = "ankles"
const Torso = "torso"
const Body = "body"
const UnderwearTop = "underwearTop"
const UnderwearBottom = "underwearBottom"
const Penis = "penis"
const Vagina = "vagina"
const Anal = "anal"

static func getAll():
	return [Eyes, Mouth, Neck, Torso, Body, UnderwearTop, UnderwearBottom, Penis, Vagina, Anal, Wrists, Hands, Ankles]

static func getVisibleName(slot: String):
	if(slot == UnderwearTop):
		return "Underwear, top"
	if(slot == UnderwearBottom):
		return "Underwear, bottom"
	
	return slot.capitalize()

