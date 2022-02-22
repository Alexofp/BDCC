extends EventBase

func _init():
	id = "NovaCatchesPlayerOffLimitsEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.CaughtOffLimits)

func shouldRun():
	return true

func run():
	runScene("CaughtOffLimitsByNovaScene")
	return true

func shouldInterupt():
	return true

func getPriority():
	return 10
