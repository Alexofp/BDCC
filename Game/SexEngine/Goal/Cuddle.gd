extends SexGoalBase

func _init():
	id = SexGoal.Cuddle

func getVisibleName():
	return "Cuddle"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_subInfo.isUnconscious()):
		return false
	
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
	}

func getGoalDefaultWeight():
	return 1.0

func canBegFor() -> bool:
	return true

func getBegName() -> String:
	return "Cuddle"

func getBegCategory() -> Array:
	return BegCategoryExotic

func getBegDesc() -> String:
	return "Beg the dom to cuddle you!"

func getBegMessage(_sexEngine, _domInfo, _subInfo) -> String:
	return "{sub.You} {sub.youVerb('beg')} {dom.you} to cuddle {sub.youHim}."

func getBegDialogue(_sexEngine, _domInfo, _subInfo) -> String:
	return RNG.pick([
		"Do you wanna cuddle maybe?",
		"How about we just cuddle for a bit?",
		"Maybe you'd want to cuddle with me?",
		"Wanna cuddle maybe?",
	])

func getBegDomFetishes() -> Dictionary:
	return {
		Fetish.Exhibitionism: 1.0,
	}
