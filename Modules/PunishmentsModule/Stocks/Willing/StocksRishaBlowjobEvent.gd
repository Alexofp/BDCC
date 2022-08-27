extends EventBase

func _init():
	id = "StocksRishaBlowjobEvent"

func registerTriggers(es):
	es.addTrigger(self, "StocksWillingSex")

func react(_triggerID, _args):
	runScene("StocksRishaBlowjob")
	return true

func getPriority():
	return 10

