extends Module
class_name RahiModule

const Rahi_Introduced = "Rahi_Introduced"
const Rahi_AskedName = "Rahi_AskedName"
const Rahi_GaveApple = "Rahi_GaveApple"
const Rahi_CanteenSceneHappened = "Rahi_CanteenSceneHappened"
const Avy_WonCanteenFight = "Avy_WonCanteenFight"

func _init():
	id = "RahiModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/RahiModule/RahiTalkScene.gd",
		"res://Modules/RahiModule/RahiAvyCanteenScene.gd",
		]
	characters = [
		"res://Modules/RahiModule/RahiCharacter.gd",
		"res://Modules/RahiModule/AvyCharacter.gd",
	]
	items = []
	events = [
		"res://Modules/RahiModule/RahiTalkEvent.gd",
		"res://Modules/RahiModule/RahiAvyCanteenEvent.gd",
	]
