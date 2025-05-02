extends Object
class_name BodypartSlot

const Head = "head"
const Hair = "hair"
const Ears = "ears"
const Horns = "horns"
const Body = "body"
const Arms = "arms"
const Breasts = "breasts"
const Penis = "penis"
const Vagina = "vagina"
const Anus = "anus"
const Tail = "tail"
const Legs = "legs"

static func getAll():
	return [Head, Hair, Ears, Horns, Body, Arms, Breasts, Penis, Vagina, Anus, Tail, Legs]

static func getVisibleName(slot: String):
	return slot.capitalize()

static func getVisibleNameNoCap(slot: String):
	return slot

static func getSlotChildName(slot: String):
	if(slot == Head):
		return "neck"
	if(slot == Hair):
		return "head"
	if(slot == Ears):
		return "head"
	if(slot == Horns):
		return "head"
	if(slot == Body):
		return "body"
	if(slot == Arms):
		return "torso"
	if(slot == Breasts):
		return "chest"
	if(slot == Penis):
		return "crotch"
	if(slot == Vagina):
		return "crotch"
	if(slot == Anus):
		return "butt"
	if(slot == Tail):
		return "butt"
	if(slot == Legs):
		return "butt"
	return "body"

static func isEssential(slot):
	if(slot == Horns):
		return false
	if(slot == Tail):
		return false
	if(slot == Penis):
		return false
	if(slot == Vagina):
		return false
	
	return true

static func findReplacement(slot, oldvalue):
	if(slot == Body):
		return "anthrobody"
	if(slot == Arms):
		return "anthroarms"
	if(slot == Legs):
		if(oldvalue in ["felineleg", "canineleg", "dragonleg"]):
			return "digilegs"
		if(oldvalue in ["humanleg"]):
			return "plantilegs"
		return "plantilegs"
	
	return null
