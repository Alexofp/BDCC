extends EventBase

func _init():
	id = "NovaFirstTimePregnantEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.WakeUpInCell)

func shouldRun():
	return !getFlag(NovaModule.Nova_FirstTimePregnantHappened, false) && GlobalRegistry.getCharacter("nova").isVisiblyPregnant()

func run(_args):
	setFlag(NovaModule.Nova_FirstTimePregnantHappened, true)
	runScene("NovaFirstTimePregnantScene")
	
	return true
	
func getPriority():
	return 11

