extends Module

func getFlags():
	return {
		"s4Outcome": flag(FlagType.Text), #left offerself won lost
		"s5GaveMassage": flag(FlagType.Bool),
		"s6FirstTime": flag(FlagType.Bool),
		"s6AskedLeg": flag(FlagType.Bool),
		"s6AskedRisha": flag(FlagType.Bool),
		"s6AskedPaws": flag(FlagType.Bool),
		"s6AskedMood": flag(FlagType.Bool),
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
		]
	characters = [
		"res://Modules/ArticaModule/ArticaCharacter.gd",
	]
	items = []
	events = [
	]
	species = [
		"res://Modules/ArticaModule/IceJogauniSpecies.gd",
	]

func resetFlagsOnNewDay():
	pass
