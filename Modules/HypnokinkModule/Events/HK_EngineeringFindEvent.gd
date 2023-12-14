extends EventBase

func _init():
	id = "HK_EngineeringFindVisor"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "eng_workshop")
	
func run(_triggerID, _args):
	if(not GM.main.getFlag("HypnokinkModule.GotEngineeringFreebieVisor", false)):
		addButton("What's this?", "There's a package in the corner", "take_freebie")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "take_freebie"):
		setFlag("HypnokinkModule.GotEngineeringFreebieVisor", true)
		runScene("HK_GetEngineeringFreebieVisor")
