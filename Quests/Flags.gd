extends Object
class_name Flag

const TestFlag = "TestFlag"
const Canteen_PlayerAteToday = "Canteen_PlayerAteToday"
const Mining_IntroducedToMinning = "Mining_IntroducedToMinning"
const Game_CompletedPrologue = "Game_CompletedPrologue"
const Player_Crime_Type = "Player_Crime_Type"
enum Crime_Type {Murder}
const Player_Crime_Why = "Player_Crime_Why"
enum Crime_Reason {Money, Revenge}

static func resetFlagsOnNewDay():
	GM.main.setFlag(Canteen_PlayerAteToday, false)
	
	var modules = GlobalRegistry.getModules()
	for moduleID in modules:
		var module = modules[moduleID]
		
		module.resetFlagsOnNewDay()
