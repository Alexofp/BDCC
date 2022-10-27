extends Reference
class_name SexDomInfo

var charID = null
var stance = SexStance.Standing
var goals:Array = []
var anger: float = 0.0
var trust: float = 0.0

func initInfo(theCharID):
	charID = theCharID

func getChar() -> BaseCharacter:
	if(charID == null):
		return null
	
	return GlobalRegistry.getCharacter(charID)
