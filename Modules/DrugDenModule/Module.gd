extends Module

func getFlags():
	return {
		"HighestDrugDenLevel": flag(FlagType.Number),
		"RaidedLabs": flag(FlagType.Number),
		"FirstTimeHappened": flag(FlagType.Bool),
		
		"Kidlat1Hap": flag(FlagType.Bool),
		"Kidlat2Hap": flag(FlagType.Bool),
		"Kidlat3Hap": flag(FlagType.Bool),
		"Kidlat4Hap": flag(FlagType.Bool),
		"Kidlat5Hap": flag(FlagType.Bool),
		"Kidlat6Hap": flag(FlagType.Bool),
		"Kidlat7Hap": flag(FlagType.Bool),
		"Kidlat8Hap": flag(FlagType.Bool),
		
		"KidlatCustomShopGreet": flag(FlagType.Text),
		"KidlatCustomTalkGreet": flag(FlagType.Text),
		
		"KidlatShopFirstTimeRun": flag(FlagType.Bool),
		"KidlatShopFirstTimeFloor": flag(FlagType.Bool),
		"KidlatBap": flag(FlagType.Bool),
		"KidlatItemsBought": flag(FlagType.Number),
		"KidlatLockedUpRandomly": flag(FlagType.Bool),
		"KidlatDrunkHappened": flag(FlagType.Bool),
		"KidlatWearsPortalPanties": flag(FlagType.Bool),
		"KidlatPPTF": flag(FlagType.Bool),
		
		"Kidlat6Knows": flag(FlagType.Bool),
		"Kidlat7Knows": flag(FlagType.Bool),
	}

func _init():
	id = "DrugDenModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/DrugDenModule/DrugDen/DrugDenGiveUpScene.gd",
		"res://Modules/DrugDenModule/DrugDen/DrugDenEncounterInstantFightScene.gd",
		"res://Modules/DrugDenModule/DrugDen/DrugDenEncounterBossScene.gd",
		"res://Modules/DrugDenModule/DrugDen/DrugDenEncounterFirstScene.gd",
		"res://Modules/DrugDenModule/DrugDen/DrugDenStartScene.gd",
		"res://Modules/DrugDenModule/DrugDen/DrugDenEventWhoreScene.gd",
		"res://Modules/DrugDenModule/DrugDen/DrugDenEventWhoreSubScene.gd",
		"res://Modules/DrugDenModule/DrugDen/DrugDenEncounterInstantLossScene.gd",
		
		"res://Modules/DrugDenModule/Kidlat/DrugDenKidlat1Scene.gd",
		"res://Modules/DrugDenModule/Kidlat/DrugDenKidlat2Scene.gd",
		"res://Modules/DrugDenModule/Kidlat/DrugDenKidlat3Scene.gd",
		"res://Modules/DrugDenModule/Kidlat/DrugDenKidlat4Scene.gd",
		"res://Modules/DrugDenModule/Kidlat/DrugDenKidlat5Scene.gd",
		"res://Modules/DrugDenModule/Kidlat/DrugDenKidlat6Scene.gd",
		"res://Modules/DrugDenModule/Kidlat/DrugDenKidlat7Scene.gd",
		"res://Modules/DrugDenModule/Kidlat/DrugDenKidlat8Scene.gd",
		
		"res://Modules/DrugDenModule/Kidlat/DrugDenKidlatShopScene.gd",
		"res://Modules/DrugDenModule/Kidlat/DrugDenKidlatBoundGropeScene.gd",
		"res://Modules/DrugDenModule/Kidlat/KidlatTalkScene.gd",
		]
	characters = [
		"res://Modules/DrugDenModule/DrugDen/DrugDenStash.gd",
		"res://Modules/DrugDenModule/Kidlat/Kidlat.gd",
		"res://Modules/DrugDenModule/Kidlat/JunkieBoozeSeller.gd",
	]
	items = []
	events = [
		"res://Modules/DrugDenModule/DrugDen/DrugDenStartEvent.gd",
		"res://Modules/DrugDenModule/DrugDen/DrugDenEvent.gd",
		"res://Modules/DrugDenModule/Kidlat/KidlatTalkEvent.gd",
	]
	quests = [
		"res://Modules/DrugDenModule/Kidlat/KidlatQuest.gd",
	]

func resetFlagsOnNewDay():
	pass

func getKidlatCustomGreeting():
	var theGreet = getFlag("DrugDenModule.KidlatCustomShopGreet", "")
	setFlag("DrugDenModule.KidlatCustomShopGreet", "")
	return theGreet
	
func getKidlatCustomTalkGreeting():
	var theGreet = getFlag("DrugDenModule.KidlatCustomTalkGreet", "")
	setFlag("DrugDenModule.KidlatCustomTalkGreet", "")
	return theGreet

func isKidlatNaked():
	if(isKidlatBound()):
		return true
	return getFlag("DrugDenModule.Kidlat2Hap", false) && !getFlag("DrugDenModule.Kidlat3Hap", false)

func regenerateKidlatItems():
	if(GM.main.DrugDenRun == null):
		return
	var drugDenEvent = GM.main.DrugDenRun.getEventInRoom(GM.pc.getLocation())
	if(drugDenEvent == null || drugDenEvent.id != "KidlatShop"):
		return
	drugDenEvent.generateItemsToSell()
	
func getKidlatAmountOfItemsBoughtTotal():
	return getFlag("DrugDenModule.KidlatItemsBought", 0)

func isKidlatBound():
	return (getFlag("DrugDenModule.Kidlat4Hap", false) && !getFlag("DrugDenModule.Kidlat5Hap", false)) || getFlag("DrugDenModule.KidlatLockedUpRandomly", false)

func kidlatShouldHaveCock():
	return getFlag("DrugDenModule.KidlatPPTF", false)
