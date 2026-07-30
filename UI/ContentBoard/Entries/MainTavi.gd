extends ContentBoardEntryBase

func _init():
	id = "MainTavi"
	
func getName() -> String:
	return "Tavi Main Route"

func getDesc(_isFull:bool) -> String:
	if(_isFull):
		return "Become Tavi's sidekick and find a way to escape the prison together. This route is designed for switch players, ones who are okay with both, dominating and submitting."
	return "Become Tavi's sidekick and find a way to escape the prison together. Designed for switch players."

func getKinks() -> Array:
	return [
		"Player will dom and sub",
		"Every kind of sex",
		"BDSM",
		"Corruption",
		"Noncon (optional)",
	]

func getCompletedDesc() -> String:
	if(getFlag("TaviModule.Ch7NoEnding")):
		return "You have escaped the prison together with Tavi!"
	if(getFlag("TaviModule.Ch7YesEnding")):
		return "You and Tavi became captain's best spy agents! You have a nice life now."
	if(getFlag("TaviModule.Ch7KillEnding")):
		return "You and Tavi became captain's best spy agents! You have a nice life now."
	return ""

func getStatus() -> int:
	if(GM.main.MRH.didCompleteTaviRouteBefore() && !GM.main.hasCommittedToTaviMainRoute()):
		return ContentBoardStatus.Completed
	if(getFlag("TaviModule.Ch7NoEnding", false) || getFlag("TaviModule.Ch7YesEnding", false) || getFlag("TaviModule.Ch7KillEnding", false)):
		return ContentBoardStatus.Completed
	if(GM.main.hasCommittedToMainRoute() && !GM.main.hasCommittedToTaviMainRoute()):
		return ContentBoardStatus.Cancelled
	if(getFlag("TaviModule.Tavi_IntroducedTo", false)):
		return ContentBoardStatus.InProgress
	return ContentBoardStatus.ConditionsNotMet

func getStartConditions() -> Array:
	return [
		[completeIf("Mining_IntroducedToMinning"), "Follow Risha's order and go work in the mines."],
		[completeIf("TaviModule.Tavi_IntroducedTo"), "Meet Tavi and submit to her."],
	]

func getProgressText() -> String:
	return "Follow the tasks that Tavi gives you."
