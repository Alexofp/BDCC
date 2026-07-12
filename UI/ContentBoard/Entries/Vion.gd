extends ContentBoardEntryBase

func _init():
	id = "Vion"
	
func getName() -> String:
	return "Vion"

func getDesc(_isFull:bool) -> String:
	if(_isFull):
		return "Find a way to help a hypnotist dragon with his stallion problem. Also, get a chance to explore Vion's hypnosis skills. This content was submitted by PeteTimesSix."
	return "Find a way to help a hypnotist dragon with his stallion problem. (By PTS)"

func getKinks() -> Array:
	return [
		"Player will be both, a dom and a sub",
		"Hypnosis",
		"Violence",
	]

func getCompletedDesc() -> String:
	return "You managed to helped Vion with Rush!"

func getStatus() -> int:
	if(getFlag("HypnokinkModule.RushSubdued", false)):
		return ContentBoardStatus.Completed
	if(getFlag("HypnokinkModule.KnowAboutRush", false)):
		return ContentBoardStatus.InProgress
	return ContentBoardStatus.ConditionsNotMet

func getStartConditions() -> Array:
	return [
		[completeIfBool(GM.main.getDays() >= 4), "Let at least 4 days pass."],
		[completeIf("HypnokinkModule.DidVionGlance"), "Explore the prison until you stumble upon Vion randomly."],
		[completeIf("HypnokinkModule.DidVionIntroduction"), "Find Vion in the lilac cellblock."],
		[completeIf("HypnokinkModule.KnowAboutRush"), "Ask him about Rush."],
	]

func getProgressText() -> String:
	return "Follow the \"Stallion for time\" task."
