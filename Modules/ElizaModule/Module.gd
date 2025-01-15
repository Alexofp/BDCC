extends Module

func getFlags():
	return {
		#"Nova_GotHumiliatedByPC": flag(FlagType.Bool),
	}

func _init():
	id = "ElizaModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/ElizaModule/Chapter0/Eliza0AskJobScene.gd",
		"res://Modules/ElizaModule/Chapter0/Eliza1DrugIntroScene.gd",
		"res://Modules/ElizaModule/Chapter0/Eliza2FirstDrugScene.gd",
		
		"res://Modules/ElizaModule/Science/NurseryBountyBoardScene.gd",
		
		"res://Modules/ElizaModule/DrugTesting/ElizaDrugTestDemoniXScene.gd",
		]
	characters = [
	]
	items = []
	events = [
		"res://Modules/ElizaModule/Science/NurseryBountyBoardEvent.gd",
	]

func resetFlagsOnNewDay():
	pass
