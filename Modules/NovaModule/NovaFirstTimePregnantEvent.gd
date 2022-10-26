extends EventBase

func _init():
	id = "NovaFirstTimePregnantEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.WakeUpInCell)

func react(_triggerID, _args):
	if(GM.main.getModuleFlag("NovaModule", "Nova_FirstTimePregnantHappened", false) || !GlobalRegistry.getCharacter("nova").isVisiblyPregnantFromPlayer()):
		return false
	
	GM.main.setModuleFlag("NovaModule", "Nova_FirstTimePregnantHappened", true)
	runScene("NovaFirstTimePregnantScene")
	
	return true
	
func getPriority():
	return 11

