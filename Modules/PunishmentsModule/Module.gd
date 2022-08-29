extends Module
class_name PunishmentsModule


func _init():
	id = "PunishmentsModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/PunishmentsModule/Stocks/StocksPunishmentScene.gd",
		"res://Modules/PunishmentsModule/Stocks/TryStocksScene.gd",
		
		"res://Modules/PunishmentsModule/Stocks/Willing/StocksRishaBlowjob.gd",
		"res://Modules/PunishmentsModule/Stocks/UnWilling/StocksAvyForcedVaginalAnal.gd",
		"res://Modules/PunishmentsModule/Stocks/UnWilling/StocksNovaRishaForcedVagOrAnal.gd",
		
		"res://Modules/PunishmentsModule/Stocks/Escape/StocksEscape.gd",
		"res://Modules/PunishmentsModule/Stocks/Escape/TaviStocksEscape.gd",
		"res://Modules/PunishmentsModule/Stocks/Event/StocksMeetEliza.gd",
		"res://Modules/PunishmentsModule/Stocks/Event/StocksSpankedByInmate.gd",
		"res://Modules/PunishmentsModule/Stocks/Event/StocksTinyMessages.gd",
		
		"res://Modules/PunishmentsModule/CaughtMasturbatingByInmates/CaughtForcedInmateBJ.gd",
		]
	characters = [
		
	]
	items = []
	events = [
		"res://Modules/PunishmentsModule/Stocks/Willing/StocksRishaBlowjobEvent.gd",
		"res://Modules/PunishmentsModule/Stocks/UnWilling/StocksAvyForcedVaginalAnalEvent.gd",
		"res://Modules/PunishmentsModule/Stocks/UnWilling/StocksNovaRishaForcedVagOrAnalEvent.gd",
		"res://Modules/PunishmentsModule/Stocks/Escape/StocksEscapeEvent.gd",
		"res://Modules/PunishmentsModule/Stocks/Escape/TaviStocksEscapeEvent.gd",
		"res://Modules/PunishmentsModule/Stocks/Event/StocksMeetElizaEvent.gd",
		"res://Modules/PunishmentsModule/Stocks/Event/StocksSpankedByInmateEvent.gd",
		"res://Modules/PunishmentsModule/Stocks/Event/StocksTinyMessagesEvent.gd",
		
		"res://Modules/PunishmentsModule/CaughtMasturbatingByInmates/CaughtForcedInmateBJEvent.gd",
	]

func registerEventTriggers():
	GM.ES.registerEventTrigger("StocksEscape", EventTriggerWeighted.new())
	GM.ES.registerEventTrigger("StocksEvent", EventTriggerWeighted.new())
	GM.ES.registerEventTrigger("StocksWillingSex", EventTriggerWeighted.new())
	GM.ES.registerEventTrigger("StocksUnWillingSex", EventTriggerWeighted.new())
