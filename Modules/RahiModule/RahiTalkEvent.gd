extends EventBase

func _init():
	id = "RahiTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "main_bench2")

func shouldRun():
	return true

func run():
	pass
	
func delayedRun():
	if(!GM.main.getFlag(RahiModule.Rahi_Introduced)):
		saynn("You see some unknown feline sitting on a bench")
	else:
		saynn("You see the Kitty sitting on a bench")
	addButtonUnlessLate("Rahi", "Talk to the feline", "talk")

func shouldInterupt():
	return false

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		runScene("RahiTalkScene")
