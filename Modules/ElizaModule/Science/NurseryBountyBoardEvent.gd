extends EventBase

func _init():
	id = "NurseryBountyBoardEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "medical_nursery")

func run(_triggerID, _args):
	addButtonUnlessLate("Bounty board", "Look at the bounty board", "board")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "board"):
		runScene("NurseryBountyBoardScene")
