extends EventBase

func _init():
	id = "Ch2a2CorridorEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "eng_bay_corridor")
	
func run(_triggerID, _args):
	if(GM.QS.isActive("Ch2AlexQuest") && getFlag("TaviModule.ch2AlexTalkedTo") && !getFlag("TaviModule.ch2AlexCapturedSpying")):
		addButtonUnlessLate("Corridor", "Is this the right corridor?", "startch2quest")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "startch2quest"):
		runScene("Ch2a2CorridorScene")
		setFlag("TaviModule.ch2AlexCapturedSpying", true)

