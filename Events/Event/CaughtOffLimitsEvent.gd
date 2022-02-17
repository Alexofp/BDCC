extends EventBase

func _init():
	id = "CaughtOffLimitsEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)

func shouldRun():
	return RNG.chance(1) && GM.world.getRoomByID(GM.pc.getLocation()).loctag_Greenhouses

func run():
	GM.ES.trigger(Trigger.CaughtOffLimits)
	pass
	#runScene("FightScene", ["risha"], "rishafight")
	
func delayedRun():
	saynn("You got caught")
	
func shouldInterupt():
	return true

func getPriority():
	return 5

