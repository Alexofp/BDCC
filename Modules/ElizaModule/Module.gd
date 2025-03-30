extends Module

func getFlags():
	return {
		"s0hap": flag(FlagType.Bool),
		"s1hap": flag(FlagType.Bool),
		"s2hap": flag(FlagType.Bool),
		"s3hap": flag(FlagType.Bool),
		"s4hap": flag(FlagType.Bool),
		"s5hap": flag(FlagType.Bool),
		"s6hap": flag(FlagType.Bool),
		"s6DateHap": flag(FlagType.Bool),
		"s7hap": flag(FlagType.Bool),
		
		"firstDrugTestHappened": flag(FlagType.Bool),
		"firstHelpTFHap": flag(FlagType.Bool),
		
		"dateOutcome": flag(FlagType.Text), # perfect failed refused
		
		"storyCompleted": flag(FlagType.Bool),
	}

func _init():
	id = "ElizaModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/ElizaModule/Chapter0/Eliza0AskJobScene.gd",
		"res://Modules/ElizaModule/Chapter0/Eliza1DrugIntroScene.gd",
		"res://Modules/ElizaModule/Chapter0/Eliza2FirstDrugScene.gd",
		
		"res://Modules/ElizaModule/Chapter1/Eliza3DrugDenIntroScene.gd",
		"res://Modules/ElizaModule/Chapter1/Eliza4MomScene.gd",
		"res://Modules/ElizaModule/Chapter1/Eliza5UnlockMilkingScene.gd",
		"res://Modules/ElizaModule/Chapter1/Eliza6DateOfferScene.gd",
		"res://Modules/ElizaModule/Chapter1/Eliza6DateScene.gd",
		"res://Modules/ElizaModule/Chapter1/Eliza7EndingScene.gd",
		
		"res://Modules/ElizaModule/Science/NurseryBountyBoardScene.gd",
		"res://Modules/ElizaModule/Science/ChemistryLabScene.gd",
		"res://Modules/ElizaModule/Science/ElizaGenericUnlockDrugScene.gd",
		"res://Modules/ElizaModule/Science/ElizaGenericTestDrugScene.gd",
		"res://Modules/ElizaModule/Science/ElizaGenericNPCTestDrugScene.gd",
		"res://Modules/ElizaModule/Science/ElizaHelpGotTransformedScene.gd",
		
		"res://Modules/ElizaModule/Eliza/ElizaSexMenuScene.gd",
		
		"res://Modules/ElizaModule/DrugTesting/ElizaDrugTestDemoniXScene.gd",
		]
	characters = [
		"res://Modules/ElizaModule/DrugTesting/ElizaDemon.gd",
		"res://Modules/ElizaModule/Chapter1/ElizaMom.gd",
	]
	items = []
	events = [
		"res://Modules/ElizaModule/Science/NurseryBountyBoardEvent.gd",
		"res://Modules/ElizaModule/Science/EnterMedicalEvent.gd",
		"res://Modules/ElizaModule/Science/ChemistryLabEvent.gd",
		"res://Modules/ElizaModule/Science/ElizaBringNpcToBeTestedEvent.gd",
		"res://Modules/ElizaModule/Chapter0/ElizaQuestEvent.gd",
		"res://Modules/ElizaModule/Chapter0/ElizaQuestReactEvent.gd",
	]
	quests = [
		"res://Modules/ElizaModule/Chapter0/ElizaQuest.gd",
	]

func resetFlagsOnNewDay():
	pass

func hasLabAccess() -> bool:
	return getFlag("ElizaModule.s2hap", false)

func canSendSlavesToBeMilked() -> bool:
	return getFlag("ElizaModule.s5hap", false)

func canStartDrugDenRun() -> bool:
	return getFlag("ElizaModule.s3hap", false)
