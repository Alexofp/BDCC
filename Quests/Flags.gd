extends Object
class_name Flag

const TestFlag = "TestFlag"
const Canteen_PlayerAteToday = "Canteen_PlayerAteToday"
const Mining_IntroducedToMinning = "Mining_IntroducedToMinning"
const Game_CompletedPrologue = "Game_CompletedPrologue"
const Game_PickedStartingPerks = "Game_PickedStartingPerks"
const Player_Crime_Type = "Player_Crime_Type"
enum Crime_Type {Innocent, Theft, Murder, Prostitution}

static func resetFlagsOnNewDay():
	GM.main.setFlag(Canteen_PlayerAteToday, false)
	
	var modules = GlobalRegistry.getModules()
	for moduleID in modules:
		var module = modules[moduleID]
		
		module.resetFlagsOnNewDay()
	
	TriggerCondition.onNewDay()
