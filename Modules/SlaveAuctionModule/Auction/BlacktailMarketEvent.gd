extends EventBase

func _init():
	id = "BlacktailMarketEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "market_intro")
	es.addTrigger(self, Trigger.EnteringPlayerCell)
	
func run(_triggerID, _args):
	if(GM.pc.getLocation() == "market_intro"):
		addButton("Prison cell", "Teleport back to your prison cell", "exitsecure")
	
	if(true):
		if(GM.pc.getLocation() == GM.pc.getCellLocation()):
			addButton("Blacktail Market", "Teleport to the Blacktail Market", "entersecure")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "entersecure"):
		GM.pc.setLocation("market_intro")
		addMessage("You use your bluespace relay-tag to teleport to the Blacktail Market.")
		GM.main.reRun()
	if(_method == "exitsecure"):
		GM.pc.setLocation(GM.pc.getCellLocation())
		addMessage("You use the teleporter to teleport back to your cell.")
		GM.main.reRun()

