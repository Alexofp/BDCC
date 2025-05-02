extends EventBase

func _init():
	id = "NurseryBountyBoardEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "medical_nursery")

func run(_triggerID, _args):
	if(getFlag("ElizaModule.s0hap")):
		addButtonUnlessLate("Bounty board", "Look at the bounty board", "board")
	else:
		addDisabledButton("Bounty board", "You don't have access to this.. Maybe someone here can give it to you?")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "board"):
		runScene("NurseryBountyBoardScene")
