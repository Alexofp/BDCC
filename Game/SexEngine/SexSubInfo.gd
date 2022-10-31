extends SexInfoBase
class_name SexSubInfo

var stance = SexStance.Standing

var resistance: float = 0.0
var fear: float = 0.0

func getInfoString():
	var character = getChar()
	
	var text = ""
	if(character != null):
		text += character.getName()+". "
	text += "Resistance: "+str(Util.roundF(resistance*100))+"% "
	text += "Fear: "+str(Util.roundF(fear*100))+"% "
	text += "Arousal: "+str(Util.roundF(getArousal()*100))+"% "
	
	return text

func initFromPersonality():
	var character = getChar()
	var personality:Personality = character.getPersonality()

	var bratiness = personality.getStat(PersonalityStat.Brattiness)
	
	if(bratiness > 0.0):
		resistance = RNG.randf_range(0.0, bratiness)

func processTurn():
	arousalNaturalFade()
	
	var character = getChar()
	var personality:Personality = character.getPersonality()

	var bratiness = personality.getStat(PersonalityStat.Brattiness)
	resistance = Util.moveNumberTowards(resistance, bratiness, 0.01)
