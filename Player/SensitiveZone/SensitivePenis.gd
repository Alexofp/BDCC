extends SensitiveZone

func _init():
	zoneName = "Penis"
	
func getSensitivityGainModifier() -> float:
	return 0.2

func getLowSensitivityRestoreRate() -> float:
	return 0.7

func getStimulationGainModifier() -> float:
	return 0.5

func getOverstimSensLoseModifier() -> float:
	return 3.0

func getExtraSensGainModifier() -> float:
	return 0.4
