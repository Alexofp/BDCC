extends ContentBoardEntryBase

func _init():
	id = "AlexRynard"
	
func getName() -> String:
	return "Alex Rynard"

func getDesc(_isFull:bool) -> String:
	if(_isFull):
		return "Offer your company to a lonely engineer foxy guy who has trust issues. This content is focused around wholesome interactions and safe BDSM practices."
	return "Offer your company to a lonely engineer foxy who has trust issues."

func getKinks() -> Array:
	return [
		"Player is sub",
		"BDSM",
		"Soft submission",
		"Sex machines",
		"Milking",
		"Hypnosis",
		"Sex (pc is bottom)",
	]

func getCompletedDesc() -> String:
	return "You helped Alex become a better version of himself!"

func getStatus() -> int:
	if(getFlag("AlexRynardModule.ch2FinalSceneHappened", false)):
		return ContentBoardStatus.Completed
	if(getFlag("AlexRynardModule.ch1StopAlexContent", false)):
		return ContentBoardStatus.Cancelled
	if(getFlag("AlexRynardModule.ch1IntroSceneHappened", false)):
		return ContentBoardStatus.InProgress
	return ContentBoardStatus.ConditionsNotMet

func getStartConditions() -> Array:
	return [
		[completeIf("Mining_IntroducedToMinning"), "Follow Risha's order and go work in the mines."],
		[completeIf("PortalPantiesModule.Alex_FirstTimeTalked"), "Talk with Alex Rynard near the entrance to the mines."],
		[completeIf("PortalPantiesModule.Panties_AskedAlex"), "Ask Alex Rynard if he can help you with credits."],
		[completeIfBool(getFlag("PortalPantiesModule.Panties_FleshlightsReturnedToAlex", false) || getFlag("PortalPantiesModule.Panties_PcDenied", false)), "Complete the 'portal panties' task that Alex Rynard gives fully or decline him after trying them once."],
		[completeIf("AlexRynardModule.ch1IntroSceneHappened"), "Ask Alex Rynard in the workshop if he is up for lewd stuff!"],
	]

func getProgressText() -> String:
	return "Keep visiting Alex Rynard in the workshop and helping him."
