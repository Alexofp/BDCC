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
		
		"res://Modules/MedicalModule/MentalWard/MentalWardScene.gd",
		"res://Modules/MedicalModule/MentalWard/MentalCheckup1.gd",
		"res://Modules/MedicalModule/MentalWard/MentalCheckupNoJacket.gd",
		]
	characters = [
	]
	items = []
	events = [
		"res://Modules/MedicalModule/ElizaTalkEvent.gd",
	]

func resetFlagsOnNewDay():
	GM.main.setFlag(Med_wasMilkedToday, false)
	GM.main.setFlag(Mental_CheckupHappened, false)
