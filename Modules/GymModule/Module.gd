extends Module
class_name GymModule

func getFlags():
	return {
		# Gym module
		"Gym_RishaLastDayGotPaid": flag(FlagType.Number),
		"Gym_BullyGangIntroduced": flag(FlagType.Bool),
		"Gym_BullyGangPayed": flag(FlagType.Bool),
	}

func _init():
	id = "GymModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/GymModule/LiftWeightsScene.gd",
		"res://Modules/GymModule/YogaScene.gd",
		"res://Modules/GymModule/RahiYogaScene.gd",
		"res://Modules/GymModule/RishaGymScene.gd",
		"res://Modules/GymModule/BullyGangScene.gd",
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
		"res://Modules/GymModule/BullyGangEvent.gd",
	]
	quests = [
	]

func resetFlagsOnNewDay():
	if(GM.main.getModuleFlag("GymModule", "Gym_BullyGangPayed")):
		GM.main.setModuleFlag("GymModule", "Gym_BullyGangPayed", false)
