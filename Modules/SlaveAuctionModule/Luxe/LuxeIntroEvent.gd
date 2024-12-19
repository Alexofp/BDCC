extends EventBase

func _init():
	id = "LuxeIntroEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "market_near_luxe")

func react(_triggerID, _args):
	if(getFlag("SlaveAuctionModule.beganAuctionOnce") && !getFlag("SlaveAuctionModule.luxeIntroHap")):
		setFlag("SlaveAuctionModule.luxeIntroHap", true)
		runScene("LuxeIntroScene")
		return true
	
func getPriority():
	return 10
