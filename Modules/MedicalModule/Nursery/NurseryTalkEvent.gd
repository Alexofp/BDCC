extends EventBase

func _init():
	id = "NurseryTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "medical_nursery")

func run(_triggerID, _args):
	saynn("The nurse behind the counter flicks her gaze towards you as you enter, but quickly returns to her work. Presumably if you had something important, you could just ask or tell her.")
	addButtonUnlessLate("Nurse", "Talk to the nurse", "talk")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		runScene("NurseryTalkScene")
