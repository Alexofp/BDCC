extends Module

func _init():
	id = "AcePregExpac"
	author = "AverageAce"
	
	scenes = [
		"res://Modules/AcePregExpac/AlexScenes/AlexPregTalkSceneAPE.gd",
		"res://Modules/AcePregExpac/AlexScenes/AlexToldHeIsFather.gd"
	]

	events = [
		"res://Modules/AcePregExpac/AlexScenes/AlexToldHeIsFatherEvent.gd",
	]

	characters = [
		"res://Modules/AcePregExpac/Fenrir.gd"
	]
func getFlags():
	return {
#		#
		"Alex_ToldIsFather": flag(FlagType.Number),
#		"Nova_SawPC": flag(FlagType.Bool),
#		"Nova_Introduced": flag(FlagType.Bool),
#		"Nova_NotThereToday": flag(FlagType.Bool),
#		"Nova_FirstTimePregnantHappened": flag(FlagType.Bool),
#		"Nova_GaveBirthTimes": flag(FlagType.Number),
	}
