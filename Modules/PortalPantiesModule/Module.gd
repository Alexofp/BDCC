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
			"res://Modules/PortalPantiesModule/AlexRynard/AlexRynardTalkScene.gd",
			
			"res://Modules/PortalPantiesModule/PantiesQuest/AlexRynardStartPantiesQuestScene.gd",
			"res://Modules/PortalPantiesModule/PantiesQuest/AlexRynardPantiesQuestGivePanties.gd",
			"res://Modules/PortalPantiesModule/PortalPanties/PortalPantiesTakeOffScene.gd",
		]
	characters = []
	items = [
		"res://Modules/PortalPantiesModule/PortalPanties/PortalPanties.gd",
	]
	events = [
		"res://Modules/PortalPantiesModule/AlexRynard/AlexRynardFirstTalkEvent.gd",
		"res://Modules/PortalPantiesModule/AlexRynard/AlexRynardTalkEvent.gd",
		
		"res://Modules/PortalPantiesModule/PantiesQuest/AlexRynardStartPantiesQuestEvent.gd",
	]
	quests = [
		"res://Modules/PortalPantiesModule/PantiesQuest/PortalPantiesQuest.gd",
	]

func resetFlagsOnNewDay():
	pass
