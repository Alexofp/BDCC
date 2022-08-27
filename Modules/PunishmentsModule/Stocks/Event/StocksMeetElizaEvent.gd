extends EventBase

func _init():
	id = "StocksMeetElizaEvent"

func registerTriggers(es):
	es.addTrigger(self, "StocksEvent")

func react(_triggerID, _args):
	runScene("StocksMeetEliza")
	return true

func getPriority():
	return 10

