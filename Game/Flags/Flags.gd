extends Object
class_name Flag

const TestFlag = "TestFlag"
const Canteen_PlayerAteToday = "Canteen_PlayerAteToday"
const Mining_IntroducedToMinning = "Mining_IntroducedToMinning"
const Game_CompletedPrologue = "Game_CompletedPrologue"
const Game_PickedStartingPerks = "Game_PickedStartingPerks"
const Player_Crime_Type = "Player_Crime_Type"
enum Crime_Type {Innocent, Theft, Murder, Prostitution}
const Trigger_CaughtOffLimitsCD = "Trigger_CaughtOffLimitsCD"




static func resetFlagsOnNewDay():
	GM.main.setFlag(Canteen_PlayerAteToday, false)
	
	var modules = GlobalRegistry.getModules()
	for moduleID in modules:
		var module = modules[moduleID]
		
		module.resetFlagsOnNewDay()
	
	TriggerCondition.onNewDay()

static func flag(type):
	return {
		"type": type,
	}

static func getFlags():
	return {
		"TestFlag": flag(FlagType.Bool),
		"Canteen_PlayerAteToday": flag(FlagType.Bool),
		"Mining_IntroducedToMinning": flag(FlagType.Bool),
		"Game_CompletedPrologue": flag(FlagType.Bool),
		"Game_PickedStartingPerks": flag(FlagType.Bool),
		"Player_Crime_Type": flag(FlagType.Number),
		"Trigger_CaughtOffLimitsCD": flag(FlagType.Number),
		
		
		# Cellblock module
		"Cellblock_FreeToPassCheckpoint": flag(FlagType.Bool),
		"Cellblock_CheckpointVisited": flag(FlagType.Bool),
		"Cellblock_GreenhouseLooted": flag(FlagType.Bool),
		"Cellblock_GreenhouseFoundChip": flag(FlagType.Bool),

		
		# Medical module
		"Eliza_IntroducedMedical": flag(FlagType.Bool),
		"Med_pcKnowsAboutWork": flag(FlagType.Bool),
		"Med_pcKnowsAboutBreeding": flag(FlagType.Bool),
		"Med_pcKnowsAboutTests": flag(FlagType.Bool),
		"Med_pcKnowsAboutMilking": flag(FlagType.Bool),
		"Med_milkingMilkFirstTime": flag(FlagType.Bool),
		"Med_milkingSeedFirstTime": flag(FlagType.Bool),

		"Med_milkMilked": flag(FlagType.Number),
		"Med_seedMilked": flag(FlagType.Number),
		"Med_milkedMilkTimes": flag(FlagType.Number),
		"Med_milkedSeedTimes": flag(FlagType.Number),
		
		"Med_wasMilkedToday": flag(FlagType.Bool),
		
		"Mental_PCBehavior": flag(FlagType.Number),
		"Mental_PCSanity": flag(FlagType.Number),
		"Mental_CheckupHappened": flag(FlagType.Bool),
		"Mental_ExperimentHappened": flag(FlagType.Bool),
		"Mental_ShowerHappened": flag(FlagType.Bool),
		
		"Mental_ExpObeyDrug": flag(FlagType.Number),
		"Mental_ExpTentacles": flag(FlagType.Number),
		
		"Mental_HasKeycard": flag(FlagType.Bool),
		"Mental_PlayerEscaped": flag(FlagType.Bool),
		
		"Nursery_Introduced": flag(FlagType.Bool),
		"Nursery_AskedHowWorks": flag(FlagType.Bool),
		"Nursery_AskedDatabase": flag(FlagType.Bool),
		
		
		# Nova module
		"Nova_GotHumiliatedByPC": flag(FlagType.Bool),
		"Nova_SawPC": flag(FlagType.Bool),
		"Nova_Introduced": flag(FlagType.Bool),
		"Nova_NotThereToday": flag(FlagType.Bool),
		"Nova_FirstTimePregnantHappened": flag(FlagType.Bool),
		"Nova_GaveBirthTimes": flag(FlagType.Number),
		
		
		# Rahi module
		"Rahi_Introduced": flag(FlagType.Bool),
		"Rahi_AskedName": flag(FlagType.Bool),
		"Rahi_GaveApple": flag(FlagType.Bool),
		"Rahi_CanteenSceneHappened": flag(FlagType.Bool),
		"Avy_WonCanteenFight": flag(FlagType.Bool),
		"Rahi_ChillWillHappen": flag(FlagType.Bool),
		"Rahi_ChillHappened": flag(FlagType.Bool),
		"Rahi_ChillCooldown": flag(FlagType.Number),
		"Rahi_Denied": flag(FlagType.Bool),
		"Rahi_ShowerHappened": flag(FlagType.Bool),
		"Rahi_NotThereToday": flag(FlagType.Bool),
		"Rahi_FirstTimePregnantHappened": flag(FlagType.Bool),
		"Rahi_GaveBirthTimes": flag(FlagType.Number),
		
		
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
		
		
		# Gym module
		"Gym_RishaLastDayGotPaid": flag(FlagType.Number),
		"Gym_BullyGangIntroduced": flag(FlagType.Bool),
		"Gym_BullyGangPayed": flag(FlagType.Bool),
	}
	
