extends SensitiveZone

func _init():
	zoneName = "Pussy"
	
func getSensitivityGainModifier() -> float:
	return (1.0 if isOverstimulationEnabled() else 0.2) * (1.0 + max(-1.0, getCustomAttribute(BuffAttribute.SensitivityGainAll) + getCustomAttribute(BuffAttribute.SensitivityGainVagina)))

func getStimulationGainModifier() -> float:
	return 1.0 / (1.0 + max(-0.9, getCustomAttribute(BuffAttribute.OverstimulationThresholdAll) + getCustomAttribute(BuffAttribute.OverstimulationThresholdVagina)))

func getLowSensitivityRestoreRate() -> float:
	return 0.4 * (1.0 + max(-1.0, getCustomAttribute(BuffAttribute.SensitivityRestoreAll) + getCustomAttribute(BuffAttribute.SensitivityRestoreVagina)))

func generateDataFor(_dynamicCharacter):
	var fetishHolder:FetishHolder = _dynamicCharacter.getFetishHolder()
	if(fetishHolder == null):
		return
	
	var fetishValue = fetishHolder.getFetishValue(Fetish.VaginalSexReceiving)
	if(fetishValue > 0.0):
		sensitivity = 1.0 + RNG.randf_range(fetishValue*0.05, fetishValue*0.5)
	elif(RNG.chance(30)):
		sensitivity = 0.5 + RNG.randf_range(0.0, 0.5)
