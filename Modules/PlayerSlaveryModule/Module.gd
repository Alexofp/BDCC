extends Module

func getFlags():
	return {
		#"slavesSpace": flag(FlagType.Number),
	}

func _init():
	id = "PlayerSlaveryModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/PlayerSlaveryModule/ShaftMiner/PSShaftMinerStart.gd",
		]
	characters = [
	]
	items = []
	events = [
	]

func resetFlagsOnNewDay():
	pass
