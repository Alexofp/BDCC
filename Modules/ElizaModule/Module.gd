extends Module

func getFlags():
	return {
		#"Nova_GotHumiliatedByPC": flag(FlagType.Bool),
	}

func _init():
	id = "ElizaModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/ElizaModule/Chapter0/Eliza0AskJobScene.gd",
		]
	characters = [
	]
	items = []
	events = [
	]

func resetFlagsOnNewDay():
	pass
