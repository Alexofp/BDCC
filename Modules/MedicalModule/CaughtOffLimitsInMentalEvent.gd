extends EventBase

func _init():
	id = "CaughtOffLimitsInMentalEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)

func shouldRun():
	if(!TriggerCondition.canTrigger(Trigger.CaughtOffLimits)):
		return false
	
	return RNG.chance(30 + 10.0*GM.pc.getExposure()) && GM.world.getRoomByID(GM.pc.getLocation()).loctag_MentalWard

func run(_args):
	#return GM.ES.trigger(Trigger.CaughtOffLimits)
	TriggerCondition.onTrigger(Trigger.CaughtOffLimits)
	runScene(RNG.pick([
		"NurseFelineOffLimits",
		]))
	return true
	
func delayedRun():
	pass
	
func shouldInterupt():
	return true

func getPriority():
	return 5

