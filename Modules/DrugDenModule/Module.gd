extends Module

func getFlags():
	return {
		"HighestDrugDenLevel": flag(FlagType.Number),
		"RaidedLabs": flag(FlagType.Number),
		"FirstTimeHappened": flag(FlagType.Bool),
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
		]
	characters = [
		"res://Modules/DrugDenModule/DrugDen/DrugDenStash.gd",
	]
	items = []
	events = [
		"res://Modules/DrugDenModule/DrugDen/DrugDenStartEvent.gd",
		"res://Modules/DrugDenModule/DrugDen/DrugDenEvent.gd",
	]

func resetFlagsOnNewDay():
	pass
