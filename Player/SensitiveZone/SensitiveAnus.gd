extends SensitiveZone

func _init():
	zoneName = "Anus"

func getArousalGainModifier() -> float:
	return getSensitivity() * 0.3 # Really hard to orgasm until trained

func getLowSensitivityRestoreRate() -> float:
	return 0.15 # 15% per day

func getSensitivityGainModifier() -> float:
	return 0.5 # Might convert into global one for all others
