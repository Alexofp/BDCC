extends EventBase

func _init():
	id = "CaughtForcedStaffBJEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.MasturbationSpottedGuard)

func react(_triggerID, _args):
	runScene("CaughtForcedStaffBJ")
	return true

func getPriority():
	return 10

