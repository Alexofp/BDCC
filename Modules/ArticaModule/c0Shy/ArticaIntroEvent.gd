extends EventBase

func _init():
	id = "ArticaIntroEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "main_stairs_n")
	es.addTrigger(self, Trigger.EnteringRoom, "main_stairs1")
	es.addTrigger(self, Trigger.EnteringRoom, "main_stairs2")

func react(_triggerID, _args):
	if(getFlag("ArticaModule.s0happened", false)):
		return false
	if(GM.pc.getLevel() < 10):
		return false
	
	setFlag("ArticaModule.s0happened", true)
	runScene("articaS0IntakeScene")
	return true
	
func getPriority():
	return 1
