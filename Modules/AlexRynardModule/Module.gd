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
		"ch2CanEnterEngineering": flag(FlagType.Bool),
		"ch2StayedWhenSpineBorked": flag(FlagType.Bool),
		"ch2EavesdroppedCaptain": flag(FlagType.Bool),
		"ch2SkippedBackstory": flag(FlagType.Bool),
		
		"ch2s3SceneNum": flag(FlagType.Number),
		"ch2PickedRomanticMovie": flag(FlagType.Bool),
		"ch2MovieHadSex": flag(FlagType.Bool),
		"ch2CBTAvy": flag(FlagType.Bool),
		"ch2KnockedAlexOut": flag(FlagType.Bool),
		"ch2GotRektHappened": flag(FlagType.Bool),
		"ch2GotRektDay": flag(FlagType.Number),
		"ch2CheckAlexSceneHappened": flag(FlagType.Bool),
		"ch2FoundParts": flag(FlagType.Number),
		"ch2StolePartsStorageDay": flag(FlagType.Number),
		"ch2LastCheckedNPC": flag(FlagType.Text),
		"ch2FinalSceneHappened": flag(FlagType.Bool),
		"ch2DidChastityWith": flag(FlagType.Bool),
		
		"1TrustCompleted": flag(FlagType.Bool),
		"2TrustCompleted": flag(FlagType.Bool),
		"3TrustCompleted": flag(FlagType.Bool),
		"4TrustCompleted": flag(FlagType.Bool),
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
		
		"res://Modules/AlexRynardModule/Ch2/AlexCh2s1Scene.gd",
		"res://Modules/AlexRynardModule/Ch2/AlexCh2s2BackstoryScene.gd",
		"res://Modules/AlexRynardModule/Ch2/AlexCh2s3Scene.gd",
		"res://Modules/AlexRynardModule/Ch2/AlexCh2s4ElizaScene.gd",
		"res://Modules/AlexRynardModule/Ch2/AlexCh2s5FinalScene.gd",
		
		"res://Modules/AlexRynardModule/Trust/AlexTrustExercisesMenuScene.gd",
		"res://Modules/AlexRynardModule/Trust/AlexTrustExercise1Scene.gd",
		"res://Modules/AlexRynardModule/Trust/AlexTrustExercise2Scene.gd",
		"res://Modules/AlexRynardModule/Trust/AlexTrustExercise3Scene.gd",
		"res://Modules/AlexRynardModule/Trust/AlexTrustExercise4Scene.gd",
	]
	characters = [
		"res://Modules/AlexRynardModule/Ch2/BackstoryChars/AlexRynardYoung.gd",
		"res://Modules/AlexRynardModule/Ch2/BackstoryChars/LinAlex.gd",
		"res://Modules/AlexRynardModule/Ch2/BackstoryChars/SentinelAlex.gd",
		"res://Modules/AlexRynardModule/Ch2/BackstoryChars/BossAlex.gd",
	]
	items = []
	events = [
		"res://Modules/AlexRynardModule/Ch1/AlexS1IntroEvent.gd",
		"res://Modules/AlexRynardModule/Ch2/AlexCh2s4ElizaEvent.gd",
		"res://Modules/AlexRynardModule/Ch2/AlexCh2S4CollectPartsEvent.gd",
	]
	quests = [
		"res://Modules/AlexRynardModule/Ch2/SaveAlexQuest.gd",
	]

func resetFlagsOnNewDay():
	pass
