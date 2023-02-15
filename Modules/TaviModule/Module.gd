extends Module
class_name TaviModule

func getFlags():
	return {
		# Tavi module
		"Tavi_IntroducedTo": flag(FlagType.Bool),
		"Tavi_IsAngryAtPlayer": flag(FlagType.Bool),
		"Tavi_ToldHowToEscape": flag(FlagType.Bool),
		"Tavi_NeedsApple": flag(FlagType.Bool),
		"Tavi_GotApple": flag(FlagType.Bool),
		"Tavi_AngryUntilDay": flag(FlagType.Number),
		"Tavi_Submissiveness": flag(FlagType.Number),
		"Tavi_ShowerEventHappened": flag(FlagType.Bool),
		"Tavi_Quest2Started": flag(FlagType.Bool),
		"Tavi_Quest2Day": flag(FlagType.Number),
		"Tavi_Quest2MetHer": flag(FlagType.Bool),
		"Tavi_Quest2Completed": flag(FlagType.Bool),
		
		# chapter1
		"ch1ApproachedAfterQuest2": flag(FlagType.Bool),
		"ch1SeducedRishaAndAttacked": flag(FlagType.Bool),
		"ch1SeducedRishaAndGotFucked": flag(FlagType.Bool),
		"ch1WaitedBeforePushingRisha": flag(FlagType.Bool),
		
		# chapter2
		"ch2ElizaBeganCheckup": flag(FlagType.Bool),
		"ch2ElizaDeclinedFullCheckup": flag(FlagType.Bool),
		"ch2PCFailedToStealDuringCheckup": flag(FlagType.Bool),
		"ch2PCAttackedEliza": flag(FlagType.Bool),
		"ch2PCAttackedElizaAndWon": flag(FlagType.Bool),
		"ch2PCDidBadThingsToEliza": flag(FlagType.Bool),
		"ch2PCGotPutIntoMentalByEliza": flag(FlagType.Bool),
		"ch2PCPutDrugsInsideSelf": flag(FlagType.Bool),
		"ch2PCStoleDrugs": flag(FlagType.Bool),
		"ch2ElizaReactedToRoughness": flag(FlagType.Bool),
		
		"ch2AlexTalkedTo": flag(FlagType.Bool),
		"ch2AlexCapturedSpying": flag(FlagType.Bool),
		"ch2AlexUsedStunbaton": flag(FlagType.Bool),
		"ch2AlexTriedToSeduce": flag(FlagType.Bool),
		"ch2AlexSurrendered": flag(FlagType.Bool),
		"ch2AlexAttackedAndWon": flag(FlagType.Bool),
		"ch2AlexAttacked": flag(FlagType.Bool),
		"ch2EscapedSymbian": flag(FlagType.Bool),
		"ch2EnduredSymbian": flag(FlagType.Bool),
		"ch2PCLearnedCode": flag(FlagType.Bool),
		
		"ch2DrugsGaveToTavi": flag(FlagType.Bool),
		"ch2DrugsAgreedToTest": flag(FlagType.Bool),
		"ch2DrugsPickedFuta": flag(FlagType.Bool),
		"ch2DrugsSaidYesToDemonTavi": flag(FlagType.Bool),
		
		# Chapter 3
		"ch3StartedInfiltration": flag(FlagType.Bool),
		"ch3IntimidatedKait": flag(FlagType.Bool),
		"ch3InterogatedTavi": flag(FlagType.Bool),
		"ch3CompletedDoorHack": flag(FlagType.Bool),
		"ch3CompletedSafeHack": flag(FlagType.Bool),
		"ch3AlexHappened": flag(FlagType.Bool),
		"ch3AlexChoice": flag(FlagType.Text), # submit, talk_failed, choked_out, fight
		"ch3AlexDefeatedHim": flag(FlagType.Bool),
		"ch3AlexHadSex": flag(FlagType.Bool),
		"ch3EnteredTransmitter": flag(FlagType.Bool),
		"Ch3TurnedOffPower": flag(FlagType.Bool),
		"Ch3SpikedPower": flag(FlagType.Bool),
		"Ch3SurrenderedToNova": flag(FlagType.Bool),
		"Ch3ProtectedTavi": flag(FlagType.Bool),
		"Ch3DefeatedByGuard": flag(FlagType.Bool),
		"Ch3DefeatedNova": flag(FlagType.Bool),
		
		# Chapter 4
		"TaviKilledJaxon": flag(FlagType.Bool),
		"Ch4SaidTaviIsMonster": flag(FlagType.Bool),
		"Ch4TortureEnd": flag(FlagType.Text), #gaveup, escaped, lost
		"Ch4TorturedSkar": flag(FlagType.Bool),
		"Ch4TaviKnowsSkarsName": flag(FlagType.Bool),
		"Ch4ServedPunishment": flag(FlagType.Bool),
		"Ch4KaitSceneHappened": flag(FlagType.Bool),
		"Ch4KaitFoundBug": flag(FlagType.Bool),
		"Ch4KaitGotBeatenUp": flag(FlagType.Bool),
		"Ch4LostToKait": flag(FlagType.Bool),
		"Ch4KaitIntoStocks": flag(FlagType.Bool),
		"Ch4KaitStocksProtected": flag(FlagType.Bool),
		"Ch4KaitStocksUsedByOthers": flag(FlagType.Bool),
		"Ch4KaitStocksPunishedByPC": flag(FlagType.Bool),
		
	}

