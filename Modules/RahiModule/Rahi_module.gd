extends Module
class_name RahiModule

const Rahi_Introduced = "Rahi_Introduced"
const Rahi_AskedName = "Rahi_AskedName"
const Rahi_GaveApple = "Rahi_GaveApple"
const Rahi_CanteenSceneHappened = "Rahi_CanteenSceneHappened"
const Avy_WonCanteenFight = "Avy_WonCanteenFight"
const Rahi_ChillWillHappen = "Rahi_ChillWillHappen"
const Rahi_ChillHappened = "Rahi_ChillHappened"
const Rahi_ChillCooldown = "Rahi_ChillCooldown"
const Rahi_Denied = "Rahi_Denied"
const Rahi_ShowerHappened = "Rahi_ShowerHappened"
const Rahi_NotThereToday = "Rahi_NotThereToday"

func _init():
	id = "RahiModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/RahiModule/RahiTalkScene.gd",
		"res://Modules/RahiModule/RahiAvyCanteenScene.gd",
		"res://Modules/RahiModule/RahiChillScene.gd",
		
		"res://Modules/RahiModule/ShowerEvent/RahiShowerScene.gd",
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
	]

func resetFlagsOnNewDay():
	if(getFlag(Rahi_NotThereToday, false)):
		setFlag(Rahi_NotThereToday, false)
	
	# Chill near waterfall event stuff
	if(!getFlag(Rahi_ChillHappened, false) && !getFlag(Rahi_Denied, false)):
		if(getFlag(Rahi_ChillCooldown, 0) > 0):
			increaseFlag(Rahi_ChillCooldown, -1)

		if(getFlag(Rahi_ChillCooldown, 0) == 0 && getFlag(Rahi_GaveApple, false)):
			setFlag(Rahi_ChillWillHappen, true)
			setFlag(Rahi_ChillCooldown, RNG.randi_range(1, 3))
		else:
			setFlag(Rahi_ChillWillHappen, false)
