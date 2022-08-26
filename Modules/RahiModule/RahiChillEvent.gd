extends EventBase

func _init():
	id = "RahiChillEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_nearcells")

func react(_triggerID, _args):
	if(!getModuleFlag("RahiModule", "Rahi_ChillWillHappen")):
		return false
	
	setModuleFlag("RahiModule", "Rahi_ChillWillHappen", false)
	runScene("RahiChillScene")
	
	return true
	
func getPriority():
	return 5

