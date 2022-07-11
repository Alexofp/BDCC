extends Module
class_name NovaModule

const Nova_GotHumiliatedByPC = "Nova_GotHumiliatedByPC"
const Nova_SawPC = "Nova_SawPC"
const Nova_Introduced = "Nova_Introduced"
const Nova_NotThereToday = "Nova_NotThereToday"

const Nova_FirstTimePregnantHappened = "Nova_FirstTimePregnantHappened"
const Nova_GaveBirthTimes = "Nova_GaveBirthTimes"

func _init():
	id = "NovaModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/NovaModule/CaughtOffLimitsByNovaScene.gd",
		"res://Modules/NovaModule/HumiliateNovaScene.gd",
		"res://Modules/NovaModule/RideSubbyNovaScene.gd",
		"res://Modules/NovaModule/SuckNovaCockScene.gd",
		"res://Modules/NovaModule/FuckSubbyNovaScene.gd",
		
		"res://Modules/NovaModule/NovaTalkScene.gd",
		"res://Modules/NovaModule/NovaPetplayScene.gd",
		
		"res://Modules/NovaModule/NovaFirstTimePregnantScene.gd",
		]
	characters = [
		"res://Modules/NovaModule/NovaCharacter.gd",
	]
	items = []
	events = [
		"res://Modules/NovaModule/NovaCatchesPlayerOffLimitsEvent.gd",
		
		"res://Modules/NovaModule/NovaTalkEvent.gd",
		
		"res://Modules/NovaModule/NovaFirstTimePregnantEvent.gd",
	]

func resetFlagsOnNewDay():
	if(getFlag(Nova_NotThereToday, false)):
		setFlag(Nova_NotThereToday, false)
