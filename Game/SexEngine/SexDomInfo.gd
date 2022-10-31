extends SexInfoBase
class_name SexDomInfo

var stance = SexStance.Standing
var goals:Array = []
var anger: float = 0.0
var trust: float = 0.0

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
	text += "Arousal: "+str(Util.roundF(getArousal()*100))+"% "
	
	return text

func initFromPersonality():
	var character = getChar()
	var personality:Personality = character.getPersonality()

	var evilness = personality.getStat(PersonalityStat.Evilness)
	
	if(evilness > 0.0):
		anger = RNG.randf_range(0.0, evilness)

func processTurn():
	arousalNaturalFade()
	
	var character = getChar()
	var personality:Personality = character.getPersonality()

	var evilness = personality.getStat(PersonalityStat.Evilness)
	anger = Util.moveNumberTowards(anger, evilness, 0.01)

func hasGoals():
	return goals.size() > 0
