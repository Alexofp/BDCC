extends EventBase

func _init():
	id = "Ch2EnterCorridorEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "eng_bay_corridor")
	es.addTrigger(self, Trigger.EnteringRoom, "eng_bay_nearbreakroom")
	
func run(_triggerID, _args):
	if(GM.pc.getLocation() != "eng_bay_corridor"):
		addButton("Corridor", "Leave the secure corridor", "exitsecure")
	
	if(GM.QS.isCompleted("Ch2AlexQuest") || getFlag("AlexRynardModule.ch2CanEnterEngineering")):
		if(GM.pc.getLocation() == "eng_bay_corridor"):
			addButton("Corridor", "Enter the secure corridor", "entersecure")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "entersecure"):
		GM.pc.setLocation("eng_bay_nearbreakroom")
		GM.main.reRun()
	if(_method == "exitsecure"):
		GM.pc.setLocation("eng_bay_corridor")
		GM.main.reRun()

