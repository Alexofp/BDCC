extends Module

func getFlags():
	return {
		"ch1IntroSceneHappened": flag(FlagType.Bool),
		"ch1HowManyTimesIdled": flag(FlagType.Number),
		"ch1FirstFuckup": flag(FlagType.Bool),
		"ch1NextDaySceneHappened": flag(FlagType.Bool),
		"ch1StopAlexContent": flag(FlagType.Bool),
		"ch1HowMoreIdles": flag(FlagType.Number),
		"ch1CommentedPay": flag(FlagType.Bool),
		"ch1HypnovisorHappened": flag(FlagType.Bool),
		
		"ch2SceneNum": flag(FlagType.Number),
	}

func _init():
	id = "AlexRynardModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/AlexRynardModule/AlexBuySellScene.gd",
		"res://Modules/AlexRynardModule/Ch1/AlexS1IntroScene.gd",
		"res://Modules/AlexRynardModule/Ch1/AlexS2SittingNearScene.gd",
		"res://Modules/AlexRynardModule/Ch1/AlexS3NextDayScene.gd",
		"res://Modules/AlexRynardModule/Ch1/AlexS4FixingDatapadsScene.gd",
		"res://Modules/AlexRynardModule/Ch1/AlexS5HypnovisorIntroScene.gd",
		]
	characters = [

	]
	items = []
	events = [
		"res://Modules/AlexRynardModule/Ch1/AlexS1IntroEvent.gd",
	]
	quests = [
	]

func resetFlagsOnNewDay():
	pass
