extends SensitiveZone

func _init():
	zoneName = "Anus"

func getArousalGainModifier() -> float:
	return getSensitivity() * 0.3 # Really hard to orgasm until trained

func getLowSensitivityRestoreRate() -> float: # 15% per day
	return 0.15 * (1.0 + max(-1.0, getCustomAttribute(BuffAttribute.SensitivityRestoreAll) + getCustomAttribute(BuffAttribute.SensitivityRestoreAnus)))
	
func getSensitivityGainModifier() -> float:
	return 0.5 * (1.0 + max(-1.0, getCustomAttribute(BuffAttribute.SensitivityGainAll) + getCustomAttribute(BuffAttribute.SensitivityGainAnus)))

func getStimulationGainModifier() -> float:
	return 1.0 / (1.0 + max(-0.9, getCustomAttribute(BuffAttribute.OverstimulationThresholdAll) + getCustomAttribute(BuffAttribute.OverstimulationThresholdAnus)))

func generateDataFor(_dynamicCharacter):
	var fetishHolder:FetishHolder = _dynamicCharacter.getFetishHolder()
	if(fetishHolder == null):
		return
	
	var fetishValue = fetishHolder.getFetishValue(Fetish.AnalSexReceiving)
	if(fetishValue > 0.0):
		sensitivity = 1.0 + RNG.randf_range(fetishValue*0.2, fetishValue*3.0)
	elif(RNG.chance(30)):
		sensitivity = 0.5 + RNG.randf_range(0.0, 0.5)
