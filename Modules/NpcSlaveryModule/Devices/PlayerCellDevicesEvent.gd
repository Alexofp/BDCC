extends EventBase

func _init():
	id = "PlayerCellDevicesEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringPlayerCell)

func run(_triggerID, _args):
	if(getFlag("NpcSlaveryModule.hasSybian")):
		addButton("Sybian", "Ride your sybian sex machine", "sybian")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "sybian"):
		runScene("SybianRidingScene")
