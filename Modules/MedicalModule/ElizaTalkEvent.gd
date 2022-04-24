extends EventBase

func _init():
	id = "ElizaTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "med_lobbymain")

func shouldRun():
	return true

func run(_args):
	pass
	
func delayedRun():
	if(GM.main.getFlag(MedicalModule.Mental_PlayerEscaped, false)):
		addDisabledButton("Dr. Quinn", "She is not here")
	else:
		saynn("A doctor is sitting behind the counter")
		addButtonUnlessLate("Dr. Quinn", "Talk to the doctor", "talk")

func shouldInterupt():
	return false

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		runScene("ElizaTalkScene")
