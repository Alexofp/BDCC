extends EventBase

func _init():
	id = "TaviQuest2TalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "hall_mainentrance")

func shouldRun():
	return GM.main.getFlag(TaviModule.Tavi_Quest2Started, false) && !GM.main.getFlag(TaviModule.Tavi_Quest2MetHer, false)

func run(_args):
	pass
	
func delayedRun():
	if(GM.main.getDays() > GM.main.getFlag(TaviModule.Tavi_Quest2Day, 0)):
		addButtonUnlessLate("Tavi", "Wait for Tavi to show up", "talk")
	else:
		addDisabledButton("Tavi", "Wait until tomorrow before doing this")

func shouldInterupt():
	return false

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		runScene("TaviQuest2Meet")
