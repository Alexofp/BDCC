extends EventBase

func _init():
	id = "StocksEscapeEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.StocksEscape)

func shouldRun():
	return true

func run(_args):
	runScene("StocksEscape")
	return true

func getPriority():
	return 5
