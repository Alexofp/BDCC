extends Module
class_name NovaModule

func getFlags():
	return {
		# Nova module
		"Nova_GotHumiliatedByPC": flag(FlagType.Bool),
		"Nova_SawPC": flag(FlagType.Bool),
		"Nova_Introduced": flag(FlagType.Bool),
		"Nova_NotThereToday": flag(FlagType.Bool),
		"Nova_FirstTimePregnantHappened": flag(FlagType.Bool),
		"Nova_GaveBirthTimes": flag(FlagType.Number),
	}

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
	if(GM.main.getModuleFlag("NovaModule", "Nova_NotThereToday")):
		GM.main.setModuleFlag("NovaModule", "Nova_NotThereToday", false)
