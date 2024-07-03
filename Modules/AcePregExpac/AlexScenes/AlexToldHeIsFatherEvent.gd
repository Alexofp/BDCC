extends EventBase
#ACEPREGEXPAC - Add this Event
func _init():
	id = "AlexIsTheFatherEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, ["alexrynard"])

func react(_triggerID, _args):
	if(!getModuleFlag("AcePregExpac", "Alex_ToldIsFather", 1)) || !GM.pc.isHeavilyPregnant():
		return false
	
	setModuleFlag("AcePregExpac", "Alex_ToldIsFather", 0)
	runScene("TellAlexHeIsFatherScene")
	
	return true

func getPriority():
	return 10
