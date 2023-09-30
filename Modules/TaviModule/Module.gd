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
		
		# Character 5
		"Ch5NewPlanSceneHappend": flag(FlagType.Bool),
		"Ch5LastGuardLooted": flag(FlagType.Text),
		"Ch5GuardsLooted": flag(FlagType.Number),
		"Ch5StoleDatapadFromGuard": flag(FlagType.Bool),
		"Ch5StoleDatapadFromNova": flag(FlagType.Bool),
		"Ch5BlackmailedNova": flag(FlagType.Bool),
		"Ch5SearchedLabFirstTime": flag(FlagType.Bool),
		"Ch5EnabledLabPower": flag(FlagType.Bool),
		"Ch5SentinelXHappened": flag(FlagType.Bool),
		"Ch5PreparationHappened": flag(FlagType.Bool),
		"Ch5BigSceneStarted": flag(FlagType.Bool),
		"Ch5OnlyTaviPunished": flag(FlagType.Bool),
		"Ch5FoundPunishedTavi": flag(FlagType.Bool),
		"Ch5ElizaGotTortured": flag(FlagType.Bool),
		"Ch5TaviSavedDay": flag(FlagType.Number),
		
		"Ch6IntroHappened": flag(FlagType.Bool),
		"Ch6Corruption": flag(FlagType.Number),
		"TaviIsNotVirgin": flag(FlagType.Bool),
		"Ch6TaviSatisfied": flag(FlagType.Bool),
		"Ch6CorruptionStage": flag(FlagType.Number), # 0 - default, 1 - horn signs, 2 - horns, 3 - womb mark
		"Ch6PurityStage": flag(FlagType.Number), # 0 - default, 1 - talked about what happened, 2 - can somewhat control herself, 3 - pretty much old Tavi
		"Ch6Tiredness": flag(FlagType.Number),
		"Ch6TaviReceivedHorns": flag(FlagType.Bool),
		"Ch6TaviReceivedWombMark": flag(FlagType.Bool),
		"Ch6TaviChillTalk": flag(FlagType.Number),
		"Ch6TaviLastGropeHow": flag(FlagType.Text),
		"Ch6TaviLactationProgress": flag(FlagType.Number),
		"Ch6TaviAllowedToSleepInPCCell": flag(FlagType.Bool),
		"Ch6TaviAllowedToLewdPCDuringSleep": flag(FlagType.Bool),
		"Ch6TaviSleepInPCCellFirstTime": flag(FlagType.Bool),
		"Ch6TaviAndRahiStackSceneHappened": flag(FlagType.Bool),
		"Ch6TaviDemonSceneHappened": flag(FlagType.Bool),
		"Ch6TaviShouldHaveCock": flag(FlagType.Bool),
		"Ch6TaviRegrewHymen": flag(FlagType.Bool),
		
		"Ch7PlanningSceneHappened": flag(FlagType.Bool),
		"Ch7TaviTookVirginityBeforeMission": flag(FlagType.Bool),
		
		"taviSkillCombat": flag(FlagType.Number),
		"taviSkillSex": flag(FlagType.Number),
		"taviSkillMasochism": flag(FlagType.Number),
		"taviSkillPetplay": flag(FlagType.Number),
		"taviSkillWatersports": flag(FlagType.Number),
		
		"Ch7CaptainSceneHappened": flag(FlagType.Bool),
		"Ch7NoEnding": flag(FlagType.Bool),
		"Ch7YesEnding": flag(FlagType.Bool),
		"Ch7KillEnding": flag(FlagType.Bool),
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
		
		"res://Modules/TaviModule/Chapter5/Ch5s1PlanningScene.gd",
		"res://Modules/TaviModule/Chapter5/Ch5s2NovaScene.gd",
		"res://Modules/TaviModule/Chapter5/Ch5s3AssemblyFirstScene.gd",
		"res://Modules/TaviModule/Chapter5/Ch5s4EnablePowerScene.gd",
		"res://Modules/TaviModule/Chapter5/Ch5s5TaviPreparationScene.gd",
		"res://Modules/TaviModule/Chapter5/Ch5s6TaviCaptainScene.gd",
		"res://Modules/TaviModule/Chapter5/Ch5s7PlayerCellScene.gd",
		"res://Modules/TaviModule/Chapter5/Ch5s7BElizaTaviScene.gd",
		"res://Modules/TaviModule/Chapter5/Ch5s7MedicalTortureScene.gd",
		
		"res://Modules/TaviModule/Chapter6/Ch6TaviIntroScene.gd",
		"res://Modules/TaviModule/Chapter6/Ch6TaviTalkScene.gd",
		"res://Modules/TaviModule/Chapter6/Ch6TaviMorningScene.gd",
		
		"res://Modules/TaviModule/Chapter6/Skills/Ch6TaviCombatSkillScene.gd",
		"res://Modules/TaviModule/Chapter6/Skills/Ch6TaviSexSkillScene.gd",
		"res://Modules/TaviModule/Chapter6/Skills/Ch6TaviMasochismSkillScene.gd",
		"res://Modules/TaviModule/Chapter6/MasochismMinigame/TaviMasochismScene.gd",
		"res://Modules/TaviModule/Chapter6/MasochismMinigame/TaviMasochismOutcomesScene.gd",
		"res://Modules/TaviModule/Chapter6/MasochismMinigame/TaviMasochismUnconsciousScene.gd",
		"res://Modules/TaviModule/Chapter6/Skills/Ch6TaviPetplaySkillScene.gd",
		"res://Modules/TaviModule/Chapter6/Skills/Ch6TaviWatersportsSkillScene.gd",
		
		"res://Modules/TaviModule/Chapter6/CorruptionScenes/Ch6TaviCorruption75Scene.gd",
		"res://Modules/TaviModule/Chapter6/CorruptionScenes/Ch6TaviCorruption50Scene.gd",
		"res://Modules/TaviModule/Chapter6/CorruptionScenes/Ch6TaviCorruption25Scene.gd",
		"res://Modules/TaviModule/Chapter6/CorruptionScenes/Ch6TaviCorruption0Scene.gd",
		"res://Modules/TaviModule/Chapter6/CorruptionScenes/Ch6TaviCorruption125Scene.gd",
		"res://Modules/TaviModule/Chapter6/CorruptionScenes/Ch6TaviCorruption150Scene.gd",
		"res://Modules/TaviModule/Chapter6/CorruptionScenes/Ch6TaviCorruption175Scene.gd",
		"res://Modules/TaviModule/Chapter6/CorruptionScenes/Ch6TaviCorruption200Scene.gd",
		
		"res://Modules/TaviModule/Chapter6/Activities/Ch6TaviShowerScene.gd",
		"res://Modules/TaviModule/Chapter6/Activities/Ch6TaviMilkingScene.gd",
		"res://Modules/TaviModule/Chapter6/Activities/Ch6TaviAllowSleepInCellScene.gd",
		"res://Modules/TaviModule/Chapter6/Activities/Ch6TaviSleepInCellScene.gd",
		"res://Modules/TaviModule/Chapter6/Activities/Ch6TaviRahiButtstackScene.gd",
		"res://Modules/TaviModule/Chapter6/Activities/Ch6TaviDemonScene.gd",
		
		"res://Modules/TaviModule/Chapter7/Ch7s1PlanningScene.gd",
		"res://Modules/TaviModule/Chapter7/Ch7s2aAloneScene.gd",
		"res://Modules/TaviModule/Chapter7/Ch7s2bTaviScene.gd",
		"res://Modules/TaviModule/Chapter7/Ch7s3CaptainScene.gd",
		"res://Modules/TaviModule/Chapter7/Ch7NoEndingScene.gd",
		"res://Modules/TaviModule/Chapter7/Ch7KillEndingScene.gd",
		"res://Modules/TaviModule/Chapter7/Ch7YesEndingScene.gd",
		]
	characters = [
		"res://Modules/TaviModule/Chapter4/DirectorTau.gd",
		"res://Modules/TaviModule/Chapter4/JaxonTau.gd",
		"res://Modules/TaviModule/Chapter4/RishaTau.gd",
		"res://Modules/TaviModule/Chapter4/JaxonBrotherTau.gd",
		"res://Modules/TaviModule/Chapter5/SentinelX.gd",
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
		
		"res://Modules/TaviModule/Chapter5/Ch5s1PlanningEvent.gd",
		"res://Modules/TaviModule/Chapter5/Ch5s2DefeatedGuardEvent.gd",
		"res://Modules/TaviModule/Chapter5/Ch5s2NovaEvent.gd",
		"res://Modules/TaviModule/Chapter5/Ch5s3AssemblyFirstEvent.gd",
		"res://Modules/TaviModule/Chapter5/Ch5s4EnablePowerEvent.gd",
		"res://Modules/TaviModule/Chapter5/Ch5s5TaviPreparationEvent.gd",
		"res://Modules/TaviModule/Chapter5/Ch5s7BElizaTaviEvent.gd",
		
		"res://Modules/TaviModule/Chapter6/Ch6TaviTalkEvent.gd",
		"res://Modules/TaviModule/Chapter6/Activities/Ch6TaviSleepInCellEvent.gd",
		"res://Modules/TaviModule/Chapter6/Activities/Ch6TaviRahiButtstackEvent.gd",
		
		"res://Modules/TaviModule/Chapter7/Ch7s2aAloneEvent.gd",
	]
	quests = [
		"res://Modules/TaviModule/TaviAppleQuest.gd",
		"res://Modules/TaviModule/Quest2/TaviQuest2.gd",
		"res://Modules/TaviModule/Chapter2/Ch2ElizaQuest.gd",
		"res://Modules/TaviModule/Chapter2/Ch2AlexQuest.gd",
		"res://Modules/TaviModule/Chapter3/Ch3TaviQuest.gd",
		"res://Modules/TaviModule/Chapter5/Ch5TaviQuest.gd",
		"res://Modules/TaviModule/Chapter6/Ch6TaviQuest.gd",
	]
	worldEdits = [
		"res://Modules/TaviModule/TaviWorldEdit.gd",
	]
	computers = [
		"res://Modules/TaviModule/Chapter3/TaviEngineeringComputer.gd",
		"res://Modules/TaviModule/Chapter3/TaviEngineeringSafeComputer.gd",
	]

