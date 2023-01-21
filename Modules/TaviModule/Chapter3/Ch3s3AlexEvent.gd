extends EventBase

func _init():
	id = "Ch3s3AlexEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "eng_airventskip")
	
func react(_triggerID, _args):
	if(GM.QS.isActive("Ch3TaviQuest") && !getFlag("TaviModule.ch3AlexHappened") && getFlag("TaviModule.ch3CompletedDoorHack")):
		setFlag("TaviModule.ch3AlexHappened", true)
		runScene("Ch3s3AlexScene")
		return true
		
func getPriority():
	return 100


