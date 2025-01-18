extends EventBase

func _init():
	id = "ChemistryLabEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "med_researchlab")

func run(_triggerID, _args):
	# Scream at me if I will forget to remove || true
	if(getFlag("ElizaModule.firstDrugTestHappened") || true):
		addButton("Lab", "Look at the lab", "lab")
	
func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "lab"):
		runScene("ChemistryLabScene")
