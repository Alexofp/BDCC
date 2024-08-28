extends EventBase

func _init():
	id = "UnconRandomSpotEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.UnconsciousPCGrabbed)

func getPriority():
	return 1.0

func react(_triggerID, _args):
	if(RNG.chance(80)):
		runScene("UnconRandomSpotScene")
	else:
		runScene("UnconToStocksScene")
	return true
