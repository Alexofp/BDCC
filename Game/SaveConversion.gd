extends Reference
class_name SaveConversion

static func convertFlag(flags:Dictionary, moduleFlags:Dictionary, moduleID, flagID):
	if(!flags.has(flagID)):
		return
	
	if(!moduleFlags.has(moduleID)):
		moduleFlags[moduleID] = {}
	
	moduleFlags[moduleID][flagID] = flags[flagID]
	var _ok = flags.erase(flagID)
	Log.print("COVERTED FLAG "+str(flagID)+" FROM GLOBAL TO MODULE "+str(moduleID))


static func fixFlagsFromVersion1(_main, data):
	Log.print("CONVERTING FLAGS FROM VERSION 1")
	var flags:Dictionary = SAVE.loadVar(data, "flags", {})
	var moduleFlags = SAVE.loadVar(data, "moduleFlags", {})
	
	var flagsToFix = {
		"NovaModule": [
			"Nova_GotHumiliatedByPC",
			"Nova_SawPC",
			"Nova_Introduced",
			"Nova_NotThereToday",
			"Nova_FirstTimePregnantHappened",
			"Nova_GaveBirthTimes",
		],
		"GymModule": [
			"Gym_RishaLastDayGotPaid",
		],
		"TaviModule": [
			"Tavi_IntroducedTo",
			"Tavi_IsAngryAtPlayer",
			"Tavi_ToldHowToEscape",
			"Tavi_NeedsApple",
			"Tavi_GotApple",
			"Tavi_AngryUntilDay",
			"Tavi_Submissiveness",
			"Tavi_ShowerEventHappened",
			"Tavi_Quest2Started",
			"Tavi_Quest2Day",
			"Tavi_Quest2MetHer",
			"Tavi_Quest2Completed",
		],
		"RahiModule": [
			"Rahi_Introduced",
			"Rahi_AskedName",
			"Rahi_GaveApple",
			"Rahi_CanteenSceneHappened",
			"Avy_WonCanteenFight",
			"Rahi_ChillWillHappen",
			"Rahi_ChillHappened",
			"Rahi_ChillCooldown",
			"Rahi_Denied",
			"Rahi_ShowerHappened",
			"Rahi_NotThereToday",
			"Rahi_FirstTimePregnantHappened",
			"Rahi_GaveBirthTimes",
		],
		"MedicalModule": [
			"Eliza_IntroducedMedical",
			"Med_pcKnowsAboutWork",
			"Med_pcKnowsAboutBreeding",
			"Med_pcKnowsAboutTests",
			"Med_pcKnowsAboutMilking",
			"Med_milkingMilkFirstTime",
			"Med_milkingSeedFirstTime",
			
			"Med_milkMilked",
			"Med_seedMilked",
			"Med_milkedMilkTimes",
			"Med_milkedSeedTimes",
			
			"Med_wasMilkedToday",
			
			"Mental_PCBehavior",
			"Mental_PCSanity",
			"Mental_CheckupHappened",
			"Mental_ExperimentHappened",
			"Mental_ShowerHappened",
			
			"Mental_ExpObeyDrug",
			"Mental_ExpTentacles",
			
			"Mental_HasKeycard",
			"Mental_PlayerEscaped",
			
			"Nursery_Introduced",
			"Nursery_AskedHowWorks",
			"Nursery_AskedDatabase",
		],
		"CellblockModule": [
			"Cellblock_FreeToPassCheckpoint",
			"Cellblock_CheckpointVisited",
			"Cellblock_GreenhouseLooted",
			"Cellblock_GreenhouseFoundChip",
		],
	}
	
	for moduleID in flagsToFix:
		for flagID in flagsToFix[moduleID]:
			convertFlag(flags, moduleFlags, moduleID, flagID)

	Log.print("FINISHED CONVERTING FLAGS FROM VERSION 1")
