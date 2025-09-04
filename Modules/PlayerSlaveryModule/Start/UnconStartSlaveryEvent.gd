extends EventBase

func _init():
	id = "UnconStartSlaveryEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.UnconsciousPCGrabbed)

func getPriority():
	return 1.0

func react(_triggerID, _args):
	runScene(getModule("PlayerSlaveryModule").getSlaveryStartScene())
	return true
