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
	}
	
	for moduleID in flagsToFix:
		for flagID in flagsToFix[moduleID]:
			convertFlag(flags, moduleFlags, moduleID, flagID)

	Log.print("FINISHED CONVERTING FLAGS FROM VERSION 1")
