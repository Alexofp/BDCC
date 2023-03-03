extends Module
class_name RahiModule

func getFlags():
	return {
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
		
		"rahi1ElizaSceneHappened": flag(FlagType.Bool),
		"rahi1ProtectedRahi": flag(FlagType.Bool),
		"rahi2SceneHappened": flag(FlagType.Bool),
		"rahi2Denied": flag(FlagType.Bool),
		"rahi2SpilledBottle": flag(FlagType.Bool),
		"rahi2KissedRahi": flag(FlagType.Bool),
		"rahi2WonGuard": flag(FlagType.Bool),
		"rahi3SceneHappened": flag(FlagType.Bool),
		"rahi3DayHappened": flag(FlagType.Number),
		"rahi4SceneHappened": flag(FlagType.Bool),
		"rahi4DayHappened": flag(FlagType.Number),
		"rahi4SaidFix": flag(FlagType.Bool),
		"rahi5SceneHappened": flag(FlagType.Bool),
		
		"rahiSlaveryDidTaskToday": flag(FlagType.Bool),
		"rahiPCName": flag(FlagType.Text),
		"rahiSlaveryStage": flag(FlagType.Number),
		
		# Mood stuff (can go up and down)
		"rahiObedience": flag(FlagType.Number), # raised by d/s actions/choices
		"rahiAffection": flag(FlagType.Number), # raised by love actions
		"rahiAddiction": flag(FlagType.Number), # lowers if you deny Rahi from drinking
		"rahiUnfair": flag(FlagType.Number), # raises if you punish Rahi for no reason
		"rahiSpoiled": flag(FlagType.Number), # raises if you reward Rahi for no reason
		"rahiTired": flag(FlagType.Number), # If tired = must let her sleep
		
		"rahiPunishPoints": flag(FlagType.Number),
		"rahiRewardPoints": flag(FlagType.Number),
		# unspent points will go to unfair or spoiled scores
		
		"rahiPickedSkills": flag(FlagType.Dict), # picked skills might add tasks
		"rahiTalkedTopics": flag(FlagType.Dict),
		
		"rahiSkillVaginal": flag(FlagType.Number),
		"rahiSkillAnal": flag(FlagType.Number),
		"rahiSkillOral": flag(FlagType.Number),
		# Optional skills
		"rahiSkillMasochist": flag(FlagType.Number),
		"rahiSkillExhibit": flag(FlagType.Number),
		"rahiSkillPetplay": flag(FlagType.Number),
		"rahiSkillDominance": flag(FlagType.Number),
		"rahiSkillProstitution": flag(FlagType.Number),
		"rahiSkillWatersports": flag(FlagType.Number),
	}

func _init():
	id = "RahiModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/RahiModule/RahiTalkScene.gd",
		"res://Modules/RahiModule/RahiAvyCanteenScene.gd",
		"res://Modules/RahiModule/RahiChillScene.gd",
		
		"res://Modules/RahiModule/ShowerEvent/RahiShowerScene.gd",
		
		"res://Modules/RahiModule/RahiFirstTimePregnantScene.gd",
		"res://Modules/RahiModule/RahiEmbraceScene.gd",
		
		"res://Modules/RahiModule/1PreSlavery/rahi1ElizaScene.gd",
		"res://Modules/RahiModule/1PreSlavery/rahi2RahiScene.gd",
		"res://Modules/RahiModule/1PreSlavery/rahi3RahiPassOutScene.gd",
		"res://Modules/RahiModule/1PreSlavery/rahi4BreakdownScene.gd",
		"res://Modules/RahiModule/1PreSlavery/rahi5SlaveryStartScene.gd",
		
		"res://Modules/RahiModule/2Slavery/rahiSlaveryMorningScene.gd",
		"res://Modules/RahiModule/2Slavery/rahiSlaveryPickTaskScene.gd",
		"res://Modules/RahiModule/2Slavery/rahiSlaveryTalkScene.gd",
		"res://Modules/RahiModule/2Slavery/rahiSlaveryTalkAnythingScene.gd",
		"res://Modules/RahiModule/2Slavery/Tasks/rahiSlaveryCleaningTaskScene.gd",
		]
	characters = [
		"res://Modules/RahiModule/RahiCharacter.gd",
		"res://Modules/RahiModule/AvyCharacter.gd",
	]
	items = []
	events = [
		"res://Modules/RahiModule/RahiTalkEvent.gd",
		"res://Modules/RahiModule/RahiAvyCanteenEvent.gd",
		"res://Modules/RahiModule/RahiChillEvent.gd",
		
		"res://Modules/RahiModule/ShowerEvent/RahiShowerEvent.gd",
		
		"res://Modules/RahiModule/RahiFirstTimePregnantEvent.gd",
		
		"res://Modules/RahiModule/1PreSlavery/rahi1ElizaEvent.gd",
		"res://Modules/RahiModule/1PreSlavery/rahi2RahiEvent.gd",
		"res://Modules/RahiModule/1PreSlavery/rahi3RahiPassOutEvent.gd",
		"res://Modules/RahiModule/1PreSlavery/rahi4BreakdownEvent.gd",
		"res://Modules/RahiModule/2Slavery/rahiSlaveryTalkEvent.gd",
	]
	quests = [
		"res://Modules/RahiModule/RahiSlaveryQuest.gd",
	]

func resetFlagsOnNewDay():
	if(getFlag("RahiModule.rahiSlaveryDidTaskToday", false)):
		setFlag("RahiModule.rahiSlaveryDidTaskToday", false)
	
	if(GM.main.getModuleFlag("RahiModule", "Rahi_NotThereToday", false)):
		GM.main.setModuleFlag("RahiModule", "Rahi_NotThereToday", false)
	
	# Chill near waterfall event stuff
	if(!GM.main.getModuleFlag("RahiModule", "Rahi_ChillHappened", false) && !GM.main.getModuleFlag("RahiModule", "Rahi_Denied", false)):
		if(GM.main.getModuleFlag("RahiModule", "Rahi_ChillCooldown", 0) > 0):
			GM.main.increaseModuleFlag("RahiModule", "Rahi_ChillCooldown", -1)

		if(GM.main.getModuleFlag("RahiModule", "Rahi_ChillCooldown", 0) == 0 && GM.main.getModuleFlag("RahiModule", "Rahi_GaveApple", false)):
			GM.main.setModuleFlag("RahiModule", "Rahi_ChillWillHappen", true)
			GM.main.setModuleFlag("RahiModule", "Rahi_ChillCooldown", RNG.randi_range(1, 3))
		else:
			GM.main.setModuleFlag("RahiModule", "Rahi_ChillWillHappen", false)

static func trustsPC():
	return GM.main.getModuleFlag("RahiModule", "Rahi_ShowerHappened", false)
