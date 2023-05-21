extends EventBase

func _init():
	id = "rahiGivingBirthEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, ["rahi"])
	es.addTrigger(self, Trigger.TalkingToNPC, ["rahiSlavery"])

func react(_triggerID, _args):
	if(getFlag("RahiModule.Rahi_FirstTimeBirthHappened")):
		return false
	if(!getCharacter("rahi").isReadyToGiveBirth()):
		return false
	
	setFlag("RahiModule.Rahi_FirstTimeBirthHappened", true)
	runScene("rahiGivingBirthFirstTimeScene")
	return true

func getPriority():
	return 10
