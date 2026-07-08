extends ContentBoardEntryBase

func _init():
	id = "Jacki"
	
func getName() -> String:
	return "Jacki Northstar"

func getDesc(_isFull:bool) -> String:
	if(_isFull):
		return "Have fun with a kind wolfo that is wearing unique chastity piercings that keep her pussy lips always shut. This content is focused around corruption and anal sex."
	return "Have fun with a kind wolfo that is wearing unique chastity piercings."

func getKinks() -> Array:
	return [
		"Player is dominant",
		"Noncon/Stalking",
		"Anal sex only (pc is top)",
		"Hole stretching",
		"Corruption",
	]

func getCompletedDesc() -> String:
	if(getFlag("JackiModule.Jacki_ch2GotPussyFreed")):
		return "Jacki is now yours! You have freed her pussy too!"
	if(getFlag("JackiModule.Jacki_ch2GotExtraPiercings")):
		return "Jacki is now yours! You even added some extra piercings!"
	return "Jacki is now yours!"

func getStatus() -> int:
	if(getFlag("JackiModule.Jacki_ch2GotEnslaved", false)):
		return ContentBoardStatus.Completed
	if(getFlag("JackiModule.Jacki_ch2IntroSceneHappened", false)):
		return ContentBoardStatus.InProgress
	if(getFlag("JackiModule.Jacki_ContentDisabled", false)):
		return ContentBoardStatus.Cancelled
	if(getFlag("JackiModule.Jacki_StocksSceneHappened", false)):
		return ContentBoardStatus.NotStarted
	return ContentBoardStatus.ConditionsNotMet

func getStartConditions() -> Array:
	return [
		[completeIfBool(GM.pc.getSkillsHolder().getLevel() >= 5), "Reach level 5."],
		[completeIf("JackiModule.Jacki_FirstTimeEncountered"), "Head towards the yard area to run into Jacki for the first time."],
		[completeIf("JackiModule.Jacki_StocksSceneHappened"), "Find Jacki stuck in stocks and decide what to do with her."],
		[completeIf("JackiModule.Jacki_ch2IntroSceneHappened"), "Talk with Jacki at the gym!"],
	]

func getProgressText() -> String:
	return "Raise Jacki's lust and corruption stats by interacting with her, unlocking new options and scenes as you do."
