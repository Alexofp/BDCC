extends Reference
class_name CustomBodypartSlot

var id : String = "badslot"

# see BodypartSlot's same function
static func findReplacement(_oldvalue, _species=null, _gender=Gender.Androgynous):
	return null

func getVisibleName() -> String:
	return getVisibleNameNoCap().capitalize()

func getVisibleNameNoCap() -> String:
	return "bad slot"

func isEssential() -> bool:
	return true
