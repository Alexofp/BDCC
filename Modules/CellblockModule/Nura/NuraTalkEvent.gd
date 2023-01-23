extends EventBase

func _init():
	id = "NuraTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "eng_robotics")

func react(_triggerID, _args):
	if(GM.main.getFlag("CellblockModule.FoundNura")):
		return false
	
	runScene("NuraFirstTimeScene")
	return true

func run(_triggerID, _args):
	if(GM.main.getFlag("CellblockModule.FoundNura")):
		saynn("Nur-A seems to be around")
		
		addButton("Nur-A", "Talk to the android", "nura")

func getPriority():
	return 100

func onButton(_method, _args):
	if(_method == "nura"):
		runScene("NuraTalkScene")
