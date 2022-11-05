extends SexInfoBase
class_name SexSubInfo

var stance = SexStance.Standing

var resistance: float = 0.0
var fear: float = 0.0
var consciousness: float = 1.0

func getInfoString():
	var character = getChar()
	
	if(consciousness <= 0.0):
		return character.getName()+" is unconscious."
	
	var text = ""
	if(character != null):
		text += character.getName()+". "
	text += "Resistance: "+str(Util.roundF(resistance*100))+"% "
	text += "Fear: "+str(Util.roundF(fear*100))+"% "
	text += "Arousal: "+str(Util.roundF(getArousal()*100))+"% "
	text += "Consciousness: "+str(Util.roundF(consciousness*100))+"% "
	
	return text

func initFromPersonality():
	var character = getChar()
	var personality:Personality = character.getPersonality()

	var bratiness = personality.getStat(PersonalityStat.Brat)
	
	if(bratiness > 0.0):
		resistance = RNG.randf_range(0.0, bratiness)

func canDoActions():
	if(consciousness <= 0.0):
		return false
	return true

func isUnconscious():
	if(consciousness <= 0.0):
		return true
	return false

func isResisting():
	return resistance >= 0.2

func isScared():
	return fear >= (0.5 - 0.3 * personalityScore({PersonalityStat.Coward: 1.0}))
	
func isVeryScared():
	return fear >= 0.9
	
func getAboutToPassOutScore():
	if(consciousness > 0.8):
		return 0.0
	
	return clamp(1.0 - consciousness*2.0, 0.0, 1.0)
	
func addPain(newpain):
	.addPain(newpain)
	if(newpain >= 0.0 && getChar().getPainLevel() >= 1.0):
		consciousness -= float(newpain) / 100.0
		
		consciousness = clamp(consciousness, 0.0, 1.0)
	
func addFear(addfear):
	if(consciousness <= 1.0 && addfear > 0.0):
		addfear = addfear / max(consciousness, 0.1)
	fear += addfear * (1.0 + personalityScore({PersonalityStat.Coward: 0.5}))
	fear = clamp(fear, 0.0, 1.0)

func addResistance(addres):
	if(isScared()):
		addres /= 2.0
	if(isVeryScared()):
		addres /= 2.0
	
	resistance += addres * (1.0 + personalityScore({PersonalityStat.Subby: -0.2, PersonalityStat.Brat: 0.1}))
	resistance = clamp(resistance, 0.0, 1.0)

func getResistScore():
	if(isScared()):
		return 0.0
	if(isResisting()):
		return 1.0
	if(RNG.chance(personalityScore({PersonalityStat.Brat: 1.0}) * 10.0)):
		return 1.0
	return 0.0

func getComplyScore():
	if(isScared()):
		return 0.0
	if(isResisting()):
		return 0.0
	return 1.0

func processTurn():
	arousalNaturalFade()
	
#	var character = getChar()
#	var personality:Personality = character.getPersonality()
#
#	var bratiness = personality.getStat(PersonalityStat.Brattiness)
#	resistance = Util.moveNumberTowards(resistance, bratiness, 0.01)
	fear = Util.moveNumberTowards(fear, 0.0, 0.02 + personalityScore({PersonalityStat.Coward: -0.02}))
	if(isScared()):
		resistance = Util.moveNumberTowards(resistance, 0.0, fear / 10.0)
	

