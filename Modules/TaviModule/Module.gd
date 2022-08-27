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
		]
	characters = []
	items = []
	events = [
		"res://Modules/TaviModule/TaviTalkEvent.gd",
		"res://Modules/TaviModule/TaviFirstEncounterEvent.gd",
		
		"res://Modules/TaviModule/Quest2/TaviQuest2TalkEvent.gd",
		"res://Modules/TaviModule/Quest2/TaviQuest2SkarEvent.gd",
		"res://Modules/TaviModule/Quest2/TaviQuest2ElevatorEvent.gd",
		
		"res://Modules/TaviModule/ShowerEvent/TaviShowerEvent.gd",
	]
	quests = [
		"res://Modules/TaviModule/TaviAppleQuest.gd",
		"res://Modules/TaviModule/Quest2/TaviQuest2.gd",
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
