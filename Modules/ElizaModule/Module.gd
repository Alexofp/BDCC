extends Module

func getFlags():
	return {
		"firstDrugTestHappened": flag(FlagType.Bool),
	}

func _init():
	id = "ElizaModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/ElizaModule/Chapter0/Eliza0AskJobScene.gd",
		"res://Modules/ElizaModule/Chapter0/Eliza1DrugIntroScene.gd",
		"res://Modules/ElizaModule/Chapter0/Eliza2FirstDrugScene.gd",
		
		"res://Modules/ElizaModule/Science/NurseryBountyBoardScene.gd",
		"res://Modules/ElizaModule/Science/ChemistryLabScene.gd",
		"res://Modules/ElizaModule/Science/ElizaGenericUnlockDrugScene.gd",
		"res://Modules/ElizaModule/Science/ElizaGenericTestDrugScene.gd",
		
		"res://Modules/ElizaModule/DrugTesting/ElizaDrugTestDemoniXScene.gd",
		]
	characters = [
	]
	items = []
	events = [
		"res://Modules/ElizaModule/Science/NurseryBountyBoardEvent.gd",
		"res://Modules/ElizaModule/Science/EnterMedicalEvent.gd",
		"res://Modules/ElizaModule/Science/ChemistryLabEvent.gd",
	]

func resetFlagsOnNewDay():
	pass
