extends Module
class_name PunishmentsModule


func _init():
	id = "PunishmentsModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/PunishmentsModule/StocksPunishmentScene.gd",
		"res://Modules/PunishmentsModule/TryStocksScene.gd",
		"res://Modules/PunishmentsModule/StocksEscape.gd",
		]
	characters = [
		
	]
	items = []
	events = [
		"res://Modules/PunishmentsModule/StocksEscapeEvent.gd",
	]
