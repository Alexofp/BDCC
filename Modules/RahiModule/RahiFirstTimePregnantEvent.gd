extends EventBase

func _init():
	id = "RahiFirstTimePregnantEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_nearcells")
	es.addTrigger(self, Trigger.EnteringRoom, "main_bench2")

func shouldRun():
	return !getFlag(RahiModule.Rahi_FirstTimePregnantHappened, false) && GlobalRegistry.getCharacter("rahi").isVisiblyPregnant()

func run(_args):
	setFlag(RahiModule.Rahi_FirstTimePregnantHappened, true)
	runScene("RahiFirstTimePregnantScene")
	
	return true
	
func getPriority():
	return 11

