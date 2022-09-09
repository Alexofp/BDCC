extends Module

func getFlags():
	return {
		"Alex_FirstTimeTalked": flag(FlagType.Bool),
		"Panties_AskedAlex": flag(FlagType.Bool),
		"Panties_GavePantiesToAlex": flag(FlagType.Bool),
		"Panties_PcDenied": flag(FlagType.Bool),
		"Panties_TestsBegan": flag(FlagType.Bool),
		"Panties_FirstTestHappened": flag(FlagType.Bool),
		"Panties_TestAmmount": flag(FlagType.Number),
		"Panties_FleshlightsGotStolen": flag(FlagType.Bool),
		"Panties_FleshlightsAskedAlex": flag(FlagType.Bool),
		"Panties_FleshlightsReturnedToAlex": flag(FlagType.Bool),
	}

func _init():
	id = "PortalPantiesModule"
	author = "Rahi"
	
	scenes = [
			"res://Modules/PortalPantiesModule/AlexRynard/AlexRynardFirstTimeTalk.gd",
		]
	characters = []
	items = [
		"res://Modules/PortalPantiesModule/PortalPanties/PortalPanties.gd",
	]
	events = [
		"res://Modules/PortalPantiesModule/AlexRynard/AlexRynardFirstTalkEvent.gd",
	]
	quests = [

	]

func resetFlagsOnNewDay():
	pass
