extends EventBase

func _init():
	id = "EnterMedicalEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "med_lobbynw")
	es.addTrigger(self, Trigger.EnteringRoom, "med_lobbyne")

func run(_triggerID, _args):
	# Scream at me if I will forget to remove || true
	if(getFlag("ElizaModule.firstDrugTestHappened") || true):
		addButton("Enter", "Enter the medical block", "enter")
	
func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "enter"):
		if(GM.pc.getLocation() == "med_lobbynw"):
			GM.pc.setLocation("med_staffonly_door1")
		else:
			GM.pc.setLocation("med_staffonly_door2")
		GM.main.reRun()
