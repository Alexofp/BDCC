extends EventBase

func _init():
	id = "PortalPantiesTestsEvent"

func registerTriggers(es):
	es.addTrigger(self, "PortalPantiesEvent")
	
func react(_triggerID, _args):
	increaseFlag("PortalPantiesModule.Panties_TestAmmount")
	runScene("PortalPantiesFirstPokeScene")
	
	return true
	
func getPriority():
	return 1
