extends Module

func getFlags():
	return {
		"shyness": flag(FlagType.Number),
		"pawslut": flag(FlagType.Number),
		"corruption": flag(FlagType.Number),
		"chastity": flag(FlagType.Number),
		
		"busyUntilDay": flag(FlagType.Number),
		
		"s0happened": flag(FlagType.Bool),
		"s1happened": flag(FlagType.Bool),
		"s1day": flag(FlagType.Number),
		"s2happened": flag(FlagType.Bool),
		"s3happened": flag(FlagType.Bool),
		"s3day": flag(FlagType.Number),
		"s4happened": flag(FlagType.Bool),
		"s5happened": flag(FlagType.Bool),
		"s5day": flag(FlagType.Number),

		
		"s4Outcome": flag(FlagType.Text), #left offerself won lost
		"s5GaveMassage": flag(FlagType.Bool),
		"s6FirstTime": flag(FlagType.Bool),
		"s6AskedLeg": flag(FlagType.Bool),
		"s6AskedRisha": flag(FlagType.Bool),
		"s6AskedPaws": flag(FlagType.Bool),
		"s6AskedMood": flag(FlagType.Bool),
		"s6HeardStory": flag(FlagType.Bool),
		"s6GrabbedThroat": flag(FlagType.Bool),
		"s6HadRoughSex": flag(FlagType.Bool),
		"s6HadRoughSexCameInside": flag(FlagType.Bool),
		"s6ateday": flag(FlagType.Number),
		
		"corruptionBegan": flag(FlagType.Bool),
		"NoClothes": flag(FlagType.Bool),
		"isLusty": flag(FlagType.Bool),
		"firstTimeWait": flag(FlagType.Bool),
		
		"gotChastityDenied": flag(FlagType.Bool),
		"cagedDay": flag(FlagType.Number),
		"cagedTotalDays": flag(FlagType.Number),
		"cagedAcceptStage": flag(FlagType.Number),
		
		"TentaclesPcHasFlower": flag(FlagType.Bool),
		"TentaclesArticaHasFlower": flag(FlagType.Bool),
		
		"nextReaction": flag(FlagType.Text), #
	}

func _init():
	id = "ArticaModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/ArticaModule/c0Shy/articaS0IntakeScene.gd",
		"res://Modules/ArticaModule/c0Shy/articaS1CellblockScene.gd",
		"res://Modules/ArticaModule/c0Shy/articaS2HungryScene.gd",
		"res://Modules/ArticaModule/c0Shy/articaS3CanteenScene.gd",
		"res://Modules/ArticaModule/c0Shy/articaS4CanteenScene.gd",
		"res://Modules/ArticaModule/c0Shy/articaS5CanteenPawsScene.gd",
		"res://Modules/ArticaModule/c0Shy/articaS6CanteenTalkScene.gd",
		"res://Modules/ArticaModule/c0Shy/articaS7FirstShowerScene.gd",
		
		"res://Modules/ArticaModule/c1Corruption/articaTalkScene.gd",
		
		"res://Modules/ArticaModule/c1Corruption/Tease/articaCanteenTeaseScene.gd",
		"res://Modules/ArticaModule/c1Corruption/Tease/articaCellTeaseScene.gd",
		"res://Modules/ArticaModule/c1Corruption/Tease/articaSlaveGangbangScene.gd",
		"res://Modules/ArticaModule/c1Corruption/Tease/articaMilkingInCellScene.gd",
		
		"res://Modules/ArticaModule/c1Corruption/Sex/articaSexRideScene.gd",
		"res://Modules/ArticaModule/c1Corruption/Sex/articaSexBreedScene.gd",
		"res://Modules/ArticaModule/c1Corruption/Sex/articaSexPawjobScene.gd",
		"res://Modules/ArticaModule/c1Corruption/Sex/articaSexRopesScene.gd",
		"res://Modules/ArticaModule/c1Corruption/Sex/articaSexMutualPawjobScene.gd",
		"res://Modules/ArticaModule/c1Corruption/Sex/articaSexHypnovisorScene.gd",
		
		"res://Modules/ArticaModule/c1Corruption/Other/articaShowerScene.gd",
		
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventTentacles1Scene.gd",
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventTentacles1dot5Scene.gd",
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventTentacles2Scene.gd",
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventTentacles3Scene.gd",
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventTentacles4Scene.gd",
		
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventSelfsuck1Scene.gd",
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventSelfsuck2Scene.gd",
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventSelfsuck3Scene.gd",
		
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventDildo1Scene.gd",
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventDildo2Scene.gd",
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventDildo3Scene.gd",
		
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventPortalPanties1Scene.gd",
		]
	characters = [
		"res://Modules/ArticaModule/ArticaCharacter.gd",
	]
	items = []
	events = [
		"res://Modules/ArticaModule/c1Corruption/ArticaTalkEvent.gd",
		"res://Modules/ArticaModule/c0Shy/ArticaIntroEvent.gd",
		"res://Modules/ArticaModule/c0Shy/ArticaShyTalkEvent.gd",
	]
	species = [
		"res://Modules/ArticaModule/IceJogauniSpecies.gd",
	]
	worldEdits = [
		"res://Modules/ArticaModule/c1Corruption/ArticaWorldEdit.gd",
	]

func startCaged():
	setFlag("ArticaModule.cagedDay", GM.main.getDays())

