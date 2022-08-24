extends EventBase

func _init():
	id = "RahiChillEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_nearcells")

func react(_triggerID, _args):
	if(!getFlag(RahiModule.Rahi_ChillWillHappen)):
		return false
	
	setFlag(RahiModule.Rahi_ChillWillHappen, false)
	runScene("RahiChillScene")
	
	return true
	
func getPriority():
	return 5

