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
		"res://Modules/PlayerSlaveryModule/ShaftMiner/PSShaftMinerGameplayScene.gd",
		
		"res://Modules/PlayerSlaveryModule/SlaveAuction/PlayerSlaveryStartMirriScene.gd",
		"res://Modules/PlayerSlaveryModule/SlaveAuction/PlayerSlaveryAuctionScene.gd",
		"res://Modules/PlayerSlaveryModule/SlaveAuction/PlayerSlaveryPickScene.gd",
		]
	characters = [
		"res://Modules/PlayerSlaveryModule/ShaftMiner/PSRicky.gd",
	]
	items = []
	events = [
	]

func resetFlagsOnNewDay():
	pass
