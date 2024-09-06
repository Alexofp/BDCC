extends RepStatBase

func _init():
	id = RepStat.Alpha

func getVisibleName():
	return "Alpha Reputation"

func getMaxLevel() -> int:
	return 6

func getMinLevel() -> int:
	return -1

# Opposite of Alpha is Doormat
func getTextForLevel(_level:int, _rep):
	if(_level <= -1):
		return "Doormat"
	if(_level == 0):
		return "Unknown"
	if(_level == 1):
		return "Someone"
	if(_level == 2):
		return "Small dom"
	if(_level == 3):
		return "Slaver"
	if(_level == 4):
		return "Pack Leader"
	if(_level == 5):
		return "Mind Breaker"
	if(_level == 6):
		return "Prison Alpha"
	return "ALPHA"

func getSpecialRequirementToReachLevel(_level:int, _rep):
	if(_level == 3):
		return ["enslavesomeone", "Enslave anyone"]
	if(_level == 5):
		return ["makeobey", "Make any slave submit to you.. or break their mind"]
	
	return null

func getEffectsInfoForLevel(_level:int, _rep) -> Array:
	if(_level <= 1):
		return []
	if(_level <= 3):
		return [
			"Subby people are slightly more likely to agree to get fucked by you.",
		]
	if(_level <= 5):
		return [
			"Subby people are more likely to agree to get fucked by you.",
			"You earn more credits as a service dom.",
		]
	return [
		"People are eager to be fucked by you.",
		"You earn more credits as a service dom.",
		"You can enslave subby people without having to break them.",
	]
