extends Module
class_name AngelModule


func _init():
	id = "AngelModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/AngelModule/CaughtOffLimitsByAngelScene.gd",
		"res://Modules/AngelModule/HumiliateAngelScene.gd",
		"res://Modules/AngelModule/RideSubbyAngelScene.gd",
		"res://Modules/AngelModule/SuckAngelCockScene.gd",
		]
	characters = [
		"res://Modules/AngelModule/AngelCharacter.gd",
	]
	items = []
	events = [
		"res://Modules/AngelModule/AngelCatchesPlayerOffLimitsEvent.gd",
	]
