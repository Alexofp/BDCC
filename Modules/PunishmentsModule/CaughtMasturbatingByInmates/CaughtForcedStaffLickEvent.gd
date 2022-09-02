extends EventBase

func _init():
	id = "CaughtForcedStaffLickEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.MasturbationSpottedGuard)

func react(_triggerID, _args):
	runScene("CaughtForcedStaffLick")
	return true

func getPriority():
	return 10

