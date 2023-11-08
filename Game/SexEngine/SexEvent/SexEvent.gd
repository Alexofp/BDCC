extends Reference
class_name SexEvent

# Source = Person with dick
# Target = Who is being penetrated
#data:
# engulfed = if the target was the one who caused the penetration (cowgirl position or sub engulfed the dick)
const VaginalPenetration = "VaginalPenetration"
const AnalPenetration = "AnalPenetration"
const ThroatPenetration = "ThroatPenetration"

# Source = Person with dick
# Target = Who got creampied
#data:
# loadSize = how much cum
# knotted = if the target got knotted
# condomBroke = if there was a condom and it broke
const VaginalCreampie = "VaginalCreampie"
const AnalCreampie = "AnalCreampie"
const ThroatCreampie = "ThroatCreampie"

# Source = Person with dick
# Target = Who had the condom in them
#data:
# loadSize = how much cum got transfered into the condom
# knotted = if the target got knotted
const VaginalFilledCondom = "VaginalFilledCondom"
const AnalFilledCondom = "AnalFilledCondom"
const ThroatFilledCondom = "ThroatFilledCondom"

# Only gets called if the strapon wasn't empty
# Source = Person with dick
# Target = Who had the condom in them
#data:
# loadSize = how much cum
const VaginalStraponCreampie = "VaginalStraponCreampie"
const AnalStraponCreampie = "AnalStraponCreampie"
const ThroatStraponCreampie = "ThroatStraponCreampie"

const EmptyEvent = "EmptyEvent"





var type:String = EmptyEvent
var sourceCharID:String = ""
var targetCharID:String = ""
var data:Dictionary = {}

var isSexEngine:bool = false
var sexActivity

func getType():
	return type

func getSourceChar():
	return GlobalRegistry.getCharacter(sourceCharID)

func getTargetChar():
	return GlobalRegistry.getCharacter(targetCharID)

func getField(id, defaultValue = null):
	if(!data.has(id)):
		return defaultValue
	return data[id]

func isSexEngineEvent():
	return isSexEngine

func getSexEngine():
	if(sexActivity == null):
		return null
	return sexActivity.getSexEngine()

func getSubInfo():
	if(sexActivity == null):
		return null
	return sexActivity.subInfo

func getDomInfo():
	if(sexActivity == null):
		return null
	return sexActivity.domInfo
