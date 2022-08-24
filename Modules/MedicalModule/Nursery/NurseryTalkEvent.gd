extends EventBase

func _init():
	id = "NurseryTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "medical_nursery")

func run(_triggerID, _args):
	addButtonUnlessLate("Nurse", "Talk to the nurse", "talk")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		runScene("NurseryTalkScene")
