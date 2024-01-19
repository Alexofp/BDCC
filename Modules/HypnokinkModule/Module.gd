extends Module

func getFlags():
	return {
		"SoftOptIn": flag(FlagType.Bool),
		
		"VisorXpToday": flag(FlagType.Number),
		
		"GotEngineeringFreebieVisor": flag(FlagType.Bool),
		
		"DidVionGlance": flag(FlagType.Bool),
		"DidVionIntroduction": flag(FlagType.Bool),
		
		"VionTopicKnown_NoSex": flag(FlagType.Bool),
		"VionTopicKnown_Backstory": flag(FlagType.Bool),
		"VionTopicKnown_Services": flag(FlagType.Bool),
		"VionTopicKnown_Hypnotist": flag(FlagType.Bool),
		"VionTopicKnown_Chastity": flag(FlagType.Bool),
		
		"Vion_HaveDatapad": flag(FlagType.Bool),
		"Vion_HaveCage": flag(FlagType.Bool),
		
		"VionMode": flag(FlagType.Number),
		"Vion_FreedFromCage": flag(FlagType.Bool),
		
		"DidSessionZero": flag(FlagType.Bool),
		
		"LastSessionTime": flag(FlagType.Number),
		
		"FreebieSessionSample": flag(FlagType.Bool),
		"OnTheHouseSessions": flag(FlagType.Number),
		"RushSubdued": flag(FlagType.Bool),
		
		"KnowAboutRush": flag(FlagType.Bool),
		"DidRushIntroduction": flag(FlagType.Bool),
		"RushDealStruckAtLeastOnce": flag(FlagType.Bool),
		"RushCausingMoreTrouble": flag(FlagType.Bool),
		
		"HypnoEncounterCooldown": flag(FlagType.Number),
	}

