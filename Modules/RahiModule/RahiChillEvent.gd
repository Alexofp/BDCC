extends EventBase

func _init():
	id = "RahiChillEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_nearcells")

func shouldRun():
	return getFlag(RahiModule.Rahi_ChillWillHappen)

func run(_args):
	setFlag(RahiModule.Rahi_ChillWillHappen, false)
	runScene("RahiChillScene")
	
	return true
	
func getPriority():
	return 5

