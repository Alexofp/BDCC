extends ContentBoardEntryBase

func _init():
	id = "Arena"
	
func getName() -> String:
	return "Arena"

func getDesc(_isFull:bool) -> String:
	if(_isFull):
		return "Become the Grand Champion of the hidden underground arena that has only rule: No Rules!"
	return "Become the Grand Champion of the hidden underground arena that has only rule: No Rules!"

func getKinks() -> Array:
	return [
		"Violence",
		"Noncon",
		"Sex (pc can be top or bottom)",
	]

func getCompletedDesc() -> String:
	return "You defeated Avy and became the Grand Champion!"

func getStatus() -> int:
	if(getFlag("FightClubModule.AvyGotRekt", false)):
		return ContentBoardStatus.Completed
	if(getFlag("FightClubModule.FightClubFirstArenaIntroduction", false)):
		return ContentBoardStatus.InProgress
	if(getFlag("FightClubModule.AvyIntroduced", false)):
		return ContentBoardStatus.NotStarted
	return ContentBoardStatus.ConditionsNotMet

func getStartConditions() -> Array:
	return [
		[completeIf("FightClubModule.BulldogFirstTimeHappened"), "Find the hidden entrance to the underground arena somewhere near the gym."],
		[completeIf("FightClubModule.BulldogBypassed"), "Get into the arena by paying off the bulldog or fighting him."],
		[completeIf("FightClubModule.AnnouncerIntroduced"), "Talk with the Announcer."],
		[completeIf("FightClubModule.AvyIntroduced"), "Talk with Avy."],
		[completeIf("FightClubModule.FightClubFirstArenaIntroduction"), "Start your first fight at the arena!"],
	]

func getProgressText() -> String:
	if(getFlag("FightClubModule.GotTaskToStealPlant", false) && !getFlag("FightClubModule.AvyGotRekt", false)):
		return "Complete the \"The Fallen Champion\" task in order to defeat Avy."
	return "Progress through the arena ranks by winning fights."
