extends Module

func getFlags():
	return {
		"ch1IntroSceneHappened": flag(FlagType.Bool),
	}

func _init():
	id = "AlexRynardModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/AlexRynardModule/AlexS1IntroScene.gd",
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
