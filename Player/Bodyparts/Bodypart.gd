extends Node
class_name Bodypart

var id
var dollType
var limbSlot
var visibleName

var orifice: Orifice = null
var character: WeakRef = null

func _init():
	pass

func _getDollType():
	return dollType

func getLimbSlot():
	return limbSlot

func getSlot():
	return BodypartSlot.Body

func getName():
	return visibleName

func getCompatibleSpecies():
	return []

# Used to make sure we don't get hybrids with human ears unless player really wants that
func getHybridPriority():
	return 0

func getTooltipInfo():
	return "error, let the developer know"

func getLewdSizeAdjective():
	return "average-sized"

func getLewdAdjective():
	return "average-looking"
	
func getLewdName():
	return getName()

func getLewdDescriptionAndName():
	var text = getLewdSizeAdjective() + " " + getLewdAdjective() + " " + getLewdName()
	return text

func getLewdDescriptionAndNameWithA():
	var t = getLewdDescriptionAndName()
	if(t[0].to_lower() in "eyuioa"):
		return "an "+t
	return "a "+t

func getPickableAttributes():
	return {}
	
func applyAttribute(_attrID: String, _attrValue):
	pass

func getAttributesText():
	return []

func addFluid(fluidType, amount: float, charID = null):
	assert(orifice != null)
	orifice.addFluid(fluidType, amount, charID)

func isEmpty():
	assert(orifice != null)
	return orifice.isEmpty()

func isStuffed():
	return !isEmpty()

func getOrifice():
	return orifice

func clearFluids():
	assert(orifice != null)
	orifice.clear()

func processTime(_seconds: int):
	if(orifice == null):
		return
	orifice.processTime(_seconds)

func hoursPassed(_howmuch):
	if(orifice == null):
		return
	orifice.hoursPassed(_howmuch)

func handleInsertion(size: float):
	if(orifice == null):
		return
	orifice.handleInsertion(size)

func getOrificeName():
	return "error"

func saveData():
	if(orifice == null):
		return {}
	return {
		"orificeData": orifice.saveData(),
	}

func loadData(_data):
	if(orifice == null):
		return
	orifice.loadData(SAVE.loadVar(_data, "orificeData", {}))

func safeWhenExposed():
	return true

func getCharacter():
	return character.get_ref()
