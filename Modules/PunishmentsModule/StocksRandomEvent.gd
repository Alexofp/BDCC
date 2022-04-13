extends EventBase

func _init():
	id = "StocksRandomEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.StocksEvent)

func shouldRun():
	return true

func run(_args):
	runScene(RNG.pick(["StocksSpankedByInmate", "StocksMeetEliza", "StocksTinyMessages", "StocksTinyMessages"]))
	return true

func getPriority():
	return 5
