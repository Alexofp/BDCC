extends Node
class_name Bodypart

var id
var dollType
var limbSlot
var visibleName

func _init():
	pass

func _getDollType():
	return dollType

func getLimbSlot():
	return limbSlot

func saveData():
	return {}

func loadData(_data):
	pass

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

func processTime(_seconds: int):
	pass

func hoursPassed(_howmuch):
	pass

func safeWhenExposed():
	return true
