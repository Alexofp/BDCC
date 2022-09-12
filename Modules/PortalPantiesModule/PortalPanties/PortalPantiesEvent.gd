extends EventBase

func _init():
	id = "PortalPantiesEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)
	
func react(_triggerID, _args):
	if(!GM.pc.isWearingPortalPanties()):
		return false
	
	if(_triggerID == Trigger.EnteringRoom):
		
		#Replace me with cooldown?
		if(RNG.chance(10)):
			return GM.ES.triggerReact("PortalPantiesEvent")
	
	return false
	
	
func getPriority():
	return 5
