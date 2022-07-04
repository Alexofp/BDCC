extends EventBase

func _init():
	id = "RahiYogaEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.ApproachedYogaMats)

func shouldRun():
	return getFlag(RahiModule.Rahi_Introduced)

func run(_args):
	pass
	
func delayedRun():
	if(GM.main.getTime() <= 7*60*60):
		saynn("You notice a familliar kitty doing yoga")		
		
		addButtonUnlessLate("Rahi", "Spy on the kitty doing yoga", "rahi")
	else:
		addDisabledButton("Rahi", "Visit during early morning")

func shouldInterupt():
	return false

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "rahi"):
		runScene("RahiYogaScene")
