extends EventBase

func _init():
	id = "StocksSpankedByInmateEvent"

func registerTriggers(es):
	es.addTrigger(self, "StocksEvent")

func react(_triggerID, _args):
	runScene("StocksSpankedByInmate")
	return true

func getPriority():
	return 10

