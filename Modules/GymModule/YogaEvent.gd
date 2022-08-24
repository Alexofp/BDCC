extends EventBase

func _init():
	id = "YogaEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "gym_yoga")

func run(_triggerID, _args):
	addButtonUnlessLate("Yoga mats", "Did somebody say yoga", "yoga")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "yoga"):
		runScene("YogaScene")
