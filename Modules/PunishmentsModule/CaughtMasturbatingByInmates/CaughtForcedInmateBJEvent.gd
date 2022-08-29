extends EventBase

func _init():
	id = "CaughtForcedInmateBJEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.MasturbationSpottedInmate)

func react(_triggerID, _args):
	runScene("CaughtForcedInmateBJ")
	return true

func getPriority():
	return 10

