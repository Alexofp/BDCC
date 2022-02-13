extends Module
class_name TaviModule

const Tavi_IntroducedTo = "Tavi_IntroducedTo"

func _init():
	id = "TaviModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/TaviModule/TaviFirstEncounterScene.gd",
		]
	characters = []
	items = []
	events = [
		"res://Modules/TaviModule/TestEvent2.gd",
		"res://Modules/TaviModule/TaviFirstEncounterEvent.gd",
	]
