extends Reference
class_name PlayerSlaveryDef

# A very light-weight object that just contains some info about the slavery and has the ability to create the actual thing

var id:String = ""

func getVisibleName() -> String:
	return "Error"

func getVisibleDesc() -> String:
	return "Fill me"

func canBeChosen() -> bool:
	return true

func getImpossibleReason() -> String:
	return ""

# It's not a true slavery, will never be picked randomly unless it's the only choice
func isTrivial() -> bool:
	return false

func createSlavery():
	return null

func getEndings() -> Dictionary:
	return {}
