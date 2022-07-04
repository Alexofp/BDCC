extends EventBase

func _init():
	id = "YogaEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "gym_yoga")

func shouldRun():
	return true

func run(_args):
	pass
	
func delayedRun():
	addButtonUnlessLate("Yoga mats", "Did somebody say yoga", "yoga")

func shouldInterupt():
	return false

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "yoga"):
		runScene("YogaScene")
