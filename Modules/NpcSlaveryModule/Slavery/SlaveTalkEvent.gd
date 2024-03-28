extends EventBase

func _init():
	id = "SlaveTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringPlayerCell)

func run(_triggerID, _args):
	if(getModule("NpcSlaveryModule").hasSlaves()):
		addButton(("(!) " if getModule("NpcSlaveryModule").slavesHaveAnyEvents() else "")+"Slaves", "Check your slaves", "checkslaves")

func getPriority():
	return 11

func onButton(_method, _args):
	if(_method == "checkslaves"):
		runScene("SlavesCheckScene")
