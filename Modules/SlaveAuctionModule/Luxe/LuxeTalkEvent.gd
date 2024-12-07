extends EventBase

func _init():
	id = "LuxeTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "market_near_luxe")
	
func run(_triggerID, _args):
	if(getModule("SlaveAuctionModule").getRepLevel() >= 2):
		var r6out = getFlag("SlaveAuctionModule.r6outcome", "")
		if(r6out == "luxedead"):
			return
		
		addButton("Luxe", "Enter Luxe's office", "talkluxe")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talkluxe"):
		runScene("LuxeTalkScene")
