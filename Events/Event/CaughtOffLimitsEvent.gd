extends EventBase

func _init():
	id = "CaughtOffLimitsEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)

func shouldRun():
	return RNG.chance(30 + 10.0*GM.pc.getExposure()) && GM.world.getRoomByID(GM.pc.getLocation()).loctag_Greenhouses

func run(_args):
	return GM.ES.trigger(Trigger.CaughtOffLimits)
	
func delayedRun():
	pass
	
func shouldInterupt():
	return false

func getPriority():
	return 5

