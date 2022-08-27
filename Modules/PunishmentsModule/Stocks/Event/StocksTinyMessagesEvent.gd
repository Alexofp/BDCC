extends EventBase

func _init():
	id = "StocksTinyMessagesEvent"

func registerTriggers(es):
	es.addTrigger(self, "StocksEvent")

func react(_triggerID, _args):
	runScene("StocksTinyMessages")
	return true

func getPriority():
	return 10

