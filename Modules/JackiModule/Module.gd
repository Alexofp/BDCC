extends Module

func getFlags():
	return {
		"Jacki_FirstTimeEncountered": flag(FlagType.Bool),
		"Jacki_FirstTimeWasMean": flag(FlagType.Bool),
		"Jacki_FirstTimeWasMeanPinned": flag(FlagType.Bool),
		"Jacki_FirstTimeWasKind": flag(FlagType.Bool),
		
		"BathroomBulliesSceneWillHappen": flag(FlagType.Bool),
		"BathroomBulliesSceneHappened": flag(FlagType.Bool),
		"BathroomBulliesWon": flag(FlagType.Bool),
		"BathroomBulliesLost": flag(FlagType.Bool),
		"BathroomBulliesSubmitted": flag(FlagType.Bool),
		"BathroomBulliesPayed": flag(FlagType.Bool),
		"BathroomBulliesBecameCumToilet": flag(FlagType.Bool),
		"BathroomBulliesBecamePissToilet": flag(FlagType.Bool),
		
		"Jacki_ContentDisabled": flag(FlagType.Bool),
		"Jacki_PCKnowsName": flag(FlagType.Bool),
		
		"Jacki_StocksSceneHappened": flag(FlagType.Bool),
		"Jacki_StocksPunishedByPC": flag(FlagType.Bool),
		"Jacki_StocksFuckedByPC": flag(FlagType.Bool),
		"Jacki_StocksFingeredByPC": flag(FlagType.Bool),
		"Jacki_StocksPCLied": flag(FlagType.Bool),
		"Jacki_StocksSavedByPC": flag(FlagType.Bool),
		"Jacki_StocksPCWonFight": flag(FlagType.Bool),
		"Jacki_StocksPCLostFight": flag(FlagType.Bool),
		"Jacki_StocksPCLostFightAndWatched": flag(FlagType.Bool),
	}

func _init():
	id = "JackiModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/JackiModule/Ch1/JackiFirstEncounterScene.gd",
		"res://Modules/JackiModule/Ch1/JackiBulliesInBathroomScene.gd",
		"res://Modules/JackiModule/Ch1/JackiStuckInStocksScene.gd",
		]
	characters = [
		"res://Modules/JackiModule/JackiCharacter.gd",
	]
	items = []
	events = [
		"res://Modules/JackiModule/Ch1/JackiFirstEncounterEvent.gd",
		"res://Modules/JackiModule/Ch1/JackiBulliesInBathroomEvent.gd",
		"res://Modules/JackiModule/Ch1/JackiStuckInStocksEvent.gd",
	]
	quests = [
	]

func resetFlagsOnNewDay():
	if(getFlag("JackiModule.BathroomBulliesSceneWillHappen")):
		setFlag("JackiModule.BathroomBulliesSceneWillHappen", false)
