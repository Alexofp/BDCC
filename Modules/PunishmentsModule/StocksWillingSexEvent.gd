extends EventBase

func _init():
	id = "StocksWillingSexEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.StocksWillingSex)

func shouldRun():
	return true

func run(_args):
	runScene(RNG.pick(["StocksRishaBlowjob"]))
	return true

func getPriority():
	return 5
