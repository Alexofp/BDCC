extends EventBase

func _init():
	id = "rahiGivingBirthEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, ["rahi"])
	es.addTrigger(self, Trigger.TalkingToNPC, ["rahiSlavery"])

func react(_triggerID, _args):
	if(!getCharacter("rahi").isReadyToGiveBirth()):
		return false
	
	if(!getFlag("RahiModule.Rahi_FirstTimeBirthHappened")):
		setFlag("RahiModule.Rahi_FirstTimeBirthHappened", true)
		runScene("rahiGivingBirthFirstTimeScene")
	else:
		runScene("rahiGivingBirthScene")
	return true

func getPriority():
	return 10
