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

const DEFAULT_SLOTS:Array = [
	Eyes, Mouth, Neck, Torso, Body, UnderwearTop, UnderwearBottom, Penis, Vagina, Anal, Wrists, Hands, Ring, Ankles, Strapon, Unique,
]
const DEFAULT_SLOT_NAMES:Dictionary = {
	Eyes: "Eyes", Mouth: "Mouth", Neck: "Neck", Torso: "Torso", Body: "Body", Wrists: "Wrists", Hands: "Hands", Ring: "Ring", Ankles: "Ankles", UnderwearTop: "Underwear, top", UnderwearBottom: "Underwear, bottom", Penis: "Penis", Vagina: "Vagina", Anal: "Anal", Strapon: "Strapon", Unique: "Unique", Static1: "Static restraint", Static2: "Static restraint", Static3: "Static restraint",
}
const DEFAULT_EXTRA_SLOTS:Array = [
	Static1, Static2, Static3,
]

const DEFAULT_UNDRESS_CHAINS:Array = [
	[Torso, Body, UnderwearTop],
	[Torso, Body, UnderwearBottom],
	[Eyes, Mouth],
	[Wrists, Hands],
	[Ankles],
	[Unique],
]

static func getAll() -> Array:
	if(GlobalRegistry.cachedInventorySlotsList.empty()):
		Log.printerr("InventorySlot.getAll() got called before the cached list got populated with values!")
		return DEFAULT_SLOTS # Fallback

	return GlobalRegistry.cachedInventorySlotsList

static func getStatic() -> Array:
	return DEFAULT_EXTRA_SLOTS

static func getVisibleName(slot: String):
	if(DEFAULT_SLOT_NAMES.has(slot)):
		return DEFAULT_SLOT_NAMES[slot]

	var s = GlobalRegistry.getCustomInventorySlot(slot)
	return s.getVisibleName() if s else "Error"

static func getUndressChains() -> Array:
	if(GlobalRegistry.inventorySlots.empty()):
		return DEFAULT_UNDRESS_CHAINS
	var theChains:Array = DEFAULT_UNDRESS_CHAINS.duplicate()
	
	for theSlotID in GlobalRegistry.inventorySlots:
		var theSlot = GlobalRegistry.inventorySlots[theSlotID]
		var theChain:Array = theSlot.getUndressChain()
		if(theChain.empty()):
			continue
		theChains.append(theChain)
	
	return theChains
