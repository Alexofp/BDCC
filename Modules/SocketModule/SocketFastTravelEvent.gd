extends EventBase

func _init():
	id = "SocketFastTravelEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringPlayerCell)

func run(_triggerID, _args):
	if(!getFlag("SocketModule.h2completed")):
		return

	if(getModule("SocketModule").hasAnyVentsUnlocked()):
		addButtonUnlessLate("Vents", "See where you can get to through quickly", "fasttravel")

func getPriority():
	return 11

func onButton(_method, _args):
	if(_method == "fasttravel"):
		runScene("SocketFastTravelScene")
