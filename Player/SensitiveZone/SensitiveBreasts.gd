extends SensitiveZone

func _init():
	zoneName = "Nipples"
	zoneNameIs = "are"

func getArousalGainModifier() -> float:
	var theChar = getCharacter()
	if(theChar != null && theChar.isLactating()):
		return getSensitivity() * 0.25 # Easier if lactating
	return getSensitivity() * 0.15 # Really hard to orgasm until trained

func getLowSensitivityRestoreRate() -> float: # 15% per day
	return 0.15 * (1.0 + max(-1.0, getCustomAttribute(BuffAttribute.SensitivityRestoreAll) + getCustomAttribute(BuffAttribute.SensitivityRestoreNipples)))
	
#func getOverstimRecoverModifier() -> float:
#	return (1.0/0.3)/300.0 # 5 Hours roughly

func getOverstimSensLoseModifier() -> float:
	return 0.3

func getSensitivityGainModifier() -> float:
	return 0.2 * (1.0 + max(-1.0, getCustomAttribute(BuffAttribute.SensitivityGainAll) + getCustomAttribute(BuffAttribute.SensitivityGainNipples)))

func getStimulationGainModifier() -> float:
	return 0.3 / (1.0 + max(-0.9, getCustomAttribute(BuffAttribute.OverstimulationThresholdAll) + getCustomAttribute(BuffAttribute.OverstimulationThresholdNipples)))

func getOverstimContinueGainModifier() -> float:
	return 0.0

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

func shouldShowOverstimualtedTextInSexEngine(_sexInfo) -> bool:
	var zoneStimulation:float = getStimulation()
	if(zoneStimulation >= 0.7 || (zoneStimulation >= 0.5 && !_sexInfo.hadStim) || (isOverstimulated() && lastStimulatedAgo < 180)):
		return true
	return false

func isOverstimulationEnabled() -> bool:
	return true

func generateDataFor(_dynamicCharacter):
	var fetishHolder:FetishHolder = _dynamicCharacter.getFetishHolder()
	if(fetishHolder == null):
		return
	
	var fetishValue = fetishHolder.getFetishValue(Fetish.Lactation)
	if(fetishValue > 0.0):
		sensitivity = 1.0 + RNG.randf_range(fetishValue*0.1, fetishValue*3.0)
	elif(RNG.chance(30)):
		sensitivity = 0.5 + RNG.randf_range(0.0, 0.5)
