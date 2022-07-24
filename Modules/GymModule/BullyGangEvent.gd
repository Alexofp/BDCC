extends EventBase

func _init():
	id = "BullyGangEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.ApproachedYogaMats)
	es.addTrigger(self, Trigger.ApproachedWeightsBench)

func shouldRun():
	if(getModuleFlag(GymModule.ModID, GymModule.Gym_BullyGangPayed)):
		return false
	
	return RNG.chance(50)

func run(_args):
	runScene("BullyGangScene")
	setModuleFlag(GymModule.ModID, GymModule.Gym_BullyGangPayed, true)

func shouldInterupt():
	return true

func getPriority():
	return 10
