extends Object
class_name Flag

static func getFlags():
	return {
		"Canteen_PlayerAteToday": flag(FlagType.Bool),
		"Mining_IntroducedToMinning": flag(FlagType.Bool),
		"Game_CompletedPrologue": flag(FlagType.Bool),
		"Game_PickedStartingPerks": flag(FlagType.Bool),
		"Player_Crime_Type": flag(FlagType.Number),
		"Trigger_CaughtOffLimitsCD": flag(FlagType.Number),
		"ExposureEventCD": flag(FlagType.Number),
		"LastTimePeed": flag(FlagType.Number),
		"PickedSkinAtLeastOnce": flag(FlagType.Bool),
	}

enum Crime_Type {Innocent, Theft, Murder, Prostitution}

static func resetFlagsOnNewDay():
	if(GM.main.getFlag("Canteen_PlayerAteToday")):
		GM.main.setFlag("Canteen_PlayerAteToday", false)
	
	var modules = GlobalRegistry.getModules()
	for moduleID in modules:
		var module = modules[moduleID]
		
		module.resetFlagsOnNewDay()

static func flag(type):
	return {
		"type": type,
	}
