extends EventBase

func _init():
	id = "SlutwallPlayerEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "fight_slutwall")
	
func run(_triggerID, _args):
	addButtonUnlessLate("Slutwall", "Take a look at the slutwall", "slutwall")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "slutwall"):
		runScene("SlutwallPlayerScene")
