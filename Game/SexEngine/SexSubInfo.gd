extends Reference
class_name SexSubInfo

var charID = null
var stance = SexStance.Standing
var unwillingness: float = 0.0
var sadness: float = 0.0

func initInfo(theCharID):
	charID = theCharID

func getChar() -> BaseCharacter:
	if(charID == null):
		return null
	
	return GlobalRegistry.getCharacter(charID)
