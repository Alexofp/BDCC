extends ContentBoardEntryBase

func _init():
	id = "MainKait"
	
func getName() -> String:
	return "Kait Main Route"

func getDesc(_isFull:bool) -> String:
	if(_isFull):
		return "Dominate the whole prison together with your team! Break anyone who is gonna stand in your way. This route is designed for dominant players. (This route is not fully complete yet)"
	return "Dominate the whole prison! Designed for dominant players.\n(work in progress)"

func getKinks() -> Array:
	return [
		"Player is dominant",
		"Every dominant kink",
	]

func getCompletedDesc() -> String:
	return "You made the captain your bitch!"

func getStatus() -> int:
	if(GM.main.MRH.didCompleteKaitRouteBefore() && !GM.main.hasCommittedToKaitMainRoute()):
		return ContentBoardStatus.Completed
	#if(getFlag("TaviModule.Ch7NoEnding", false) || getFlag("TaviModule.Ch7YesEnding", false) || getFlag("TaviModule.Ch7KillEnding", false)):
	#	return ContentBoardStatus.Completed
	if(getFlag("KaitModule.joinedTeam", false)):
		return ContentBoardStatus.InProgress
	if(GM.main.hasCommittedToMainRoute() && !GM.main.hasCommittedToKaitMainRoute()):
		return ContentBoardStatus.Cancelled
	return ContentBoardStatus.ConditionsNotMet

func getStartConditions() -> Array:
	return [
		[ContentBoardCondition.Complete if(getFlag("KaitModule.gotMetByKait", false) || getFlag("KaitModule.talkedKaitArena", false)) else ContentBoardCondition.Incomplete, "Find Kait by going mining and then beating Tavi up. Alternatively, find Kait in the hidden arena."],
		[completeIf("KaitModule.talkedKaitArena"), "Talk with Kait about teaming up."],
		[completeIf("KaitModule.joinedTeam"), "Team up with Kait."],
	]

func getProgressText() -> String:
	return "Complete missions that the mission board in your hideout gives you."
