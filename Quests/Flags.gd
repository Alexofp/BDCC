extends Object
class_name Flag

const TestFlag = "TestFlag"
const Canteen_PlayerAteToday = "Canteen_PlayerAteToday"
const Mining_IntroducedToMinning = "Mining_IntroducedToMinning"
const Game_CompletedPrologue = "Game_CompletedPrologue"
const Player_Crime_Type = "Player_Crime_Type"
enum Crime_Type {Innocent, Theft, Murder, Prostitution}
const Game_LastTimeStruggled = "Game_LastTimeStruggled"

static func resetFlagsOnNewDay():
	GM.main.setFlag(Canteen_PlayerAteToday, false)
	GM.main.setFlag(Game_LastTimeStruggled, -1)
	
	var modules = GlobalRegistry.getModules()
	for moduleID in modules:
		var module = modules[moduleID]
		
		module.resetFlagsOnNewDay()
