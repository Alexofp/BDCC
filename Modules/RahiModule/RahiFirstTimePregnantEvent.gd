extends EventBase

func _init():
	id = "RahiFirstTimePregnantEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_nearcells")
	es.addTrigger(self, Trigger.EnteringRoom, "main_bench2")
	es.addTrigger(self, Trigger.TalkingToNPC, ["rahiSlavery"])

func react(_triggerID, _args):
	if(getFlag("RahiModule.Rahi_FirstTimePregnantHappened", false) || !getCharacter("rahi").isVisiblyPregnantFromPlayer()):
		return false
	if(getCharacter("rahi").isReadyToGiveBirth()):
		return false
	
	setFlag("RahiModule.Rahi_FirstTimePregnantHappened", true)
	runScene("RahiFirstTimePregnantScene")
	
	return true
	
func getPriority():
	return 11

