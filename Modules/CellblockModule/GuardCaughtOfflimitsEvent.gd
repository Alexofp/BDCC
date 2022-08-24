extends EventBase

func _init():
	id = "GuardCaughtOfflimitsEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.CaughtOffLimits)

func react(_triggerID, _args):
	runScene(RNG.pick([
		"MaleGuardCanineOffLimits",
		"FemaleGuardFelineOffLimits",
		]))
	return true

func getPriority():
	return 10
