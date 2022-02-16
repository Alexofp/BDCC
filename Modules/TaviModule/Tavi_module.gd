extends Module
class_name TaviModule

const Tavi_IntroducedTo = "Tavi_IntroducedTo"
const Tavi_IsAngryAtPlayer = "Tavi_IsAngryAtPlayer"
const Tavi_ToldHowToEscape = "Tavi_ToldHowToEscape"
const Tavi_NeedsApple = "Tavi_NeedsApple"
const Tavi_GotApple = "Tavi_GotApple"

func _init():
	id = "TaviModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/TaviModule/TaviFirstEncounterScene.gd",
		"res://Modules/TaviModule/TaviTalkScene.gd",
		]
	characters = []
	items = []
	events = [
		"res://Modules/TaviModule/TaviTalkEvent.gd",
		"res://Modules/TaviModule/TaviFirstEncounterEvent.gd",
	]
	quests = [
		"res://Modules/TaviModule/TaviAppleQuest.gd",
	]
