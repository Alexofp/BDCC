extends Module
class_name MedicalModule

const Eliza_IntroducedMedical = "Eliza_IntroducedMedical"
const Med_pcKnowsAboutWork = "Med_pcKnowsAboutWork"
const Med_pcKnowsAboutBreeding = "Med_pcKnowsAboutBreeding"
const Med_pcKnowsAboutTests = "Med_pcKnowsAboutTests"
const Med_pcKnowsAboutMilking = "Med_pcKnowsAboutBreeding"
const Med_milkingMilkFirstTime = "Med_milkingMilkFirstTime"
const Med_milkingSeedFirstTime = "Med_milkingSeedFirstTime"

func _init():
	id = "MedicalModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/MedicalModule/ElizaTalkScene.gd",
		"res://Modules/MedicalModule/ElizaInducingLactation.gd",
		"res://Modules/MedicalModule/ElizaHandMilking.gd",
		]
	characters = [
	]
	items = []
	events = [
		"res://Modules/MedicalModule/ElizaTalkEvent.gd",
	]
