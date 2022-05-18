extends EventBase

func _init():
	id = "NurseryTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "medical_nursery")

func shouldRun():
	return true

func run(_args):
	pass
	
func delayedRun():
	addButtonUnlessLate("Nurse", "Talk to the nurse", "talk")

func shouldInterupt():
	return false

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		runScene("NurseryTalkScene")
