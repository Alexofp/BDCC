extends Module
class_name PunishmentsModule


func _init():
	id = "PunishmentsModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/PunishmentsModule/StocksPunishmentScene.gd",
		"res://Modules/PunishmentsModule/TryStocksScene.gd",
		"res://Modules/PunishmentsModule/StocksEscape.gd",
		"res://Modules/PunishmentsModule/StocksSpankedByInmate.gd",
		"res://Modules/PunishmentsModule/StocksMeetEliza.gd",
		"res://Modules/PunishmentsModule/StocksTinyMessages.gd",
		"res://Modules/PunishmentsModule/StocksRishaBlowjob.gd",
		]
	characters = [
		
	]
	items = []
	events = [
	]

func getRandomSceneFor(sceneType):
	if(sceneType == RandomSceneType.StocksEscape):
		return [["StocksEscape", 10.0]]
	if(sceneType == RandomSceneType.StocksEvent):
		return [["StocksSpankedByInmate", 10.0], ["StocksMeetEliza", 10.0], ["StocksTinyMessages", 10.0], ["StocksTinyMessages", 10.0]]
	if(sceneType == RandomSceneType.StocksWillingSex):
		return [["StocksRishaBlowjob", 10.0]]
		
	return []
