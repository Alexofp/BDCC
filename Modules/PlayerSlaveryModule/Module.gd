extends Module

func getFlags():
	return {
		#"slavesSpace": flag(FlagType.Number),
		"mirriTimes": flag(FlagType.Number),
		"luxeTimes": flag(FlagType.Number),
	}

func _init():
	id = "PlayerSlaveryModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/PlayerSlaveryModule/ShaftMiner/PSShaftMinerStart.gd",
		"res://Modules/PlayerSlaveryModule/ShaftMiner/PSShaftMinerGameplayScene.gd",
		"res://Modules/PlayerSlaveryModule/ShaftMiner/PSShaftMinerEnding1.gd",
		"res://Modules/PlayerSlaveryModule/ShaftMiner/PSShaftMinerEnding2.gd",
		
		"res://Modules/PlayerSlaveryModule/MilkCafe/PSMilkCafeGameplayScene.gd",
		
		"res://Modules/PlayerSlaveryModule/SlaveAuction/PlayerSlaveryStartMirriScene.gd",
		"res://Modules/PlayerSlaveryModule/SlaveAuction/PlayerSlaveryStartLuxeScene.gd",
		"res://Modules/PlayerSlaveryModule/SlaveAuction/PlayerSlaveryAuctionScene.gd",
		"res://Modules/PlayerSlaveryModule/SlaveAuction/PlayerSlaveryPickScene.gd",
		"res://Modules/PlayerSlaveryModule/Other/PlayerSlaveryStartMemeScene.gd",
		]
	characters = [
		"res://Modules/PlayerSlaveryModule/ShaftMiner/PSRicky.gd",
		"res://Modules/PlayerSlaveryModule/SlaveAuction/PlayerSlaveryStash.gd",
		"res://Modules/PlayerSlaveryModule/MilkCafe/PSPip.gd",
		"res://Modules/PlayerSlaveryModule/MilkCafe/PSMilka.gd",
		"res://Modules/PlayerSlaveryModule/MilkCafe/PSMilkGirl.gd",
		"res://Modules/PlayerSlaveryModule/MilkCafe/PSMilkGuy.gd",
		"res://Modules/PlayerSlaveryModule/MilkCafe/PSMilkOfficer.gd",
	]
	items = []
	events = [
		"res://Modules/PlayerSlaveryModule/Other/PlayerSlaveryStartMemeEvent.gd",
	]

func resetFlagsOnNewDay():
	pass

func getSlaveryStartScene():
	if(getFlag("SlaveAuctionModule.r6outcome", "") in ["mirrislave", "mirrigone"]):
		return "PlayerSlaveryStartLuxeScene"
	return "PlayerSlaveryStartMirriScene"
