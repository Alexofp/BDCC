extends SensitiveZone

func _init():
	zoneName = "Nipples"
	zoneNameIs = "are"

func getArousalGainModifier() -> float:
	var theChar = getCharacter()
	if(theChar != null && theChar.isLactating()):
		return getSensitivity() * 0.25 # Easier if lactating
	return getSensitivity() * 0.15 # Really hard to orgasm until trained

func getLowSensitivityRestoreRate() -> float:
	return 0.15 # Per day

#func getOverstimRecoverModifier() -> float:
#	return (1.0/0.3)/300.0 # 5 Hours roughly

func getOverstimSensLoseModifier() -> float:
	return 0.1

func getSensitivityGainModifier() -> float:
	return 0.2

func getStimulationGainModifier() -> float:
	return 0.3

func isOverstimulated() -> bool:
	var theChar = getCharacter()
	if(theChar == null):
		return false
	
	return theChar.hasEffect(StatusEffect.SoreNipplesAfterMilking)

func onOverstimulation():
	#overstimulation = max(overstimulation, stimulation)
	stimulation = 0.0
	var theChar = getCharacter()
	if(theChar == null):
		return
	if(theChar.hasPerk(Perk.MilkNoSoreNipples)):
		return
	theChar.addEffect(StatusEffect.SoreNipplesAfterMilking)

func getOverstimulation() -> float:
	if(isOverstimulated()):
		return 1.0
	return 0.0
