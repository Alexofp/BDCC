extends EventBase

func _init():
	id = "StocksEscapeEvent"

func registerTriggers(es):
	es.addTrigger(self, "StocksEscape")

func react(_triggerID, _args):
	runScene("StocksEscape")
	return true

func getPriority():
	return 10

