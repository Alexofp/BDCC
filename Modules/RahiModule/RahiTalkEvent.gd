extends EventBase

func _init():
	id = "RahiTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "main_bench2")

func run(_triggerID, _args):
	if(checkCharacterBusy("RahiBusy", "Seems like the kitty is not here", "Rahi")):
		return
	
	if(getModuleFlag("RahiModule", "Rahi_NotThereToday", false)):
		saynn("Seems like the kitty is not here")
		
		addDisabledButton("Rahi", "She is not here today")
		return
	
	if(!getModuleFlag("RahiModule", "Rahi_Introduced")):
		saynn("You see some unknown feline sitting on a bench")
	else:
		saynn("You see the Kitty sitting on a bench")
	addButtonUnlessLate("Rahi", "Talk to the feline", "talk")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		runScene("RahiTalkScene")
