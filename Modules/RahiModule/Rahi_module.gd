extends Module
class_name RahiModule

const Rahi_Introduced = "Rahi_Introduced"
const Rahi_AskedName = "Rahi_AskedName"

func _init():
	id = "RahiModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/RahiModule/RahiTalkScene.gd",
		]
	characters = [
		"res://Modules/RahiModule/RahiCharacter.gd",
	]
	items = []
	events = [
		"res://Modules/RahiModule/RahiTalkEvent.gd",
	]
