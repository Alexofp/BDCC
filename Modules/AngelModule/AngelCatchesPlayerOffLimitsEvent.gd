extends EventBase

func _init():
	id = "AngelCatchesPlayerOffLimitsEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.CaughtOffLimits)

func shouldRun():
	return true

func run():
	runScene("CaughtOffLimitsByAngelScene")
	return true

func shouldInterupt():
	return true

func getPriority():
	return 10
