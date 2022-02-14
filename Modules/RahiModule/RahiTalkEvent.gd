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
	saynn("You see Rahi sitting on a bench")
	addButton("Rahi", "Talk to Rahi", "talk")

func shouldInterupt():
	return false

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		runScene("RahiTalkScene")
