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
		"res://Modules/PunishmentsModule/StocksAvyForcedVaginalAnal.gd",
		"res://Modules/PunishmentsModule/StocksNovaRishaForcedVagOrAnal.gd",
		]
	characters = [
		
	]
	items = []
	events = [
	]

func getRandomSceneFor(sceneType):
	var result = []
	if(sceneType == RandomSceneType.StocksEscape):
		result.append_array([["StocksEscape", 10.0]])
	if(sceneType == RandomSceneType.StocksEvent):
		result.append_array([["StocksSpankedByInmate", 10.0], ["StocksMeetEliza", 10.0], ["StocksTinyMessages", 10.0], ["StocksTinyMessages", 10.0]])
	if(sceneType == RandomSceneType.StocksWillingSex):
		result.append_array([["StocksRishaBlowjob", 10.0]])
	if(sceneType == RandomSceneType.StocksUnWillingSex):
		result.append_array([["StocksNovaRishaForcedVagOrAnal", 10.0]])
		if(GM.pc.hasVagina()):
			result.append_array([["StocksAvyForcedVaginalAnal", 10.0]])
		
	return result
