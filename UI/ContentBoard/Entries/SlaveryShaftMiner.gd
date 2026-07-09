extends ContentBoardEntryBase

func _init():
	id = "SlaveryShaftMiner"
	
func getName() -> String:
	return "Shaft Miner"

func getDesc(_isFull:bool) -> String:
	if(_isFull):
		return "Get sold on a slave auction and become a shaft miner on a godforsaken planet."
	return "Get sold on a slave auction and become a shaft miner on a godforsaken planet."

func getKinks() -> Array:
	return [
		"Soft bad end",
		"Non-sexual focus",
		"Incremental game mechanics",
		"Mining ore",
	]

func getCompletedDesc() -> String:
	return "You have managed to escape slavery!"

func getStatus() -> int:
	if(GM.main.PSH.didComplete("ShaftMiner")):
		return ContentBoardStatus.Completed
	if(GM.main.isInSpecificPlayerSlavery("ShaftMiner")):
		return ContentBoardStatus.InProgress
	if(getFlag("PlayerSlaveryModule.foundMeme", false)):
		return ContentBoardStatus.NotStarted
	return ContentBoardStatus.ConditionsNotMet

func getStartConditions() -> Array:
	return [
		[completeIf("FightClubModule.BulldogBypassed"), "Find a way to get into the underground arena."],
		[completeIf("PlayerSlaveryModule.foundMeme"), "Find a credits chip that's glued to the floor in one of the corners. Try to peel it off!"],
		[completeIfBool(getFlag("PlayerSlaveryModule.mirriTimes", 0)>0||getFlag("PlayerSlaveryModule.luxeTimes", 0)>0), "Get sold away on a slave auction."],
	]

func getProgressText() -> String:
	return "Find a way to escape the slavery."
