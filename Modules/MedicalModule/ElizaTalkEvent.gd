extends EventBase

func _init():
	id = "ElizaTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "med_lobbymain")

func run(_triggerID, _args):
	if(GM.main.getModuleFlag("MedicalModule", "Mental_PlayerEscaped", false)):
		addDisabledButton("Dr. Quinn", "She is not here")
	else:
		saynn("A doctor is sitting behind the counter")
		addButtonUnlessLate("Dr. Quinn", "Talk to the doctor", "talk")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		runScene("ElizaTalkScene")