func _init():
	id = "TaviModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/TaviModule/TaviFirstEncounterScene.gd",
		"res://Modules/TaviModule/TaviTalkScene.gd",
		"res://Modules/TaviModule/TaviPunishment1Scene.gd",
		"res://Modules/TaviModule/TaviSubmitToScene.gd",
		"res://Modules/TaviModule/DominateTaviScene.gd",
		"res://Modules/TaviModule/DegradeTaviScene.gd",
		
		"res://Modules/TaviModule/Quest2/TaviQuest2Start.gd",
		"res://Modules/TaviModule/Quest2/TaviQuest2Meet.gd",
		"res://Modules/TaviModule/Quest2/TaviQuest2Skar.gd",
		"res://Modules/TaviModule/Quest2/TaviQuest2CaptainsOffice.gd",
		
		"res://Modules/TaviModule/ShowerEvent/TaviShowerScene.gd",
		
		"res://Modules/TaviModule/Chapter1/Ch1s1ApproachingTavi.gd",
		"res://Modules/TaviModule/Chapter1/Ch1s2Risha.gd",
		"res://Modules/TaviModule/Chapter1/Ch1s3Datapad.gd",
		"res://Modules/TaviModule/Chapter2/Ch2e1MedicalCheckup.gd",
		"res://Modules/TaviModule/Chapter2/Ch2a1AlexTalkScene.gd",
		"res://Modules/TaviModule/Chapter2/Ch2a2CorridorScene.gd",
		"res://Modules/TaviModule/Chapter2/Ch2e2ElizaReactionToRoughness.gd",
		"res://Modules/TaviModule/Chapter2/Ch2t3TaviDrugsScene.gd",
		
		"res://Modules/TaviModule/Chapter3/Ch3s1TaviAndKaitScene.gd",
		"res://Modules/TaviModule/Chapter3/Ch3s2ControlRoomScene.gd",
		"res://Modules/TaviModule/Chapter3/Ch3s2AdvancedHackScene.gd",
		"res://Modules/TaviModule/Chapter3/Ch3s3AlexScene.gd",
		"res://Modules/TaviModule/Chapter3/Ch3s4TransmitterScene.gd",
		"res://Modules/TaviModule/Chapter3/Ch3s5CaptainScene.gd",
		"res://Modules/TaviModule/Chapter4/Ch4s1SolitaryScene.gd",
		"res://Modules/TaviModule/Chapter4/Ch4s2TaviFlashbackIntroScene.gd",
		"res://Modules/TaviModule/Chapter4/Ch4s3RishaFightScene.gd",
		"res://Modules/TaviModule/Chapter4/Ch4s4JaxonTalkScene.gd",
		"res://Modules/TaviModule/Chapter4/Ch4s5DirectorScene.gd",
		"res://Modules/TaviModule/Chapter4/Ch4s6EndingScene.gd",
		"res://Modules/TaviModule/Chapter4/Ch4s7CaptainScene.gd",
		"res://Modules/TaviModule/Chapter4/Ch4s8KaitScene.gd",
		]
	characters = [
		"res://Modules/TaviModule/Chapter4/DirectorTau.gd",
		"res://Modules/TaviModule/Chapter4/JaxonTau.gd",
		"res://Modules/TaviModule/Chapter4/RishaTau.gd",
		"res://Modules/TaviModule/Chapter4/JaxonBrotherTau.gd",
	]
	items = []
	events = [
		"res://Modules/TaviModule/TaviTalkEvent.gd",
		"res://Modules/TaviModule/TaviFirstEncounterEvent.gd",
		
		"res://Modules/TaviModule/Quest2/TaviQuest2TalkEvent.gd",
		"res://Modules/TaviModule/Quest2/TaviQuest2SkarEvent.gd",
		"res://Modules/TaviModule/Quest2/TaviQuest2ElevatorEvent.gd",
		
		"res://Modules/TaviModule/ShowerEvent/TaviShowerEvent.gd",
		
		"res://Modules/TaviModule/Chapter1/Ch1s1ApproachingTaviEvent.gd",
		"res://Modules/TaviModule/Chapter2/Ch2e1ElizaTalkEvent.gd",
		"res://Modules/TaviModule/Chapter2/Ch2e1StealDrugsFromStorageEvent.gd",
		"res://Modules/TaviModule/Chapter2/Ch2a1AlexTalkEvent.gd",
		"res://Modules/TaviModule/Chapter2/Ch2a2CorridorEvent.gd",
		"res://Modules/TaviModule/Chapter2/Ch2EnterCorridorEvent.gd",
		"res://Modules/TaviModule/Chapter2/Ch2e2ElizaReactionToRoughnessEvent.gd",
		"res://Modules/TaviModule/Chapter2/Ch2t3TaviTalkEvent.gd",
		"res://Modules/TaviModule/Chapter3/Ch3TaviTalkAndKaitEvent.gd",
		"res://Modules/TaviModule/Chapter3/Ch3s2ControlRoomEvent.gd",
		"res://Modules/TaviModule/Chapter3/Ch3s3AlexEvent.gd",
		"res://Modules/TaviModule/Chapter3/Ch3s4TransmitterEvent.gd",
		"res://Modules/TaviModule/Chapter4/Ch4s8KaitEvent.gd",
	]
	quests = [
		"res://Modules/TaviModule/TaviAppleQuest.gd",
		"res://Modules/TaviModule/Quest2/TaviQuest2.gd",
		"res://Modules/TaviModule/Chapter2/Ch2ElizaQuest.gd",
		"res://Modules/TaviModule/Chapter2/Ch2AlexQuest.gd",
		"res://Modules/TaviModule/Chapter3/Ch3TaviQuest.gd",
	]
	worldEdits = [
		"res://Modules/TaviModule/TaviWorldEdit.gd",
	]
	computers = [
		"res://Modules/TaviModule/Chapter3/TaviEngineeringComputer.gd",
		"res://Modules/TaviModule/Chapter3/TaviEngineeringSafeComputer.gd",
	]

func resetFlagsOnNewDay():
	pass

static func makeTaviAngry():
	GM.main.setModuleFlag("TaviModule", "Tavi_IsAngryAtPlayer", true)
	GM.main.setModuleFlag("TaviModule", "Tavi_AngryUntilDay", GM.main.getDays() + 2)
	
static func getPunishmentScene():
	return RNG.pick([
		"TaviPunishment1Scene",
		])

static func trustsPC():
	return !GM.main.getModuleFlag("TaviModule", "Tavi_IsAngryAtPlayer", false) && GM.main.getModuleFlag("TaviModule", "Tavi_IntroducedTo", false)
