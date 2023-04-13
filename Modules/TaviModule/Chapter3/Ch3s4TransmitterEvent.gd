extends EventBase

func _init():
	id = "Ch3s4TransmitterEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "eng_neartransmitter")
	es.addEventCheck(self, "TaviBusy")
	
func react(_triggerID, _args):
	if(GM.QS.isActive("Ch3TaviQuest") && getFlag("TaviModule.ch3AlexHappened") && !getFlag("TaviModule.ch3EnteredTransmitter")):
		setFlag("TaviModule.ch3EnteredTransmitter", true)
		runScene("Ch3s4TransmitterScene")
		return true
		
func getPriority():
	return 100

func eventCheck(_checkID, _args = []):
	if(GM.QS.isActive("Ch3TaviQuest") && getFlag("TaviModule.ch3AlexHappened") && !getFlag("TaviModule.ch3EnteredTransmitter")):
		return {busy=true}
