extends SexInfoBase
class_name SexDomInfo

var stance = SexStance.Standing
var goals:Array = []
var anger: float = 0.0
var trust: float = 0.0

func addAnger(howmuch = 0.2):
	anger += howmuch * max(0.0, (1.0 + personalityScore({PersonalityStat.Mean:1.0, PersonalityStat.Impatient:0.5})))
	anger = clamp(anger, 0.0, 1.0)

func getAngerScore():
	return anger

func isAngry():
	return anger > 0.5

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

	var mean = personality.getStat(PersonalityStat.Mean)
	
	if(mean > 0.0):
		anger = RNG.randf_range(0.0, mean)

func processTurn():
	arousalNaturalFade()
	
#	var character = getChar()
#	var personality:Personality = character.getPersonality()
#
#	var evilness = personality.getStat(PersonalityStat.Evilness)
#	anger = Util.moveNumberTowards(anger, evilness, 0.01)

func hasGoals():
	return goals.size() > 0
