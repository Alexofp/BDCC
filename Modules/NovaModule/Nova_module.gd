extends Module
class_name NovaModule


func _init():
	id = "NovaModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/NovaModule/CaughtOffLimitsByNovaScene.gd",
		"res://Modules/NovaModule/HumiliateNovaScene.gd",
		"res://Modules/NovaModule/RideSubbyNovaScene.gd",
		"res://Modules/NovaModule/SuckNovaCockScene.gd",
		"res://Modules/NovaModule/FuckSubbyNovaScene.gd"
		]
	characters = [
		"res://Modules/NovaModule/NovaCharacter.gd",
	]
	items = []
	events = [
		"res://Modules/NovaModule/NovaCatchesPlayerOffLimitsEvent.gd",
	]
