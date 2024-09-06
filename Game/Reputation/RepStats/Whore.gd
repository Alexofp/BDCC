extends RepStatBase

func _init():
	id = RepStat.Whore

func getVisibleName():
	return "Whore Reputation"

func getMaxLevel() -> int:
	return 9

func getMinLevel() -> int:
	return -1

# Opposite of Alpha is Doormat
func getTextForLevel(_level:int, _rep):
	if(_level <= -1):
		return "Unstained"
	if(_level == 0):
		return "Unknown"
	if(_level == 1):
		return "Tease"
	if(_level == 2):
		return "Small slut"
	if(_level == 3):
		return "Slut-in-Training"
	if(_level == 4):
		return "Local Whore"
	if(_level == 5):
		return "Prison's Bicycle"
	if(_level == 6):
		return "Certified Slut"
	if(_level == 7):
		return "Cumdump"
	if(_level == 8):
		return "Prison's Whore"
	if(_level >= 9):
		return "Famous Prison Slut"
	return "WHORE"

func getSpecialRequirementToReachLevel(_level:int, _rep):
	if(_level == 3):
		return ["befuckedstocks", "Be fucked in stocks"]
	if(_level == 5):
		return ["whoreany", "Make a client satisfied as a whore"]
	if(_level == 7):
		return ["befuckedslutwall", "Be used in a slutwall"]
	if(_level == 9):
		return ["whorelot", "Earn at least 30 credits from a single client as a whore"]
	
	return null

func getEffectsInfoForLevel(_level:int, _rep) -> Array:
	if(_level <= 1):
		return []
	if(_level <= 2):
		return [
			"Others are slightly more likely to agree to fuck you.",
		]
	if(_level <= 3):
		return [
			"Others are slightly more likely to agree to fuck you.",
			"You earn slightly more credits as a slut.",
		]
	if(_level <= 4):
		return [
			"Others are slightly more likely to agree to fuck you.",
			"You earn slightly more credits as a slut.",
			"You can offer to be a service dom to clients.",
		]
	if(_level <= 7):
		return [
			"Others are more likely to agree to fuck you.",
			"You earn slightly more credits as a slut.",
			"You can offer to be a service dom to clients.",
		]
	if(_level <= 8):
		return [
			"Others are more likely to agree to fuck you.",
			"You earn slightly more credits as a slut.",
			"You can offer to be a service dom to clients.",
			"Pricy Slut option is unlocked for you in prostitution.",
		]
	return [
		"People are eager to fuck you.",
		"You earn more credits as a slut.",
		"You can offer to be a service dom to clients.",
		"Pricy Slut option is unlocked for you in prostitution.",
	]
