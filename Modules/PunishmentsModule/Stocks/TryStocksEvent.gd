extends EventBase

func _init():
	id = "TryStocksEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "main_punishment_spot")

func run(_triggerID, _args):
	addButtonUnlessLate("Try stocks", "Stick your head into them out of curiosity", "stocks")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "stocks"):
		runScene("TryStocksScene")
