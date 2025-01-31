extends Module

func getFlags():
	return {
		#"firstDrugTestHappened": flag(FlagType.Bool),
	}

func _init():
	id = "DrugDenModule"
	author = "Rahi"
	
	scenes = [
		]
	characters = [
	]
	items = []
	events = [
		"res://Modules/DrugDenModule/DrugDen/DrugDenStartEvent.gd",
		"res://Modules/DrugDenModule/DrugDen/DrugDenEvent.gd",
	]

func resetFlagsOnNewDay():
	pass