func resetFlagsOnNewDay():
	if(getFlag("TaviModule.Ch6TaviSatisfied")):
		setFlag("TaviModule.Ch6TaviSatisfied", false)
	if(getFlag("TaviModule.Ch6Tiredness", 0) != 0):
		setFlag("TaviModule.Ch6Tiredness", 0)

static func makeTaviAngry():
	GM.main.setModuleFlag("TaviModule", "Tavi_IsAngryAtPlayer", true)
	GM.main.setModuleFlag("TaviModule", "Tavi_AngryUntilDay", GM.main.getDays() + 2)
	
static func getPunishmentScene():
	return RNG.pick([
		"TaviPunishment1Scene",
		])

static func trustsPC():
	return !GM.main.getModuleFlag("TaviModule", "Tavi_IsAngryAtPlayer", false) && GM.main.getModuleFlag("TaviModule", "Tavi_IntroducedTo", false)

func getAllSkills():
	return ["taviSkillCombat", "taviSkillSex", "taviSkillMasochism", "taviSkillPetplay", "taviSkillWatersports"]

func getSkillInfo(skillID):
	if(skillID == "taviSkillCombat"):
		return {
			name = "Combat",
			desc = "Teaching Tavi how to stand up for herself",
			scene = "Ch6TaviCombatSkillScene",
		}
	if(skillID == "taviSkillSex"):
		return {
			name = "Sex",
			desc = "Allowing Tavi to enjoy all the sex that she missed",
			scene = "Ch6TaviSexSkillScene",
		}
	if(skillID == "taviSkillMasochism"):
		return {
			name = "Masochism",
			desc = "Training Tavi to endure pain better",
			scene = "Ch6TaviMasochismSkillScene",
		}
	if(skillID == "taviSkillPetplay"):
		return {
			name = "Petplay",
			desc = "Training Tavi to be a better pet",
			scene = "Ch6TaviPetplaySkillScene",
		}
	if(skillID == "taviSkillWatersports"):
		return {
			name = "Watersports",
			desc = "Training Tavi to enjoy pee",
			scene = "Ch6TaviWatersportsSkillScene",
		}
	
	return null

