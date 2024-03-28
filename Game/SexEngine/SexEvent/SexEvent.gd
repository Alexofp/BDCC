extends Reference
class_name SexEvent

# Source = Person with dick
# Target = Who is being penetrated
#data:
# hole = Which BodypartSlot was penetrated
# engulfed = if the target was the one who caused the penetration (cowgirl position or sub engulfed the dick)
# strapon = was a strapon used
const HolePenetrated = "HolePenetration"

# Source = Person with dick
# Target = Who got creampied
#data:
# hole = Which BodypartSlot was creampied
# loadSize = how much cum
# knotted = if the target got knotted
# condomBroke = if there was a condom and it broke
const HoleCreampied = "HoleCreampied"

# Source = Person who spits
# Target = Who got creampied
#data:
# hole = Which BodypartSlot was spitted into
# loadSize = how much cum
const HoleSpitted = "HoleSpitted"

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

# Only gets called in sex engine
# Source = Who wrote
# Target = Who got written on
#data:
# zone = Where was the bodywriting added
# writingID = which bodywriting was added. Get the text with BodyWritings.getWritingText(writingID)
const BodyWritingAdded = "BodyWritingAdded"

# Only gets called in sex engine
# Source = Who did it
# Target = Who swallowed it
#data:
# forced = Drug was consumed against target's will
# itemID = what drug was consumed
const DrugSwallowed = "DrugSwallowed"

# Only gets called in sex engine
# Source = Who was the rigger
# Target = Who received the bondage piece
#data:
# itemID = what bdsm item was added
const BondageGearForced = "BondageGearForced"

# Only gets called in sex engine
# Source = Who was touching
# Target = Who's boobs got groped (gets called each tick)
#data:
# madeLactate = Target began lactating from the groping (only true once)
const BreastsGroped = "BreastsGroped"

# Only gets called in sex engine
# Source = Who was sucking
# Target = Who's boobs got breastfed on
#data:
# madeLactate = Target began lactating from the action (only true once)
# loadSize = how much milk was swallowed
# targetIsDom = Target is force-feeding the source
const BreastFeeding = "BreastFeeding"

# Only gets called in sex engine
# Source = Who used the breastpump
# Target = Who's boobs got milked
#data:
# madeLactate = Target began lactating from the action (only true once)
# loadSize = how much milk was collected
const BreastsPumpMilked = "BreastsPumpMilked"

# Only gets called in sex engine
# Source = Who used the breastpump
# Target = Who's boobs got milked
#data:
# loadSize = how much cum was collected
const PenisPumpMilked = "PenisPumpMilked"

# Only gets called in sex engine
# Source = Who was the cause
# Target = Who came
#data:
# orgasmType = How the target came (feet, spank, trib, breasts, rim)
const UniqueOrgasm = "UniqueOrgasm"

# Only gets called in sex engine
# Source = Who is choking
# Target = Who is getting choked
#data:
# strongChoke = is the choking extra hard
const Choking = "Choking"

# Only gets called in sex engine
# Source = Who is spanking
# Target = Who got spanked
#data:
# strongSpank = was the spank hard
# pain = how much pain did the spank inflict
const Spanked = "Spanked"

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

func sourceIsDom():
	if(!isSexEngine):
		return true
	return getSexEngine().isDom(sourceCharID)
	
func sourceIsSub():
	if(!isSexEngine):
		return true
	return getSexEngine().isSub(sourceCharID)

func targetIsDom():
	if(!isSexEngine):
		return true
	return getSexEngine().isDom(targetCharID)
	
func targetIsSub():
	if(!isSexEngine):
		return true
	return getSexEngine().isSub(targetCharID)
