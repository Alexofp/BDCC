extends EventBase

func _init():
	id = "RahiFirstTimePregnantEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_nearcells")
	es.addTrigger(self, Trigger.EnteringRoom, "main_bench2")

func react(_triggerID, _args):
	if(getModuleFlag("RahiModule", "Rahi_FirstTimePregnantHappened", false) || !GlobalRegistry.getCharacter("rahi").isVisiblyPregnant()):
		return false
	
	setModuleFlag("RahiModule", "Rahi_FirstTimePregnantHappened", true)
	runScene("RahiFirstTimePregnantScene")
	
	return true
	
func getPriority():
	return 11