func canTrainSkill(skillID):
	if(skillID == "taviSkillWatersports"):
		if(!OPTIONS.isContentEnabled(ContentType.Watersports)):
			return false
	
	return true

func hasAllSkillsLearnedFully():
	for skillID in getAllSkills():
		if(!canTrainSkill(skillID)):
			continue
		if(getSkillScore(skillID) < 7):
			return false
	return true

# F D C B A S S+ S++
# 0 1 2 3 4 5 6  7
func getSkillScore(skillID):
	return Util.mini(Util.maxi(int(getFlag("TaviModule."+str(skillID), 0)), 0), 7)

func advanceSkill(skillID, maxLevel = 7):
	if(getSkillInfo(skillID) == null):
		return false
	
	if(getFlag("TaviModule."+str(skillID), 0) < maxLevel):
		increaseFlag("TaviModule."+str(skillID), 1)
	return true

func getSkillScoreText(skillID):
	var score = getSkillScore(skillID)
	score = Util.mini(Util.maxi(int(score), 0), 7)
	
	var scoreToText = ["F", "D", "C", "B", "A", "S", "S+", "S++"]
	
	return scoreToText[score]

func getOverallCorruptStage():
	var corruptionStage = getFlag("TaviModule.Ch6CorruptionStage", 0)
	var purityStage = getFlag("TaviModule.Ch6PurityStage", 0)
	
	return Util.maxi(corruptionStage, purityStage)

