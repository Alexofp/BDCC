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

func createSlavery():
	return null
