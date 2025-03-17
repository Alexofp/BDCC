extends Module

func getFlags():
	return {
		"firstDrugTestHappened": flag(FlagType.Bool),
		"firstHelpTFHap": flag(FlagType.Bool),
	}

func _init():
	id = "ElizaModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/ElizaModule/Chapter0/Eliza0AskJobScene.gd",
		"res://Modules/ElizaModule/Chapter0/Eliza1DrugIntroScene.gd",
		"res://Modules/ElizaModule/Chapter0/Eliza2FirstDrugScene.gd",
		
		"res://Modules/ElizaModule/Chapter1/Eliza3GoodJobScene.gd",
		"res://Modules/ElizaModule/Chapter1/Eliza4MomScene.gd",
		"res://Modules/ElizaModule/Chapter1/Eliza5DrugDenScene.gd",
		"res://Modules/ElizaModule/Chapter1/Eliza6DateOfferScene.gd",
		"res://Modules/ElizaModule/Chapter1/Eliza6DateScene.gd",
		
		"res://Modules/ElizaModule/Science/NurseryBountyBoardScene.gd",
		"res://Modules/ElizaModule/Science/ChemistryLabScene.gd",
		"res://Modules/ElizaModule/Science/ElizaGenericUnlockDrugScene.gd",
		"res://Modules/ElizaModule/Science/ElizaGenericTestDrugScene.gd",
		"res://Modules/ElizaModule/Science/ElizaGenericNPCTestDrugScene.gd",
		"res://Modules/ElizaModule/Science/ElizaHelpGotTransformedScene.gd",
		
		"res://Modules/ElizaModule/DrugTesting/ElizaDrugTestDemoniXScene.gd",
		]
	characters = [
		"res://Modules/ElizaModule/DrugTesting/ElizaDemon.gd",
	]
	items = []
	events = [
		"res://Modules/ElizaModule/Science/NurseryBountyBoardEvent.gd",
		"res://Modules/ElizaModule/Science/EnterMedicalEvent.gd",
		"res://Modules/ElizaModule/Science/ChemistryLabEvent.gd",
		"res://Modules/ElizaModule/Science/ElizaBringNpcToBeTestedEvent.gd",
	]

func resetFlagsOnNewDay():
	pass

func hasLabAccess():
	return true

func canSendSlavesToBeMilked():
	return true

func canStartDrugDenRun():
	return true
