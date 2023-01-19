extends EventBase

func _init():
	id = "EngineeringLoreComputerEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "eng_lorecomputerroom")

func run(_triggerID, _args):
	addButtonWithChecks("Computer", "Take a seat and check the computer", "computer", [], [ButtonChecks.NotBlindfolded, ButtonChecks.NotHandsBlocked])

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "computer"):
		runScene("EngineeringLoreComputerScene")
		
