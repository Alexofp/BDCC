extends EventBase

func _init():
	id = "SlutwallPlayerEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "fight_slutwall")
	
func run(_triggerID, _args):
	addButtonUnlessLate("Slutwall", "Let others use you! Can't get out freely so choose wisely!", "slutwall")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "slutwall"):
		GM.main.IS.startInteraction("InSlutwall", {inmate="pc"})
		#runScene("SlutwallPlayerScene")
