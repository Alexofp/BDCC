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
	setFlag("RahiModule.rahi1ElizaSceneHappened", true)
	runScene("rahi1ElizaScene")
	return true

func getPriority():
	return 5

