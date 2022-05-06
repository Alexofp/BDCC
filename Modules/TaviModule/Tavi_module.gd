extends Module
class_name TaviModule

const Tavi_IntroducedTo = "Tavi_IntroducedTo"
const Tavi_IsAngryAtPlayer = "Tavi_IsAngryAtPlayer"
const Tavi_ToldHowToEscape = "Tavi_ToldHowToEscape"
const Tavi_NeedsApple = "Tavi_NeedsApple"
const Tavi_GotApple = "Tavi_GotApple"
const Tavi_AngryUntilDay = "Tavi_AngryUntilDay"
const Tavi_Submissiveness = "Tavi_Submissiveness"

const Tavi_Quest2Started = "Tavi_Quest2Started"
const Tavi_Quest2Day = "Tavi_Quest2Day"
const Tavi_Quest2MetHer = "Tavi_Quest2MetHer"
const Tavi_Quest2Completed = "Tavi_Quest2Completed"

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
		]
	characters = []
	items = []
	events = [
		"res://Modules/TaviModule/TaviTalkEvent.gd",
		"res://Modules/TaviModule/TaviFirstEncounterEvent.gd",
		
		"res://Modules/TaviModule/Quest2/TaviQuest2TalkEvent.gd",
		"res://Modules/TaviModule/Quest2/TaviQuest2SkarEvent.gd",
	]
	quests = [
		"res://Modules/TaviModule/TaviAppleQuest.gd",
		"res://Modules/TaviModule/Quest2/TaviQuest2.gd",
	]

func resetFlagsOnNewDay():
	pass

static func makeTaviAngry():
	GM.main.setFlag(Tavi_IsAngryAtPlayer, true)
	GM.main.setFlag(Tavi_AngryUntilDay, GM.main.getDays() + 2)
	
