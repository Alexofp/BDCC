extends Module
class_name GymModule

const ModID = "GymModule"

const Gym_RishaLastDayGotPaid = "Gym_RishaLastDayGotPaid"
const Gym_BullyGangIntroduced = "Gym_BullyGangIntroduced"
const Gym_BullyGangPayed = "Gym_BullyGangPayed"

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
	if(GM.main.getModuleFlag(ModID, Gym_BullyGangPayed)):
		GM.main.setModuleFlag(ModID, Gym_BullyGangPayed, false)
