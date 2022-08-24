extends EventBase

func _init():
	id = "NovaCatchesPlayerOffLimitsEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.CaughtStealingInGreenhouse)

func react(_triggerID, _args):
	runScene("CaughtOffLimitsByNovaScene")
	return true

func shouldInterupt():
	return true

func getPriority():
	return 10
