extends EventBase

func _init():
	id = "NovaFirstTimePregnantEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.WakeUpInCell)

func react(_triggerID, _args):
	if(getFlag(NovaModule.Nova_FirstTimePregnantHappened, false) || !GlobalRegistry.getCharacter("nova").isVisiblyPregnant()):
		return false
	
	setFlag(NovaModule.Nova_FirstTimePregnantHappened, true)
	runScene("NovaFirstTimePregnantScene")
	
	return true
	
func getPriority():
	return 11

