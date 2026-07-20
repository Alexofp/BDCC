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

const DEFAULT_SLOTS:Array = [
	Head, Hair, Ears, Horns, Body, Arms, Breasts, Penis, Vagina, Anus, Tail, Legs,
]
const DEFAULT_SLOT_CHILD_NAME:Dictionary = { # for TF stuff
	Head: "neck", Hair: "head", Ears: "head", Horns: "head", Body: "body", Arms: "torso", Breasts: "chest", Penis: "crotch", Vagina: "crotch", Anus: "butt", Tail: "butt", Legs: "butt",
}
const DEFAULT_SLOT_IS_ESSENTIAL:Dictionary = {
	Head: true, Hair: true, Ears: true, Horns: false, Body: true, Arms: true, Breasts: true, Penis: false, Vagina: false, Anus: true, Tail: false, Legs: true,
}

static func getAll() -> Array:
	if(GlobalRegistry.cachedBodypartSlotsList.empty()):
		Log.printerr("BodypartSlot.getAll() got called before the cached list got populated with values!")
		return DEFAULT_SLOTS # Fallback

	return GlobalRegistry.cachedBodypartSlotsList

static func getVisibleName(slot: String):
	if(DEFAULT_SLOT_IS_ESSENTIAL.has(slot)):
		return Util.capitalizeFirstLetter(slot)
	
	var sobj = GlobalRegistry.getCustomBodypartSlot(slot)
	return sobj.getVisibleName() if sobj else slot

static func getVisibleNameNoCap(slot: String):
	if(DEFAULT_SLOT_IS_ESSENTIAL.has(slot)):
		return slot
	
	var sobj = GlobalRegistry.getCustomBodypartSlot(slot)
	return sobj.getVisibleNameNoCap() if sobj else slot

static func getSlotChildName(slot: String):
	if(DEFAULT_SLOT_CHILD_NAME.has(slot)):
		return DEFAULT_SLOT_CHILD_NAME[slot]
	
	var slotobj = GlobalRegistry.getCustomBodypartSlot(slot)
	return slotobj.getSlotChildName() if slotobj else "body"

static func isEssential(slot:String) -> bool:
	if(DEFAULT_SLOT_IS_ESSENTIAL.has(slot)):
		return DEFAULT_SLOT_IS_ESSENTIAL[slot]
	
	var slotobj = GlobalRegistry.getCustomBodypartSlot(slot)
	return slotobj.isEssential() if slotobj else true

static func findReplacement(slot:String, oldvalue:String, species=null, gender=Gender.Androgynous):
	# Hardcoded known good convertions
	if(slot == Legs):
		if(oldvalue in ["flufflegs", "felineleg", "canineleg", "dragonleg"]):
			return "digilegs"
		if(oldvalue in ["humanleg"]):
			return "plantilegs"
	elif(slot == Body):
		if(oldvalue in ["fluffbody"]):
			return "anthrobody"
	# Get default bodypart from species
	var mainSpecies = null
	if(species != null):
		for speciesItr in species:
			mainSpecies = GlobalRegistry.getSpecies(speciesItr)
			if mainSpecies != null:
				break
	if(mainSpecies == null):
		mainSpecies = GlobalRegistry.getSpecies("canine")
	var replacementIdFor = mainSpecies.getDefaultForSlot(slot, gender)
	if(replacementIdFor != null && GlobalRegistry.getBodypartRef(replacementIdFor) != null):
		return replacementIdFor
	# Hardcoded fallback convertions
	if(slot == Body):
		return "anthrobody"
	elif(slot == Arms):
		return "anthroarms"
	elif(slot == Anus):
		return "anus"
	elif(slot == Legs):
		return "digilegs"
	elif(slot == Vagina):
		return "vagina"
	
	if(GlobalRegistry.hasCustomBodypartSlot(slot)):
		var slotobj = GlobalRegistry.getCustomBodypartSlot(slot)
		return slotobj.findReplacement(oldvalue, species, gender)
	
	return null