func _init():
	id = "HypnokinkModule"
	author = "PTS"
	
	attacks = [
		"res://Modules/HypnokinkModule/Attacks/HK_ReciteMantra.gd",
		
		"res://Modules/HypnokinkModule/Attacks/HK_TriggerKneel.gd",
		"res://Modules/HypnokinkModule/Attacks/HK_TriggerPleasure.gd",
		"res://Modules/HypnokinkModule/Attacks/HK_TriggerStun.gd",
		"res://Modules/HypnokinkModule/Attacks/HK_TriggerTiredness.gd",
	]
	computers = [
		"res://Modules/HypnokinkModule/Scenes/HK_DatapadHackComputer.gd"
	]
	scenes = [
		"res://Modules/HypnokinkModule/Scenes/Items/HK_HypnoCuffs.gd",
		"res://Modules/HypnokinkModule/Scenes/Items/HK_ProgramVisor.gd",
		
		"res://Modules/HypnokinkModule/Scenes/HK_GetEngineeringFreebieVisor.gd",
		
		"res://Modules/HypnokinkModule/Scenes/HK_Alex_TalkAboutVion.gd",
		"res://Modules/HypnokinkModule/Scenes/HK_Alex_GiveCage.gd",
		
		"res://Modules/HypnokinkModule/Scenes/HK_RushIntroduction.gd",
		"res://Modules/HypnokinkModule/Scenes/HK_RushRepeatConversation.gd",
		"res://Modules/HypnokinkModule/Scenes/HK_VionSolvesRush.gd",
		
		"res://Modules/HypnokinkModule/Scenes/HK_VionGlance.gd",
		"res://Modules/HypnokinkModule/Scenes/HK_VionIntroduction.gd",
		"res://Modules/HypnokinkModule/Scenes/HK_VionRepeatConversation.gd",
		"res://Modules/HypnokinkModule/Scenes/HK_VionSessionSelect.gd",
		"res://Modules/HypnokinkModule/Scenes/HK_VionFreed.gd",
		
		"res://Modules/HypnokinkModule/Scenes/Sessions/Inductions/HK_Induction_AlreadyHypnotized.gd",
		"res://Modules/HypnokinkModule/Scenes/Sessions/Inductions/HK_Induction_FirstTime.gd",
		"res://Modules/HypnokinkModule/Scenes/Sessions/Inductions/HK_Induction_Rapid.gd",
		"res://Modules/HypnokinkModule/Scenes/Sessions/Inductions/HK_Induction_Flashlight.gd",
		"res://Modules/HypnokinkModule/Scenes/Sessions/Inductions/HK_Induction_Pendulum.gd",
		
		"res://Modules/HypnokinkModule/Scenes/Sessions/Bodies/HK_Body_SessionZero.gd",
		"res://Modules/HypnokinkModule/Scenes/Sessions/Bodies/HK_Body_DodgeBuff.gd",
		"res://Modules/HypnokinkModule/Scenes/Sessions/Bodies/HK_Body_MaxPainBuff.gd",
		"res://Modules/HypnokinkModule/Scenes/Sessions/Bodies/HK_Body_StaminaRestore.gd",
		"res://Modules/HypnokinkModule/Scenes/Sessions/Bodies/HK_Body_Bondage.gd",
		
		"res://Modules/HypnokinkModule/Scenes/Sessions/Awakeners/HK_Awakener_Simple.gd",
		"res://Modules/HypnokinkModule/Scenes/Sessions/Awakeners/HK_Awakener_FakeWake.gd",
		
		"res://Modules/HypnokinkModule/Scenes/Encounters/HK_HypnoEncounterStart.gd",
		"res://Modules/HypnokinkModule/Scenes/Encounters/HK_HypnoEncounterKneel.gd",
		"res://Modules/HypnokinkModule/Scenes/Encounters/HK_HypnoEncounterFetch.gd",
		"res://Modules/HypnokinkModule/Scenes/Encounters/HK_HypnoEncounterDoll.gd",
		]
	characters = [
		"res://Modules/HypnokinkModule/Characters/HK_Vion.gd",
		"res://Modules/HypnokinkModule/Characters/HK_Rush.gd",
	]
	items = [
		"res://Modules/HypnokinkModule/Items/Glasses/HK_Glasses.gd",
		
		"res://Modules/HypnokinkModule/Items/HypnoVisor/HK_HypnovisorMk0.gd",
		
		"res://Modules/HypnokinkModule/Items/HypnoRestraints/HK_ImaginaryWristCuffs.gd",
		"res://Modules/HypnokinkModule/Items/HypnoRestraints/HK_ImaginaryAnkleCuffs.gd",
	]
	events = [
		"res://Modules/HypnokinkModule/Events/HK_AlexDealEvent.gd",
		
		"res://Modules/HypnokinkModule/Events/HK_RushMeetingEvent.gd",
		"res://Modules/HypnokinkModule/Events/HK_VionMeetingEvent.gd",
		
		"res://Modules/HypnokinkModule/Events/HK_HypnoEncounterInmateEvent.gd",
		"res://Modules/HypnokinkModule/Events/HK_HypnoEncounterStartEvent.gd",
		
		"res://Modules/HypnokinkModule/Events/HK_EngineeringFindEvent.gd",
		"res://Modules/HypnokinkModule/Events/HK_VionGlanceEvent.gd"
	]
	quests = [
		"res://Modules/HypnokinkModule/Quests/HK_DealingWithRush.gd"
	]
	skills = [
		"res://Modules/HypnokinkModule/Skills/HK_HypnosisSkill.gd",
	]
	buffs = [
	]
	statusEffects = [
		"res://Modules/HypnokinkModule/StatusEffects/HK_Suggestible.gd",
		"res://Modules/HypnokinkModule/StatusEffects/HK_UnderHypnosis.gd",
		
		"res://Modules/HypnokinkModule/StatusEffects/HK_HypnoVisorActive.gd",
		"res://Modules/HypnokinkModule/StatusEffects/HK_HypnoVisorProgramming.gd",
		
		"res://Modules/HypnokinkModule/StatusEffects/HK_MantraUsed.gd",
		"res://Modules/HypnokinkModule/StatusEffects/HK_ImplantedPosthypnoticTrigger.gd",
		"res://Modules/HypnokinkModule/StatusEffects/HK_PosthypnoticTriggerUsedUp.gd",
	]
	perks = [
		"res://Modules/HypnokinkModule/Perks/HK_T1B1_MantraMinded.gd",
		"res://Modules/HypnokinkModule/Perks/HK_T1B2_FastAsleep.gd",
		"res://Modules/HypnokinkModule/Perks/HK_T1B3_HATS.gd",
		
		"res://Modules/HypnokinkModule/Perks/HK_T2B1_Detachment.gd",
		"res://Modules/HypnokinkModule/Perks/HK_T2B2_AmateurHypnotist.gd",
		"res://Modules/HypnokinkModule/Perks/HK_T2B3_GoodAtVisors.gd",
		
		"res://Modules/HypnokinkModule/Perks/HK_T3B1_LucidTrance.gd",
		"res://Modules/HypnokinkModule/Perks/HK_T3B2_HypnoticAllure.gd",
		"res://Modules/HypnokinkModule/Perks/HK_T3B3_VisorMastery.gd",
		
		"res://Modules/HypnokinkModule/Perks/HK_D1_Keywords.gd",
		"res://Modules/HypnokinkModule/Perks/HK_D2_Famous.gd",
		"res://Modules/HypnokinkModule/Perks/HK_D3_DeepTrance.gd",
	]
	fetishes = [
		"res://Modules/HypnokinkModule/SexEngine/Fetish/HK_HypnosisHypnotist.gd",
		"res://Modules/HypnokinkModule/SexEngine/Fetish/HK_HypnosisSubject.gd",
	]
	sexGoals = [
		"res://Modules/HypnokinkModule/SexEngine/Goals/HK_Hypnotize.gd",
	]
	sexActivities = [
		"res://Modules/HypnokinkModule/SexEngine/Activities/HK_Hypnotize.gd",
	]
	stageScenes = [
		"res://Modules/HypnokinkModule/StageScenes/HK_ArmsRaisedDuo.tscn",
		"res://Modules/HypnokinkModule/StageScenes/HK_ArmsRaisedSex.tscn",
		"res://Modules/HypnokinkModule/StageScenes/HK_DuoHypnoTied.tscn"
	]
	speechModifiers = [
		"res://Modules/HypnokinkModule/Speech/HK_HypnoSpeech.gd"
	]
	
func resetFlagsOnNewDay():
	setFlag("HypnokinkModule.VisorXpToday", 0)
	
func registerEventTriggers():
	GM.ES.registerEventTrigger("HypnoEncounter", EventTriggerWeighted.new())
