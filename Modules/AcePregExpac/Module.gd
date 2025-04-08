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


func getFlags():
	return {
#		#
		"Alex_ToldIsFather": flag(FlagType.Number),
		"Alex_TimesMilkingPlayer": flag(FlagType.Number),
#		"AlexPC_GaveBirthTimes": flag(FlagType.Number),
	}
