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
	return [Hair, Breasts, Legs, Tail]

static func getVisibleName(slot: String):
	return slot.capitalize()
