extends EventBase

func _init():
	id = "EngineeringFindVisor"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "med_researchlab")
	
func run(_triggerID, _args):
	if(!getFlag("HypnokinkModule.GotEngineeringFreebieVisor")):
		saynn("One of the tables has something interesting on it.")
		
		addButton("Package", "There's a package in the corner", "take_freebie")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "take_freebie"):
		setFlag("HypnokinkModule.GotEngineeringFreebieVisor", true)
		runScene("GetEngineeringFreebieVisor")
