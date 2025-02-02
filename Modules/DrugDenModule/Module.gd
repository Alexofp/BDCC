extends Module

func getFlags():
	return {
		#"firstDrugTestHappened": flag(FlagType.Bool),
	}

func _init():
	id = "DrugDenModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/DrugDenModule/DrugDen/DrugDenGiveUpScene.gd",
		"res://Modules/DrugDenModule/DrugDen/DrugDenEncounterInstantFightScene.gd",
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
