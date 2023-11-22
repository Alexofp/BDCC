extends EventBase

func _init():
	id = "AlexRynardTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "eng_workshop")
	
func run(_triggerID, _args):
	if(getFlag("PortalPantiesModule.Alex_FirstTimeTalked")):
		if(checkCharacterBusy("AlexRynardBusy", "Seems like Alex is not here", "Alex")):
			return
	
		if(getFlag("PortalPantiesModule.Alex_BusyDays", 0) > 0):
			addDisabledButton("Alex", "He is not here today")
		else:
			addButtonUnlessLate("Alex", "Talk to the foxy", "alex")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "alex"):
		runScene("AlexRynardTalkScene")
