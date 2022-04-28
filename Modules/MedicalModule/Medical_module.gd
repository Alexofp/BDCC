extends Module
class_name MedicalModule

const Eliza_IntroducedMedical = "Eliza_IntroducedMedical"
const Med_pcKnowsAboutWork = "Med_pcKnowsAboutWork"
const Med_pcKnowsAboutBreeding = "Med_pcKnowsAboutBreeding"
const Med_pcKnowsAboutTests = "Med_pcKnowsAboutTests"
const Med_pcKnowsAboutMilking = "Med_pcKnowsAboutBreeding"
const Med_milkingMilkFirstTime = "Med_milkingMilkFirstTime"
const Med_milkingSeedFirstTime = "Med_milkingSeedFirstTime"

const Med_milkMilked = "Med_milkMilked"
const Med_seedMilked = "Med_seedMilked"
const Med_milkedMilkTimes = "Med_milkedMilkTimes"
const Med_milkedSeedTimes = "Med_milkedSeedTimes"

const Med_wasMilkedToday = "Med_wasMilkedToday"

const Mental_PCBehavior = "Mental_PCBehavior"
const Mental_PCSanity = "Mental_PCSanity"
const Mental_CheckupHappened = "Mental_DidCheckup"
const Mental_ExperimentHappened = "Mental_ExperimentHappened"
const Mental_ShowerHappened = "Mental_ShowerHappened"
const Mental_ExpObeyDrug = "Mental_ExpObeyDrug"
const Mental_ExpTentacles = "Mental_ExpTentacles"
const Mental_HasKeycard = "Mental_HasKeycard"
const Mental_PlayerEscaped = "Mental_PlayerEscaped"

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
		]
	characters = [
		"res://Modules/MedicalModule/MentalWard/LatexParasite.gd",
		"res://Modules/MedicalModule/NurseFeline.gd",
	]
	items = []
	events = [
		"res://Modules/MedicalModule/ElizaTalkEvent.gd",
		"res://Modules/MedicalModule/CaughtOffLimitsInMentalEvent.gd",
	]

func resetFlagsOnNewDay():
	GM.main.setFlag(Med_wasMilkedToday, false)
	GM.main.setFlag(Mental_CheckupHappened, false)
	GM.main.setFlag(Mental_ExperimentHappened, false)
	GM.main.setFlag(Mental_ShowerHappened, false)
	GM.main.setFlag(Mental_PlayerEscaped, false)

static func resetFlagsOnGettingIntoMentalWard():
	GM.main.setFlag(Mental_PCBehavior, 0.1)
	GM.main.setFlag(Mental_PCSanity, 0.0)
	
	GM.main.setFlag(Mental_ExpObeyDrug, 0)
	GM.main.setFlag(Mental_ExpTentacles, 0)
	GM.main.setFlag(Mental_HasKeycard, false)
	GM.main.setFlag(Mental_PlayerEscaped, false)

static func addPCBehavior(value):
	GM.main.setFlag(Mental_PCBehavior, GM.main.getFlag(Mental_PCBehavior, 0.0) + value)
	if(GM.main.getFlag(Mental_PCBehavior, 0.0) < 0.0):
		GM.main.setFlag(Mental_PCBehavior, 0.0)
	if(GM.main.getFlag(Mental_PCBehavior, 0.0) > 1.0):
		GM.main.setFlag(Mental_PCBehavior, 1.0)

static func addPCSanity(value):
	GM.main.setFlag(Mental_PCSanity, GM.main.getFlag(Mental_PCSanity, 0.0) + value)
	if(GM.main.getFlag(Mental_PCSanity, 0.0) < 0.0):
		GM.main.setFlag(Mental_PCSanity, 0.0)
	if(GM.main.getFlag(Mental_PCSanity, 0.0) > 1.0):
		GM.main.setFlag(Mental_PCSanity, 1.0)
