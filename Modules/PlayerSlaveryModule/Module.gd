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
		"res://Modules/PlayerSlaveryModule/Start/PlayerSlaveryStartMemeScene.gd",
		
		"res://Modules/PlayerSlaveryModule/Start/NemesisAmbushScene.gd",
		]
	characters = [
		"res://Modules/PlayerSlaveryModule/ShaftMiner/PSRicky.gd",
		"res://Modules/PlayerSlaveryModule/SlaveAuction/PlayerSlaveryStash.gd",
		"res://Modules/PlayerSlaveryModule/MilkCafe/PSPip.gd",
		"res://Modules/PlayerSlaveryModule/MilkCafe/PSMilka.gd",
		"res://Modules/PlayerSlaveryModule/MilkCafe/PSMilkGirl.gd",
		"res://Modules/PlayerSlaveryModule/MilkCafe/PSMilkGuy.gd",
		"res://Modules/PlayerSlaveryModule/MilkCafe/PSMilkOfficer.gd",
		"res://Modules/PlayerSlaveryModule/Start/TempAmbushStash.gd",
	]
	items = []
	events = [
		"res://Modules/PlayerSlaveryModule/Start/PlayerSlaveryStartMemeEvent.gd",
		"res://Modules/PlayerSlaveryModule/Start/UnconStartSlaveryEvent.gd",
		"res://Modules/PlayerSlaveryModule/Start/NemesisAmbushEvent.gd",
	]

func resetFlagsOnNewDay():
	pass

func getSlaveryStartScene():
	if(getFlag("SlaveAuctionModule.r6outcome", "") in ["mirrislave", "mirrigone"]):
		return "PlayerSlaveryStartLuxeScene"
	return "PlayerSlaveryStartMirriScene"
