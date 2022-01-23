extends Object
class_name BodypartSlot

const Head = "head"
const Hair = "hair"
const Ears = "ears"
const Horns = "horns"
const Body = "body"
const Arms = "arms"
const Breasts = "breasts"
const Tail = "tail"
const Legs = "legs"

static func getAll():
	return [Head, Hair, Ears, Horns, Body, Arms, Breasts, Tail, Legs]

static func getVisibleName(slot: String):
	return slot.capitalize()

static func isEssential(slot):
	if(slot == Horns):
		return false
	if(slot == Tail):
		return false
	
	return true
