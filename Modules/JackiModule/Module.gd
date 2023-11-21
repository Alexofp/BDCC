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
		
		"Jacki_ch2IntroSceneHappened": flag(FlagType.Bool),
		"Jacki_ch2GotEnslaved": flag(FlagType.Bool),
		"Jacki_ch2SlaveText": flag(FlagType.Text),
		"Jacki_ch2GotPussyFreed": flag(FlagType.Bool),
		"Jacki_ch2GotExtraPiercings": flag(FlagType.Bool),
		"Jacki_punchingBagSceneHappened": flag(FlagType.Bool),
		"Jacki_urinalSceneHappened": flag(FlagType.Bool),
		
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
		"jackiGotFollowed": flag(FlagType.Bool),
		"jackiFirstTimeBlocked": flag(FlagType.Bool),
		"jackiBusyUntil": flag(FlagType.Number),
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
		"res://Modules/JackiModule/Ch2/jackiPunchingBagScene.gd",
		"res://Modules/JackiModule/Ch2/jackiUrinalScene.gd",
		]
	characters = [
		"res://Modules/JackiModule/JackiCharacter.gd",
	]
	items = []
	events = [
		"res://Modules/JackiModule/Ch1/JackiFirstEncounterEvent.gd",
		"res://Modules/JackiModule/Ch1/JackiBulliesInBathroomEvent.gd",
		"res://Modules/JackiModule/Ch1/JackiStuckInStocksEvent.gd",
		"res://Modules/JackiModule/Ch2/JackiGymTalkEvent.gd",
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
		
		addAnger(-howMuch*2.0*100.0, showMessage)
	if(howMuch < 0.0 && currentCorruption < 0.0):
		currentCorruption = 0.0
	
	setFlag("JackiModule.jackiCorruption", currentCorruption)
	
	if(showMessage):
		var diff = currentCorruption - oldCor
		if(diff > 0.0):
			GM.main.addMessage("Jacki's corruption has increased to "+str(Util.roundF(currentCorruption * 100.0, 1))+"%")
		elif(diff < 0.0):
			GM.main.addMessage("Jacki's corruption has decreased to "+str(Util.roundF(currentCorruption * 100.0, 1))+"%")

func addLust(howMuch, showMessage = true):
	howMuch /= 100.0
	var currentCorruption = getFlag("JackiModule.jackiLust", 0.0)
	var oldCor = currentCorruption
	
	currentCorruption += howMuch
	if(howMuch > 0.0 && currentCorruption > 1.0):
		currentCorruption = 1.0
		
		addCorruption(howMuch/2.0*100.0, showMessage)
	if(howMuch < 0.0 && currentCorruption < 0.0):
		currentCorruption = 0.0
	
	setFlag("JackiModule.jackiLust", currentCorruption)
	
	if(showMessage):
		var diff = currentCorruption - oldCor
		if(diff > 0.0):
			GM.main.addMessage("Jacki's lust has increased to "+str(Util.roundF(currentCorruption * 100.0, 1))+"%")
		elif(diff < 0.0):
			GM.main.addMessage("Jacki's lust has decreased to "+str(Util.roundF(currentCorruption * 100.0, 1))+"%")


func addAnger(howMuch, showMessage = true):
	howMuch /= 100.0
	var currentCorruption = getFlag("JackiModule.jackiAnger", 0.0)
	if(currentCorruption < -0.1 && howMuch > 0.0):
		howMuch *= 2.0
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

func doBetray():
	var currentKind = -getFlag("JackiModule.jackiAnger", 0.0)
	
	if(currentKind > 0.0):
		addCorruption(currentKind * 60)
		addAnger(500)
		
		return true
	return false

func getSkillScore(skillID):
	return Util.mini(Util.maxi(int(getFlag("JackiModule."+str(skillID), 0)), 0), 7)

func advanceSkill(skillID, maxLevel = 7):
	if(getFlag("JackiModule."+str(skillID), 0) < maxLevel):
		increaseFlag("JackiModule."+str(skillID), 1)
	return true

func degradeSkill(skillID, howMuchRemove = 1):
	var currentSkill = getFlag("JackiModule."+str(skillID), 0)
	currentSkill -= howMuchRemove
	if(currentSkill < 0):
		currentSkill = 0
	setFlag("JackiModule."+str(skillID), currentSkill)

func getButtTightness():
	var buttscore = getSkillScore("jackiSkillButtslut")
	if(buttscore <= 0):
		return "virgin-tight"
	if(buttscore <= 1):
		return "extremely tight"
	if(buttscore <= 2):
		return "pretty tight"
	if(buttscore <= 3):
		return "somewhat tight"
	if(buttscore <= 4):
		return "slightly used"
	if(buttscore <= 5):
		return "very stretchy and used"
	if(buttscore <= 6):
		return "fully stretchy"
	return "extremely stretchy"

func makeJackiBusy(howManyDays = 1):
	setFlag("JackiModule.jackiBusyUntil", GM.main.getDays() + howManyDays)

func getAngerText():
	var currentAnger = getFlag("JackiModule.jackiAnger", 0.0)
	
	if(currentAnger < 0.1 && currentAnger >= -0.1):
		return "indifferent towards you"
	elif(currentAnger > 0.0):
		if(currentAnger < 0.15):
			return "annoyed slightly"
		if(currentAnger < 0.25):
			return "is annoyed with you"
		if(currentAnger < 0.35):
			return "very annoyed"
		if(currentAnger < 0.45):
			return "is mad at you"
		if(currentAnger < 0.55):
			return "is really mad at you"
		if(currentAnger < 0.65):
			return "despises you"
		if(currentAnger < 0.75):
			return "doesn't like anything about you"
		if(currentAnger < 0.85):
			return "would rather live on another planet away from you"
		if(currentAnger < 0.95):
			return "pretty much hates you"
		return "hates you"
	else:
		if(currentAnger > -0.15):
			return "doesn't mind you"
		if(currentAnger > -0.25):
			return "kinda likes you"
		if(currentAnger > -0.35):
			return "likes you"
		if(currentAnger > -0.45):
			return "likes you very much"
		if(currentAnger > -0.55):
			return "enjoys your presence"
		if(currentAnger > -0.65):
			return "thinks you're very nice"
		if(currentAnger > -0.75):
			return "adores you"
		if(currentAnger > -0.85):
			return "values your friendship"
		if(currentAnger > -0.95):
			return "values you"
		return "likes you"
			
func getLustText():
	var currentLust = getFlag("JackiModule.jackiLust", 0.0)
	
	if(currentLust <= 0.01):
		return "no lust towards anything"
	if(currentLust <= 0.1):
		return "barely intrigued"
	if(currentLust <= 0.2):
		return "slight curiosity"
	if(currentLust <= 0.3):
		return "emerging interest towards lewd"
	if(currentLust <= 0.4):
		return "growing attraction towards sex"
	if(currentLust <= 0.5):
		return "fascination with sex"
	if(currentLust <= 0.6):
		return "strong desire to be fucked"
	if(currentLust <= 0.7):
		return "intense longing"
	if(currentLust <= 0.8):
		return "overpowering lust"
	if(currentLust <= 0.9):
		return "consuming passion"
	return "total infatuation"

func getCorruptionText():
	var currentLust = getFlag("JackiModule.jackiCorruption", 0.0)
	
	if(currentLust <= 0.01):
		return "pure"
	if(currentLust <= 0.1):
		return "virtually pure"
	if(currentLust <= 0.2):
		return "losing innocence"
	if(currentLust <= 0.3):
		return "inner fight"
	if(currentLust <= 0.4):
		return "mild degradation"
	if(currentLust <= 0.5):
		return "loves it rough"
	if(currentLust <= 0.6):
		return "heavy degradation of morals"
	if(currentLust <= 0.7):
		return "pretty much a slut"
	if(currentLust <= 0.8):
		return "curious slut"
	if(currentLust <= 0.9):
		return "eager slut"
	return "total slut"
