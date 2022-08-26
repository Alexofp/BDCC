extends Module
class_name MedicalModule

func getFlags():
	return {
		# Medical module
		"Eliza_IntroducedMedical": flag(FlagType.Bool),
		"Med_pcKnowsAboutWork": flag(FlagType.Bool),
		"Med_pcKnowsAboutBreeding": flag(FlagType.Bool),
		"Med_pcKnowsAboutTests": flag(FlagType.Bool),
		"Med_pcKnowsAboutMilking": flag(FlagType.Bool),
		"Med_milkingMilkFirstTime": flag(FlagType.Bool),
		"Med_milkingSeedFirstTime": flag(FlagType.Bool),

		"Med_milkMilked": flag(FlagType.Number),
		"Med_seedMilked": flag(FlagType.Number),
		"Med_milkedMilkTimes": flag(FlagType.Number),
		"Med_milkedSeedTimes": flag(FlagType.Number),
		
		"Med_wasMilkedToday": flag(FlagType.Bool),
		
		"Mental_PCBehavior": flag(FlagType.Number),
		"Mental_PCSanity": flag(FlagType.Number),
		"Mental_CheckupHappened": flag(FlagType.Bool),
		"Mental_ExperimentHappened": flag(FlagType.Bool),
		"Mental_ShowerHappened": flag(FlagType.Bool),
		
		"Mental_ExpObeyDrug": flag(FlagType.Number),
		"Mental_ExpTentacles": flag(FlagType.Number),
		
		"Mental_HasKeycard": flag(FlagType.Bool),
		"Mental_PlayerEscaped": flag(FlagType.Bool),
		
		"Nursery_Introduced": flag(FlagType.Bool),
		"Nursery_AskedHowWorks": flag(FlagType.Bool),
		"Nursery_AskedDatabase": flag(FlagType.Bool),
	}

func _init():
	id = "MedicalModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/MedicalModule/ElizaTalkScene.gd",
		"res://Modules/MedicalModule/ElizaInducingLactation.gd",
		"res://Modules/MedicalModule/ElizaHandMilking.gd",
		"res://Modules/MedicalModule/ElizaMilkingPumps.gd",
		"res://Modules/MedicalModule/ElizaHandSeedMilking.gd",
		"res://Modules/MedicalModule/ElizaProstateMilking.gd",
		"res://Modules/MedicalModule/ElizaGetIntoMentalWard.gd",
		"res://Modules/MedicalModule/ElizaCaughtEscapedPC.gd",
		
		"res://Modules/MedicalModule/MentalWard/MentalWardScene.gd",
		"res://Modules/MedicalModule/MentalWard/MentalCheckup1.gd",
		"res://Modules/MedicalModule/MentalWard/MentalCheckup2.gd",
		"res://Modules/MedicalModule/MentalWard/MentalCheckupNoJacket.gd",
		"res://Modules/MedicalModule/MentalWard/MentalObedienceDrug1.gd",
		"res://Modules/MedicalModule/MentalWard/MentalObedienceDrug2.gd",
		"res://Modules/MedicalModule/MentalWard/MentalLatexParasite.gd",
		"res://Modules/MedicalModule/MentalWard/MentalShower.gd",
		"res://Modules/MedicalModule/MentalWard/MentalKeycardEscape.gd",
		"res://Modules/MedicalModule/MentalWard/MentalCheckupFinal.gd",
		
		"res://Modules/MedicalModule/NurseFelineOffLimits.gd",
		
		"res://Modules/MedicalModule/Nursery/NurseryTalkScene.gd",
		]
	characters = [
		"res://Modules/MedicalModule/MentalWard/LatexParasite.gd",
		"res://Modules/MedicalModule/NurseFeline.gd",
	]
	items = []
	events = [
		"res://Modules/MedicalModule/ElizaTalkEvent.gd",
		"res://Modules/MedicalModule/CaughtOffLimitsInMentalEvent.gd",
		
		"res://Modules/MedicalModule/Nursery/NurseryTalkEvent.gd",
	]

func resetFlagsOnNewDay():
	GM.main.setModuleFlag("MedicalModule", "Med_wasMilkedToday", false)
	GM.main.setModuleFlag("MedicalModule", "Mental_CheckupHappened", false)
	GM.main.setModuleFlag("MedicalModule", "Mental_ExperimentHappened", false)
	GM.main.setModuleFlag("MedicalModule", "Mental_ShowerHappened", false)
	GM.main.setModuleFlag("MedicalModule", "Mental_PlayerEscaped", false)

static func resetFlagsOnGettingIntoMentalWard():
	GM.main.setModuleFlag("MedicalModule", "Mental_PCBehavior", 0.1)
	GM.main.setModuleFlag("MedicalModule", "Mental_PCSanity", 0.0)
	
	GM.main.setModuleFlag("MedicalModule", "Mental_ExpObeyDrug", 0)
	GM.main.setModuleFlag("MedicalModule", "Mental_ExpTentacles", 0)
	GM.main.setModuleFlag("MedicalModule", "Mental_HasKeycard", false)
	GM.main.setModuleFlag("MedicalModule", "Mental_PlayerEscaped", false)

static func addPCBehavior(value):
	GM.main.setModuleFlag("MedicalModule", "Mental_PCBehavior", GM.main.getModuleFlag("MedicalModule", "Mental_PCBehavior", 0.0) + value)
	if(GM.main.getModuleFlag("MedicalModule", "Mental_PCBehavior", 0.0) < 0.0):
		GM.main.setModuleFlag("MedicalModule", "Mental_PCBehavior", 0.0)
	if(GM.main.getModuleFlag("MedicalModule", "Mental_PCBehavior", 0.0) > 1.0):
		GM.main.setModuleFlag("MedicalModule", "Mental_PCBehavior", 1.0)

static func addPCSanity(value):
	GM.main.setModuleFlag("MedicalModule", "Mental_PCSanity", GM.main.getModuleFlag("MedicalModule", "Mental_PCSanity", 0.0) + value)
	if(GM.main.getModuleFlag("MedicalModule", "Mental_PCSanity", 0.0) < 0.0):
		GM.main.setModuleFlag("MedicalModule", "Mental_PCSanity", 0.0)
	if(GM.main.getModuleFlag("MedicalModule", "Mental_PCSanity", 0.0) > 1.0):
		GM.main.setModuleFlag("MedicalModule", "Mental_PCSanity", 1.0)
