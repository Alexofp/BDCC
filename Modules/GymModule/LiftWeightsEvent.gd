extends EventBase

func _init():
	id = "LiftWeightsEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "gym_weights")

func run(_triggerID, _args):
	addButtonUnlessLate("Lift weights", "Approach one of the benches", "benches")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "benches"):
		runScene("LiftWeightsScene")
