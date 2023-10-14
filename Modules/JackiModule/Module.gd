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
		
		"jackiCorruption": flag(FlagType.Number),
		"jackiAnger": flag(FlagType.Number),
		"jackiLust": flag(FlagType.Number),
		
		"jackiSkillButtslut": flag(FlagType.Number),
		"jackiSkillSounding": flag(FlagType.Number),
		"jackiSkillWhore": flag(FlagType.Number),
		"jackiSkillWatersports": flag(FlagType.Number),
		
		"jackiReceivedBra": flag(FlagType.Bool),
		"jackiReceivedShorts": flag(FlagType.Bool),
		"jackiReceivedHorsecockDildo": flag(FlagType.Bool),
	}

func _init():
	id = "JackiModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/JackiModule/Ch1/JackiFirstEncounterScene.gd",
		"res://Modules/JackiModule/Ch1/JackiBulliesInBathroomScene.gd",
		"res://Modules/JackiModule/Ch1/JackiStuckInStocksScene.gd",
		
		"res://Modules/JackiModule/Ch2/jackiCh2s1Intro.gd",
		"res://Modules/JackiModule/Ch2/jackiCh2s2GymScene.gd",
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


func addCorruption(howMuch, showMessage = true):
	howMuch /= 100.0
	var currentCorruption = getFlag("JackiModule.jackiCorruption", 0.0)
	var oldCor = currentCorruption
	
	currentCorruption += howMuch
	if(howMuch > 0.0 && currentCorruption > 1.0):
		currentCorruption = 1.0
		
		addAnger(-howMuch/2.0, showMessage)
	if(howMuch < 0.0 && currentCorruption < 0.0):
		currentCorruption = 0.0
	
	setFlag("JackiModule.jackiCorruption", currentCorruption)
	
	if(showMessage):
		var diff = currentCorruption - oldCor
		if(diff > 0.0):
			GM.main.addMessage("Jacki's corruption has increased to "+str(Util.roundF(currentCorruption * 100.0, 1))+"%")
		elif(diff < 0.0):
			GM.main.addMessage("Jacki's corruption has decreased to "+str(Util.roundF(currentCorruption * 100.0, 1))+"%")

func addAnger(howMuch, showMessage = true):
	howMuch /= 100.0
	var currentCorruption = getFlag("JackiModule.jackiAnger", 0.0)
	var currentActualCorruption = clamp(getFlag("JackiModule.jackiCorruption", 0.0), 0.0, 1.0)
	var oldCor = currentCorruption
	
	if(howMuch > 0):
		howMuch *= (1.0 - currentActualCorruption)
	
	currentCorruption += howMuch
	if(howMuch > 0.0 && currentCorruption > 1.0):
		currentCorruption = 1.0
	if(howMuch < 0.0 && currentCorruption < -1.0):
		currentCorruption = -1.0
	
	setFlag("JackiModule.jackiAnger", currentCorruption)
	
	if(showMessage):
		var diff = currentCorruption - oldCor
		
		if(currentCorruption > 0.0):
			if(diff > 0.0):
				GM.main.addMessage("Jacki's anger has increased to "+str(Util.roundF(currentCorruption * 100.0, 1))+"%")
			elif(diff < 0.0):
				GM.main.addMessage("Jacki's anger has decreased to "+str(Util.roundF(currentCorruption * 100.0, 1))+"%")
		else:
			if(diff < 0.0):
				GM.main.addMessage("Jacki's kindness has increased to "+str(Util.roundF(-currentCorruption * 100.0, 1))+"%")
			elif(diff > 0.0):
				GM.main.addMessage("Jacki's kindness has decreased to "+str(Util.roundF(-currentCorruption * 100.0, 1))+"%")

func shouldWearSportsBra():
	return getFlag("JackiModule.jackiReceivedBra", false)

func shouldWearSportsShorts():
	return getFlag("JackiModule.jackiReceivedShorts", false)

func shouldUnderwear():
	return shouldWearSportsBra() && shouldWearSportsShorts()
