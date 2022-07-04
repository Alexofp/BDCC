extends EventBase

func _init():
	id = "LiftWeightsEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "gym_weights")

func shouldRun():
	return true

func run(_args):
	pass
	
func delayedRun():
	addButtonUnlessLate("Lift weights", "Approach one of the benches", "benches")

func shouldInterupt():
	return false

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "benches"):
		runScene("LiftWeightsScene")
