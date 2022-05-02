extends EventBase

func _init():
	id = "CaughtOffLimitsEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)

func shouldRun():
	
	if(GM.world.getRoomByID(GM.pc.getLocation()).loctag_Greenhouses):
		return RNG.chance(30 + 10.0*GM.pc.getExposure())
		
	if(GM.world.getRoomByID(GM.pc.getLocation()).loctag_GuardsEncounter):
		return RNG.chance(30 + 10.0*GM.pc.getExposure())
		
	return false

func run(_args):
	return GM.ES.trigger(Trigger.CaughtOffLimits)
	
func delayedRun():
	pass
	
func shouldInterupt():
	return false

func getPriority():
	return 5

