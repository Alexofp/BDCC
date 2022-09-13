extends EventBase

func _init():
	id = "PortalPantiesTestsEvent"

func registerTriggers(es):
	es.addTrigger(self, "PortalPantiesEvent")
	es.addTrigger(self, "PortalPantiesSleepingEvent")
	
func react(_triggerID, _args):
	if(_triggerID == "PortalPantiesEvent"):
		increaseFlag("PortalPantiesModule.Panties_TestAmmount")
		runScene("PortalPantiesFirstPokeScene")
		
		return true
		
	if(_triggerID == "PortalPantiesSleepingEvent" && getFlag("PortalPantiesModule.Panties_FirstTestHappened")):
		#increaseFlag("PortalPantiesModule.Panties_TestAmmount")
		runScene("PortalPantiesSleepTestsScene")
		
		return true
	
func getPriority():
	return 1
