extends Object
class_name InventorySlot

const Eyes = "eyes"
const Mouth = "mouth"
const Neck = "neck"
const Wrists = "wrists"
const Hands = "hands"
const Ring = "ring"
const Ankles = "ankles"
const Torso = "torso"
const Body = "body"
const UnderwearTop = "underwearTop"
const UnderwearBottom = "underwearBottom"
const Penis = "penis"
const Vagina = "vagina"
const Anal = "anal"
const Unique = "unique"
#Invisible ones
const Strapon = "strapon"
# For things like stocks
const Static1 = "static1"
const Static2 = "static2"
const Static3 = "static3"

static func getAll():
	return [Eyes, Mouth, Neck, Torso, Body, UnderwearTop, UnderwearBottom, Penis, Vagina, Anal, Wrists, Hands, Ring, Ankles, Strapon, Unique]

static func getStatic():
	return [Static1, Static2, Static3]

static func getVisibleName(slot: String):
	if(slot == Eyes):
		return "Eyes"
	if(slot == Mouth):
		return "Mouth"
	if(slot == Neck):
		return "Neck"
	if(slot == Torso):
		return "Torso"
	if(slot == Body):
		return "Body"
	if(slot == Wrists):
		return "Wrists"
	if(slot == Hands):
		return "Hands"
	if(slot == Ring):
		return "Ring"
	if(slot == Ankles):
		return "Ankles"
	if(slot == UnderwearTop):
		return "Underwear, top"
	if(slot == UnderwearBottom):
		return "Underwear, bottom"
	if(slot == Penis):
		return "Penis"
	if(slot == Vagina):
		return "Vagina"
	if(slot == Anal):
		return "Anal"
	if(slot == Strapon):
		return "Strapon"
	if(slot == Unique):
		return "Unique"
	
	return "Error"





