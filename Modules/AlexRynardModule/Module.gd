extends Module

func getFlags():
	return {
		"ch1IntroSceneHappened": flag(FlagType.Bool),
		"ch1HowManyTimesIdled": flag(FlagType.Number),
	}

func _init():
	id = "AlexRynardModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/AlexRynardModule/AlexS1IntroScene.gd",
		"res://Modules/AlexRynardModule/AlexS2SittingNearScene.gd",
		]
	characters = [

	]
	items = []
	events = [
		"res://Modules/AlexRynardModule/AlexS1IntroEvent.gd",
	]
	quests = [
	]

func resetFlagsOnNewDay():
	pass
