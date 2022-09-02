extends EventBase

func _init():
	id = "CaughtForcedInmateSpitroastEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.MasturbationSpottedInmate)

func react(_triggerID, _args):
	runScene("CaughtForcedInmateSpitroast")
	return true

func getPriority():
	return 10

