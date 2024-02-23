extends Module

func getFlags():
	return {
	}

func _init():
	id = "NpcSlaveryModule"
	author = "Rahi"
	
	scenes = [
			"res://Modules/NpcSlaveryModule/EnslaveDynamicNpcScene.gd",
		]
	characters = [
	]
	items = []
	events = [
		"res://Modules/NpcSlaveryModule/EnslaveDynamicNpcEvent.gd",
	]

func resetFlagsOnNewDay():
	pass
