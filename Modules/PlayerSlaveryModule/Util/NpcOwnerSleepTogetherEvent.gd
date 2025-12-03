extends EventBase

func _init():
	id = "NpcOwnerSleepTogetherEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.SleepInCell)

func react(_triggerID, _args):
	var possible:Array = []
	for charID in GM.main.RS.special:
		var theSpecial:SpecialRelationshipBase = GM.main.RS.special[charID]
		if(theSpecial.id != "SoftSlavery"):
			continue
		var theNpcOwner:NpcOwnerBase = theSpecial.npcOwner
		if(!theNpcOwner):
			continue
		if(theNpcOwner.checkShouldSleepTogether()):
			possible.append(charID)
	
	if(possible.empty()):
		return false
	runScene("NpcOwnerSleepTogetherScene", [RNG.pick(possible)])
	return true

func getPriority():
	return 10

