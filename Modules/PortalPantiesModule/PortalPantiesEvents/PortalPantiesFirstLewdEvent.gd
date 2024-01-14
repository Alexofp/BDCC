extends EventBase

func _init():
	id = "PortalPantiesFirstLewdEvent"

func registerTriggers(es):
	es.addTrigger(self, "PortalPantiesEvent")
	
func react(_triggerID, _args):
	var questIsCompleted = GM.QS.isCompleted("PortalPantiesQuest")
	
	if(getFlag("PortalPantiesModule.Panties_TestAmmount", 0) < 5 && !questIsCompleted):
		return false
	if(getFlag("PortalPantiesModule.Panties_FleshlightsGotStolen") && !questIsCompleted):
		return false
	
	if(RNG.chance(40) && GM.QS.isActive("PortalPantiesQuest")):
		increaseFlag("PortalPantiesModule.Panties_TestAmmount")
		setFlag("PortalPantiesModule.Panties_FleshlightsGotStolen", true)
		runScene("PortalPantiesFirstLewdScene")
		
		return true

	return false
	
func getPriority():
	return 100
