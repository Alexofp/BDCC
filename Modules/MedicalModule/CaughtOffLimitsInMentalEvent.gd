extends EventBase

func _init():
	id = "CaughtOffLimitsInMentalEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)

func react(_triggerID, _args):
	if(!TriggerCondition.canTrigger(Trigger.CaughtOffLimits)):
		return false
	
	if(!RNG.chance(30 + 10.0*GM.pc.getExposure()) || !GM.world.getRoomByID(GM.pc.getLocation()).loctag_MentalWard):
		return false
	
	#return GM.ES.trigger(Trigger.CaughtOffLimits)
	TriggerCondition.onTrigger(Trigger.CaughtOffLimits)
	runScene(RNG.pick([
		"NurseFelineOffLimits",
		]))
	return true

func getPriority():
	return 5

