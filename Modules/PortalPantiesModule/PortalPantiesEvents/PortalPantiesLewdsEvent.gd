extends EventBase

func _init():
	id = "PortalPantiesLewdsEvent"

func registerTriggers(es):
	es.addTrigger(self, "PortalPantiesEvent")
	es.addTrigger(self, "PortalPantiesSleepingEvent")
	es.addTrigger(self, "PortalPantiesShowerEvent")
	
func react(_triggerID, _args):
	if(!getFlag("PortalPantiesModule.Panties_FleshlightsGotStolen")):
		return false
	
	if(_triggerID == "PortalPantiesEvent"):
		runScene("PortalPantiesLewdsScene")
		
		return true
		
	if(_triggerID == "PortalPantiesSleepingEvent"):
		runScene("PortalPantiesSleepingLewdScene")
		
		return true
		
	if(_triggerID == "PortalPantiesShowerEvent"):
		runScene("PortalPantiesShowerLewdScene")
		
		return true
	
func getPriority():
	return 10
