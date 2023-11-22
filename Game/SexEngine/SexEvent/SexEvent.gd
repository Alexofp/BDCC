extends Reference
class_name SexEvent

# Source = Person with dick
# Target = Who is being penetrated
#data:
# hole = Which BodypartSlot was penetrated
# engulfed = if the target was the one who caused the penetration (cowgirl position or sub engulfed the dick)
const HolePenetrated = "HolePenetration"

# Source = Person with dick
# Target = Who got creampied
#data:
# hole = Which BodypartSlot was creampied
# loadSize = how much cum
# knotted = if the target got knotted
# condomBroke = if there was a condom and it broke
const HoleCreampied = "HoleCreampied"

# Source = Person with dick
# Target = Who had the condom in them
#data:
# hole = Which BodypartSlot was involved
# loadSize = how much cum got transfered into the condom
# knotted = if the target got knotted
const FilledCondomInside = "FilledCondomInside"

# Only gets called if the strapon wasn't empty
# Source = Person with dick
# Target = Who had the strapon in them
#data:
# hole = Which BodypartSlot was creampied
# loadSize = how much cum
const StraponCreampied = "StraponCreampied"

# Source = Person who did it
# Target = Who received the cum
#data:
# loadSize = how much cum
# fluidSource = penis/vagina/strapon/pissing
const ReceivedFluidsOnBody = "ReceivedFluidsOnBody"

# Source = Main person (who leads)
# Target = Subby person
#data:
# sharedFluids = if we shared some cum while doing this
const RubbedVaginas = "RubbedVaginas"

# In writted scenes the target is pretty much always pc
# Source = Who made us cum
# Target = Who came (pc in written content)
const Orgasmed = "Orgasmed"

# Only gets called in sex engine
# Source = Who inflicted pain
# Target = Who got scratched/punched/etc
#data:
# pain = How much pain was inflicted
# isDefense = Is the target trying to defend themselves from the source
# intentional = Was the damage done on purpose
const PainInflicted = "PainInflicted"


const EmptyEvent = "EmptyEvent"





var type:String = EmptyEvent
var sourceCharID:String = ""
var targetCharID:String = ""
var data:Dictionary = {}

var isSexEngine:bool = false
var sexEngine

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
	if(sexEngine == null):
		return null
	return sexEngine
