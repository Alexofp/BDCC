extends EventBase

func _init():
	id = "TaviQuest2TalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "hall_mainentrance")

func run(_triggerID, _args):
	if(!GM.main.getModuleFlag("TaviModule", "Tavi_Quest2Started", false) || GM.main.getModuleFlag("TaviModule", "Tavi_Quest2MetHer", false)):
		return
	
	if(GM.main.getDays() > GM.main.getModuleFlag("TaviModule", "Tavi_Quest2Day", 0)):
		addButtonUnlessLate("Tavi", "Wait for Tavi to show up", "talk")
	else:
		addDisabledButton("Tavi", "Wait until tomorrow before doing this")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		runScene("TaviQuest2Meet")
