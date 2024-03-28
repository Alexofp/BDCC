extends EventBase

func _init():
	id = "SlaverySlutProstitutionWatchEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.SlaverySlutLookAtEvent)
	es.addTrigger(self, Trigger.SlaverySlutImportantEvent)


func react(_triggerID, _args):
	if(_triggerID == Trigger.SlaverySlutLookAtEvent):
		runScene("SlutProstitutionWatch", [_args[0]])
		return true
	
	if(_triggerID == Trigger.SlaverySlutImportantEvent):
		runScene("SlutProstitutionWatch", [_args[0], true])
		return true
	return false
	
func getPriority():
	return 10
