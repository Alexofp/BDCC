extends EventBase

func _init():
	id = "CaughtFirstTimeEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.MasturbationSpottedInmate)
	es.addTrigger(self, Trigger.MasturbationSpottedGuard)

func react(_triggerID, _args):
	if(GM.main.getFlag("PunishmentsModule.FirstTimeCaughtMasturbating")):
		return
	
	if(_triggerID == Trigger.MasturbationSpottedInmate):
		runScene("CaughtFirstTimeInmate")
	if(_triggerID == Trigger.MasturbationSpottedGuard):
		runScene("CaughtFirstTimeStaff")
	
	GM.main.setFlag("PunishmentsModule.FirstTimeCaughtMasturbating", true)
	return true

func getPriority():
	return 100000
