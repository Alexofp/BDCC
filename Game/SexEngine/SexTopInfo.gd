extends Reference
class_name SexDomInfo

var charID = null
var stance = SexStance.Standing
var goals:Array = []
var anger: float = 0.0
var trust: float = 0.0

func initInfo(theCharID):
	charID = theCharID
	initFromPersonality()

func getChar() -> BaseCharacter:
	if(charID == null):
		return null
	
	return GlobalRegistry.getCharacter(charID)

func makeAngry(howmuch = 0.2):
	anger += howmuch
	anger = clamp(anger, 0.0, 1.0)
	
func getInfoString():
	var character = getChar()
	
	var text = ""
	if(character != null):
		text += character.getName()+". "
	text += "Anger: "+str(Util.roundF(anger*100))+"% "
	text += "Trust: "+str(Util.roundF(trust*100))+"% "
	
	return text

func initFromPersonality():
	var character = getChar()
	var personality:Personality = character.getPersonality()

	var evilness = personality.getStat(PersonalityStat.Evilness)
	
	if(evilness > 0.0):
		anger = RNG.randf_range(0.0, evilness)

func processTurn():
	var character = getChar()
	var personality:Personality = character.getPersonality()

	var evilness = personality.getStat(PersonalityStat.Evilness)
	anger = Util.moveNumberTowards(anger, evilness, 0.01)
