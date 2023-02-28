extends EventBase

func _init():
	id = "AlexRynardTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "eng_workshop")
	
func run(_triggerID, _args):
	if(checkCharacterBusy("AlexRynardBusy", "Seems like Alex is not here", "Alex")):
		return
	
	if(getFlag("PortalPantiesModule.Alex_FirstTimeTalked")):
		addButtonUnlessLate("Alex", "Talk to the foxy", "alex")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "alex"):
		runScene("AlexRynardTalkScene")
