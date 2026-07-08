extends ContentBoardEntryBase

func _init():
	id = "Artica"
	
func getName() -> String:
	return "Artica"

func getDesc(_isFull:bool) -> String:
	if(_isFull):
		return "Corrupt a very shy herm fluff named Artica Sparkle. This content has a big focus on corruption, pawplay, breeding, chastity and tentacles."
	return "Corrupt a very shy herm fluff."

func getKinks() -> Array:
	return [
		"Player is dominant",
		"Corruption",
		"Pawplay/Pawjobs",
		"Breeding",
		"Chastity (optional)",
		"Hypnosis",
		"Tentacles",
		"Stretching",
		"Autofellatio",
		"Milking",
		"Noncon (optional)",
	]

func getCompletedDesc() -> String:
	if(getFlag("ArticaModule.LQArticaGotDreamCatcher")):
		return "Artica is happy because you found her dream catcher! She is now yours!"
	if(getFlag("ArticaModule.LQArticaGotBrainwashed", false)):
		if(getFlag("ArticaModule.CurvyForm", false)):
			return "Artica is now your happy slut! You even made her body curvier!"
		return "Artica is now your happy slut!"
	return ""

func getStatus() -> int:
	if(getFlag("ArticaModule.LQArticaGotDreamCatcher", false) || getFlag("ArticaModule.LQArticaGotBrainwashed", false)):
		return ContentBoardStatus.Completed
	if(getFlag("ArticaModule.corruptionBegan", false)):
		return ContentBoardStatus.InProgress
	return ContentBoardStatus.ConditionsNotMet

func getStartConditions() -> Array:
	return [
		[completeIfBool(GM.pc.getSkillsHolder().getLevel() >= 10), "Reach level 10."],
		[completeIf("ArticaModule.s0happened"), "Watch Artica's arrival by being near the checkpoint."],
		[completeIf("ArticaModule.s1happened"), "Find Artica in the lilac cellblock first."],
		[completeIf("ArticaModule.s2happened"), "Find Artica in the canteen next."],
		[completeIf("ArticaModule.corruptionBegan"), "Keep visiting Artica in the canteen every day."],
	]

func getProgressText() -> String:
	return "Make Artica horny by teasing her and then watch what she will do by waiting near her."
