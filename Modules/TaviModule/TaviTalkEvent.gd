extends EventBase

func _init():
	id = "TaviTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "mining_taviroom")

func run(_triggerID, _args):
	if(!GM.main.getModuleFlag("TaviModule", "Tavi_IntroducedTo")):
		return
	
	if(checkCharacterBusy("TaviBusy", "Seems like Tavi is not here", "Tavi")):
		return
	
	saynn("You see Tavi sitting on a crate, away from everybody.")
	addButtonUnlessLate("Tavi", "Talk to Tavi", "talk")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		runScene("TaviTalkScene")
