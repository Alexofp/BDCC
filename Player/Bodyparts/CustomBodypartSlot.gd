extends Reference
class_name CustomBodypartSlot

var id : String = "badslot"

# see BodypartSlot.findReplacement()
func findReplacement(_oldBodypartID:String, _species=null, _gender=Gender.Androgynous) -> String:
	return ""

func getVisibleName() -> String:
	return getVisibleNameNoCap().capitalize()

func getVisibleNameNoCap() -> String:
	return "bad slot"

func isEssential() -> bool:
	return true
