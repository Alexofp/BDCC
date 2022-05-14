extends EventBase

func _init():
	id = "RahiShowerEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TakingAShower)

func shouldRun():
	return getFlag(RahiModule.Rahi_ChillHappened, false) && !getFlag(RahiModule.Rahi_Denied, false) && !getFlag(RahiModule.Rahi_NotThereToday, false)

func run(_args):
	pass
	
func delayedRun():
	saynn("You notice that the familiar kitty with brown fur is taking a shower here too.")
	addButtonUnlessLate("Rahi", "Approach the kitty", "talk")

func shouldInterupt():
	return false

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		setFlag(RahiModule.Rahi_ShowerHappened, true)
		setFlag(RahiModule.Rahi_NotThereToday, true)
		runScene("RahiShowerScene")
