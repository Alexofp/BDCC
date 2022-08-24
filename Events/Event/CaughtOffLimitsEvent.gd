extends EventBase

func _init():
	id = "CaughtOffLimitsEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)

func react(_triggerID, _args):
	if(GM.main.getFlag("Trigger_CaughtOffLimitsCD", 0) > 0):
		GM.main.increaseFlag("Trigger_CaughtOffLimitsCD", -1)
		return
	
	if(GM.world.getRoomByID(GM.pc.getLocation()).loctag_Greenhouses):
		if(RNG.chance(30 + 10.0*GM.pc.getExposure())):
			GM.main.setFlag("Trigger_CaughtOffLimitsCD", 3)
			
			return GM.ES.triggerReact(Trigger.CaughtOffLimits)
		
	if(GM.world.getRoomByID(GM.pc.getLocation()).loctag_GuardsEncounter):
		if(RNG.chance(30 + 10.0*GM.pc.getExposure())):
			GM.main.setFlag("Trigger_CaughtOffLimitsCD", 3)
			return GM.ES.triggerReact(Trigger.CaughtOffLimits)
		
	return false

func getPriority():
	return 5
