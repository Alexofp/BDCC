extends EventBase

func _init():
	id = "rahi1ElizaEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.WakeUpInCell)

func react(_triggerID, _args):
	if(getFlag("RahiModule.rahi1ElizaSceneHappened")):
		return false
	if(!getFlag("RahiModule.Rahi_ShowerHappened")):
		return false
	if(GM.pc.getLevel() < 3 || GM.main.getDays() < 10):
		return false
	if(RNG.chance(50)):
		setFlag("RahiModule.rahi1ElizaSceneHappened", true)
		runScene("rahi1ElizaScene")
		return true
	
	return false

func getPriority():
	return 5

