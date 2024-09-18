extends EventBase

func _init():
	id = "ProstitutionStartEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "main_hallroom5")
	es.addTrigger(self, Trigger.EnteringRoom, "main_hallroom4")
	es.addTrigger(self, Trigger.EnteringRoom, "fight_wall_east")

func run(_triggerID, _args):
	saynn("This seems like a spot where all the sluts hang out..")
	addButtonUnlessLate("Prostitution", "Try to offer your body and earn some credits..", "start")

func getPriority():
	return 6

func onButton(_method, _args):
	if(_method == "start"):
		GM.main.IS.startInteraction("Prostitution", {main="pc"})
		
