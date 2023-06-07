extends EventBase

func _init():
	id = "AvySlutwallEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "fight_slutwall")
	
func run(_triggerID, _args):
	if(!getFlag("FightClubModule.AvyIsInSlutwall")):
		return
		
	addButton("Avy", "Look at Avy who is stuck in the slutwall", "avy")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "avy"):
		runScene("AvySlutwallScene")
