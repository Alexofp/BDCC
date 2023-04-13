extends EventBase

func _init():
	id = "RahiShowerEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TakingAShower)

func run(_triggerID, _args):
	if(!getModuleFlag("RahiModule", "Rahi_ChillHappened") || getModuleFlag("RahiModule", "Rahi_Denied") || getModuleFlag("RahiModule", "Rahi_NotThereToday")):
		return
	
	if(doEventCheck("RahiBusy") != null):
		return
	
	saynn("You notice that the familiar kitty with brown fur is taking a shower here too.")
	addButtonUnlessLate("Rahi", "Approach the kitty", "talk")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		setModuleFlag("RahiModule", "Rahi_ShowerHappened", true)
		setModuleFlag("RahiModule", "Rahi_NotThereToday", true)
		runScene("RahiShowerScene")