func getAvaiableStoryScene():
	var currentCorruption = getFlag("TaviModule.Ch6Corruption", 1.0)
	var corruptionStage = getFlag("TaviModule.Ch6CorruptionStage", 0)
	var purityStage = getFlag("TaviModule.Ch6PurityStage", 0)
	
	var corruptScenes = [
		{at=1.25,stage=1,scene="Ch6TaviCorruption125Scene"},
		{at=1.5,stage=2,scene="Ch6TaviCorruption150Scene"},
		{at=1.75,stage=3,scene="Ch6TaviCorruption175Scene"},
		{at=2.0,stage=4,scene="Ch6TaviCorruption200Scene"},
	]
	var purityScenes = [
		{at=0.75,stage=1,scene="Ch6TaviCorruption75Scene"},
		{at=0.5,stage=2,scene="Ch6TaviCorruption50Scene"},
		{at=0.25,stage=3,scene="Ch6TaviCorruption25Scene"},
		{at=0.0,stage=4,scene="Ch6TaviCorruption0Scene"},
	]
	for sceneData in corruptScenes:
		if(currentCorruption >= sceneData["at"] && corruptionStage<sceneData["stage"]):
			return sceneData
	for sceneData in purityScenes:
		if(currentCorruption <= sceneData["at"] && purityStage<sceneData["stage"]):
			return sceneData
	
	return null

func isVirgin():
	return !getFlag("TaviModule.TaviIsNotVirgin", false)

func getCorruption():
	return getFlag("TaviModule.Ch6Corruption", 1.0)

func isCorrupt():
	var currentCorruption = getFlag("TaviModule.Ch6Corruption", 1.0)
	if(currentCorruption >= 1.5 && getFlag("TaviModule.Ch6CorruptionStage", 0) >= 2):
		return true
	return false

func isPure():
	var currentCorruption = getFlag("TaviModule.Ch6Corruption", 1.0)
	if(currentCorruption <= 0.5 && getFlag("TaviModule.Ch6PurityStage", 0) >= 2):
		return true
	return false

func hasHorns():
	if(getFlag("TaviModule.Ch6TaviReceivedHorns", false)):
		return true
	return false

func hasWombMark():
	if(getFlag("TaviModule.Ch6TaviReceivedWombMark", false)):
		return true
	return false

func shouldHaveCock():
	if(getFlag("TaviModule.Ch6TaviShouldHaveCock")):
		return true
	return false

func addCorruption(howMuch, showMessage = true):
	howMuch /= 100.0
	var currentCorruption = getFlag("TaviModule.Ch6Corruption", 1.0)
	var oldCor = currentCorruption
	
	currentCorruption += howMuch
	if(howMuch > 0.0 && currentCorruption > 2.0):
		currentCorruption = 2.0
	if(howMuch < 0.0 && currentCorruption < 0.0):
		currentCorruption = 0.0
	
	setFlag("TaviModule.Ch6Corruption", currentCorruption)
	
	
	if(showMessage):
		var diff = currentCorruption - oldCor
		if(diff > 0.0):
			GM.main.addMessage("Tavi's corruption has increased to "+str(Util.roundF(currentCorruption * 100.0, 1))+"%")
		elif(diff < 0.0):
			GM.main.addMessage("Tavi's corruption has decreased to "+str(Util.roundF(currentCorruption * 100.0, 1))+"%")
