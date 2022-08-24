extends EventBase

func _init():
	id = "RahiShowerEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TakingAShower)

func run(_triggerID, _args):
	if(!getFlag(RahiModule.Rahi_ChillHappened) || getFlag(RahiModule.Rahi_Denied) || getFlag(RahiModule.Rahi_NotThereToday)):
		return
	
	saynn("You notice that the familiar kitty with brown fur is taking a shower here too.")
	addButtonUnlessLate("Rahi", "Approach the kitty", "talk")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		setFlag(RahiModule.Rahi_ShowerHappened, true)
		setFlag(RahiModule.Rahi_NotThereToday, true)
		runScene("RahiShowerScene")
