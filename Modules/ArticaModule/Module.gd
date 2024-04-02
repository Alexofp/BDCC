extends Module

func getFlags():
	return {
		"socketIntroduced": flag(FlagType.Bool),

	}

func _init():
	id = "ArticaModule"
	author = "Rahi"
	
	scenes = [
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
