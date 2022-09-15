extends EventBase

func _init():
	id = "PortalPantiesFirstLewdEvent"

func registerTriggers(es):
	es.addTrigger(self, "PortalPantiesEvent")
	
func react(_triggerID, _args):
	if(getFlag("PortalPantiesModule.Panties_TestAmmount", 0) < 10):
		return false
	if(getFlag("PortalPantiesModule.Panties_FleshlightsGotStolen")):
		return false
	
	if(RNG.chance(40)):
		increaseFlag("PortalPantiesModule.Panties_TestAmmount")
		setFlag("PortalPantiesModule.Panties_FleshlightsGotStolen", true)
		runScene("PortalPantiesFirstLewdScene")
		
		return true

	return false
	
func getPriority():
	return 100
