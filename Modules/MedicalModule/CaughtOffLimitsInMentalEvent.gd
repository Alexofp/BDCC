extends EventBase

func _init():
	id = "CaughtOffLimitsInMentalEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)

func react(_triggerID, _args):
	if(GM.main.getFlag("Trigger_CaughtOffLimitsCD", 0) > 0):
		return
	
	if(!RNG.chance(30 + 10.0*GM.pc.getExposure()) || !GM.world.getRoomByID(GM.pc.getLocation()).loctag_MentalWard):
		return false
	
	GM.main.setFlag("Trigger_CaughtOffLimitsCD", 3)
	runScene(RNG.pick([
		"NurseFelineOffLimits",
		]))
	return true

func getPriority():
	return 5

