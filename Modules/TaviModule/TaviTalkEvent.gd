extends EventBase

func _init():
	id = "TaviTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "mining_taviroom")

func shouldRun():
	return GM.main.getFlag(TaviModule.Tavi_IntroducedTo)

func run(_args):
	pass
	
func delayedRun():
	saynn("You see Tavi sitting on a crate, away from everybody")
	addButtonUnlessLate("Tavi", "Talk to Tavi", "talk")

func shouldInterupt():
	return false

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		runScene("TaviTalkScene")
