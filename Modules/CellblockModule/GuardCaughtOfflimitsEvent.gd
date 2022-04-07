extends EventBase

func _init():
	id = "GuardCaughtOfflimitsEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.CaughtOffLimits)

func shouldRun():
	return true

func run(_args):
	runScene(RNG.pick([
		"MaleGuardCanineOffLimits",
		"FemaleGuardFelineOffLimits",
		]))
	return true

func getPriority():
	return 10
