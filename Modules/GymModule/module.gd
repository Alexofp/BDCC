extends Module
class_name GymModule

func _init():
	id = "GymModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/GymModule/LiftWeightsScene.gd",
		"res://Modules/GymModule/YogaScene.gd",
		"res://Modules/GymModule/RahiYogaScene.gd",
		]
	characters = []
	items = []
	events = [
		"res://Modules/GymModule/LiftWeightsEvent.gd",
		"res://Modules/GymModule/YogaEvent.gd",
		"res://Modules/GymModule/RahiYogaEvent.gd",
	]
	quests = [
	]

func resetFlagsOnNewDay():
	pass
