extends Module

func getFlags():
	return {
		"slavesSpace": flag(FlagType.Number),
		
		"hasSybian": flag(FlagType.Bool),
		
	}

func _init():
	id = "NpcSlaveryModule"
	author = "Rahi"
	
	scenes = [
			"res://Modules/NpcSlaveryModule/EnslaveDynamicNpcScene.gd",
			"res://Modules/NpcSlaveryModule/SocketBuyCellUpgradesScene.gd",
		]
	characters = [
	]
	items = []
	events = [
		"res://Modules/NpcSlaveryModule/EnslaveDynamicNpcEvent.gd",
	]

func resetFlagsOnNewDay():
	pass

func getSlavesSpace() -> int:
	return int(getFlag("NpcSlaveryModule.slavesSpace", 0))

func canEnslave():
	return getSlavesSpace()

func getSlavesSpaceUpgradeCost():
	var currentSpace = getSlavesSpace()
	
	if(currentSpace == 0):
		return 30
	return currentSpace * 10
	
