extends Module
class_name GymModule

const Gym_RishaLastDayGotPaid = "Gym_RishaLastDayGotPaid"

func _init():
	id = "GymModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/GymModule/LiftWeightsScene.gd",
		"res://Modules/GymModule/YogaScene.gd",
		"res://Modules/GymModule/RahiYogaScene.gd",
		"res://Modules/GymModule/RishaGymScene.gd",
		]
	characters = [
		"res://Modules/GymModule/GymBullyCharacter.gd",
		"res://Modules/GymModule/GymBully2Character.gd",
		"res://Modules/GymModule/GymBully3Character.gd",
	]
	items = []
	events = [
		"res://Modules/GymModule/LiftWeightsEvent.gd",
		"res://Modules/GymModule/YogaEvent.gd",
		"res://Modules/GymModule/RahiYogaEvent.gd",
		"res://Modules/GymModule/RishaGymEvent.gd",
	]
	quests = [
	]

func resetFlagsOnNewDay():
	pass
