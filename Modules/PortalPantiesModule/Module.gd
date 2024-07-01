extends Module

func getFlags():
	return {
		"Alex_FirstTimeTalked": flag(FlagType.Bool),
		"Alex_BusyDays": flag(FlagType.Number),
		"Panties_AskedAlex": flag(FlagType.Bool),
		"Panties_GavePantiesToAlex": flag(FlagType.Bool),
		"Panties_PcDenied": flag(FlagType.Bool),
		"Panties_SceneCooldown": flag(FlagType.Number),
		"Panties_FirstTestHappened": flag(FlagType.Bool),
		"Panties_TestAmmount": flag(FlagType.Number),
		"Panties_FleshlightsGotStolen": flag(FlagType.Bool),
		"Panties_FleshlightsAskedAlex": flag(FlagType.Bool),
		"Panties_FleshlightsFoundFleshlights": flag(FlagType.Bool),
		"Panties_FleshlightsReturnedToAlex": flag(FlagType.Bool),
		"Panties_FleshlightsReturnedPanties": flag(FlagType.Bool),
		"Panties_Mode": flag(FlagType.Number),
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
			"res://Modules/PortalPantiesModule/PantiesQuest/PortalPantiesQuestCellblockScene.gd",
			
			"res://Modules/PortalPantiesModule/PortalPantiesEvents/PortalPantiesTestsScene.gd",
			"res://Modules/PortalPantiesModule/PortalPantiesEvents/PortalPantiesSleepTestsScene.gd",
			"res://Modules/PortalPantiesModule/PortalPantiesEvents/PortalPantiesFirstLewdScene.gd",
			"res://Modules/PortalPantiesModule/PortalPantiesEvents/PortalPantiesLewdsScene.gd",
			"res://Modules/PortalPantiesModule/PortalPantiesEvents/PortalPantiesShowerLewdScene.gd",
			"res://Modules/PortalPantiesModule/PortalPantiesEvents/PortalPantiesSleepingLewdScene.gd",
			"res://Modules/PortalPantiesModule/PantiesQuest/AlexRynardPantiesQuestWTFScene.gd",
			"res://Modules/PortalPantiesModule/PantiesQuest/AlexRynardPantiesQuestReturnFleshlightsScene.gd",
			
			"res://Modules/PortalPantiesModule/PortalPanties/UsePortalPantiesFleshlight.gd",
		]
	characters = [
		"res://Modules/PortalPantiesModule/PantiesQuest/StudCharacter.gd",
	]
	items = [
		"res://Modules/PortalPantiesModule/PortalPanties/PortalPanties.gd",
		"res://Modules/PortalPantiesModule/PortalPanties/PortalPantiesFleshlight.gd",
		"res://Modules/PortalPantiesModule/PortalPanties/PortalPantiesUnlocked.gd",
	]
	events = [
		"res://Modules/PortalPantiesModule/AlexRynard/AlexRynardFirstTalkEvent.gd",
		"res://Modules/PortalPantiesModule/AlexRynard/AlexRynardTalkEvent.gd",
		"res://Modules/PortalPantiesModule/PantiesQuest/PortalPantiesQuestCellblockEvent.gd",
		
		"res://Modules/PortalPantiesModule/PantiesQuest/AlexRynardStartPantiesQuestEvent.gd",
		"res://Modules/PortalPantiesModule/PortalPanties/PortalPantiesEvent.gd",
		"res://Modules/PortalPantiesModule/PortalPantiesEvents/PortalPantiesTestsEvent.gd",
		"res://Modules/PortalPantiesModule/PortalPantiesEvents/PortalPantiesFirstLewdEvent.gd",
		"res://Modules/PortalPantiesModule/PortalPantiesEvents/PortalPantiesLewdsEvent.gd",
	]
	quests = [
		"res://Modules/PortalPantiesModule/PantiesQuest/PortalPantiesQuest.gd",
	]
	worldEdits = [
		"res://Modules/PortalPantiesModule/AlexRynard/AlexRynardWorldEdit.gd",
	]

func resetFlagsOnNewDay():
	if(GM.main.getFlag("PortalPantiesModule.Alex_BusyDays", 0) > 0):
		GM.main.increaseFlag("PortalPantiesModule.Alex_BusyDays", -1)

func registerEventTriggers():
	GM.ES.registerEventTrigger("PortalPantiesEvent", EventTriggerWeighted.new())
	GM.ES.registerEventTrigger("PortalPantiesShowerEvent", EventTriggerWeighted.new())
	GM.ES.registerEventTrigger("PortalPantiesSleepingEvent", EventTriggerWeighted.new())
