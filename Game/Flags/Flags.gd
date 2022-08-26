extends Object
class_name Flag

const TestFlag = "TestFlag"
const Canteen_PlayerAteToday = "Canteen_PlayerAteToday"
const Mining_IntroducedToMinning = "Mining_IntroducedToMinning"
const Game_CompletedPrologue = "Game_CompletedPrologue"
const Game_PickedStartingPerks = "Game_PickedStartingPerks"
const Player_Crime_Type = "Player_Crime_Type"
enum Crime_Type {Innocent, Theft, Murder, Prostitution}
const Trigger_CaughtOffLimitsCD = "Trigger_CaughtOffLimitsCD"




static func resetFlagsOnNewDay():
	GM.main.setFlag(Canteen_PlayerAteToday, false)
	
	var modules = GlobalRegistry.getModules()
	for moduleID in modules:
		var module = modules[moduleID]
		
		module.resetFlagsOnNewDay()

static func flag(type):
	return {
		"type": type,
	}

static func getFlags():
	return {
		"TestFlag": flag(FlagType.Bool),
		"Canteen_PlayerAteToday": flag(FlagType.Bool),
		"Mining_IntroducedToMinning": flag(FlagType.Bool),
		"Game_CompletedPrologue": flag(FlagType.Bool),
		"Game_PickedStartingPerks": flag(FlagType.Bool),
		"Player_Crime_Type": flag(FlagType.Number),
		"Trigger_CaughtOffLimitsCD": flag(FlagType.Number),
		
	}
	