func endCaged():
	var cagedDay = getFlag("ArticaModule.cagedDay", -1)
	if(cagedDay > 0):
		var daysCaged = GM.main.getDays() - cagedDay
		increaseFlag("ArticaModule.cagedTotalDays", daysCaged)
	setFlag("ArticaModule.cagedDay", -1)

func getCagedDaysCurrently():
	var cagedDay = getFlag("ArticaModule.cagedDay", -1)
	if(cagedDay > 0):
		var daysCaged = GM.main.getDays() - cagedDay
		return daysCaged
	return 0

func getCagedDays():
	var recordedDaysCaged = getFlag("ArticaModule.cagedTotalDays", 0)
	var cagedDay = getFlag("ArticaModule.cagedDay", -1)
	if(cagedDay > 0):
		var daysCaged = GM.main.getDays() - cagedDay
		recordedDaysCaged += daysCaged
	return recordedDaysCaged

func resetFlagsOnNewDay():
	pass

func getShyness():
	return clamp(getFlag("ArticaModule.shyness", 1.0), 0.0, 1.0)

func removeShy(howMuch, showMessage = true):
	var oldShyness = getShyness()
	var newValue = clamp(oldShyness - howMuch, 0.0, 1.0)
	if(oldShyness != newValue && showMessage):
		if(newValue > oldShyness):
			GM.main.addMessage("Artica's shyness has increased to "+str(Util.roundF(newValue*100.0, 1))+"%!")
		else:
			GM.main.addMessage("Artica's shyness has decreased to "+str(Util.roundF(newValue*100.0, 1))+"%!")
	
	setFlag("ArticaModule.shyness", newValue)
	
func getPawSlut():
	return clamp(getFlag("ArticaModule.pawslut", 0.0), 0.0, 1.0)

func getPawslut():
	return getPawSlut()

func addPawslut(howMuch, showMessage = true):
	var oldPawslut = getPawSlut()
	var newValue = clamp(oldPawslut + howMuch, 0.0, 1.0)
	if(oldPawslut != newValue && showMessage):
		if(newValue > oldPawslut):
			GM.main.addMessage("Artica's interest in paws has increased to "+str(Util.roundF(newValue*100.0, 1))+"%!")
		else:
			GM.main.addMessage("Artica's interest in paws has decreased to "+str(Util.roundF(newValue*100.0, 1))+"%!")
	
	setFlag("ArticaModule.pawslut", newValue)

func getCorruption():
	return clamp(getFlag("ArticaModule.corruption", 0.0), 0.0, 1.0)

func addCorruption(howMuch, showMessage = true):
	var oldCorruption = getCorruption()
	var newValue = clamp(oldCorruption + howMuch, 0.0, 1.0)
	if(oldCorruption != newValue && showMessage):
		if(newValue > oldCorruption):
			GM.main.addMessage("Artica's corruption has increased to "+str(Util.roundF(newValue*100.0, 1))+"%!")
		elif(newValue < oldCorruption):
			GM.main.addMessage("Artica's corruption has decreased to "+str(Util.roundF(newValue*100.0, 1))+"%!")
	
	setFlag("ArticaModule.corruption", newValue)

func triggerCorruption(howMuch, showMessage = true):
	addCorruption(howMuch, showMessage)
	setFlag("ArticaModule.isLusty", false)

func isSlut():
	return getCorruption() >= 0.4

func isVerySlut():
	return getCorruption() >= 0.8

func getChastity():
	return clamp(getFlag("ArticaModule.chastity", 0.0), 0.0, 1.0)

func addChastity(howMuch, showMessage = true):
	var oldChastity = getChastity()
	var newValue = clamp(oldChastity + howMuch, 0.0, 1.0)
	if(oldChastity != newValue && showMessage):
		if(newValue > oldChastity):
			GM.main.addMessage("Artica's acceptance of chastity has increased to "+str(Util.roundF(newValue*100.0, 1))+"%!")
		else:
			GM.main.addMessage("Artica's acceptance of chastity has decreased to "+str(Util.roundF(newValue*100.0, 1))+"%!")
	
	setFlag("ArticaModule.chastity", newValue)

func getShynessString():
	var theShyness = getShyness()
	
	if theShyness >= 0.8:
		return "Extremely shy"
	elif 0.5 <= theShyness && theShyness < 0.8:
		return "Quite shy"
	elif 0.3 <= theShyness && theShyness < 0.5:
		return "Pretty shy"
	elif 0.1 <= theShyness && theShyness < 0.3:
		return "Slightly shy"
	else:
		return "Slightly confident"

func getPawslutString():
	var thePawSlut = getPawSlut()

	if thePawSlut >= 0.9:
		return "Artica is utterly obsessed with paws"
	elif 0.7 <= thePawSlut && thePawSlut < 0.9:
		return "Artica is highly enthusiastic paw lover"
	elif 0.5 <= thePawSlut && thePawSlut < 0.7:
		return "Artica enjoys paw play immensely"
	elif 0.3 <= thePawSlut && thePawSlut < 0.5:
		return "Artica is interested in paws"
	elif 0.1 <= thePawSlut && thePawSlut < 0.3:
		return "Artica has a moderate interest in paw play"
	elif 0.05 <= thePawSlut && thePawSlut < 0.1:
		return "Artica seems to be slightly intrigued by paws"
	else:
		return "Artica has no obvious interest in paws"

func isLusty():
	return getFlag("ArticaModule.isLusty", false)

func makeLusty():
	setFlag("ArticaModule.isLusty", true)

func canTriggerWaitScene():
	return false
