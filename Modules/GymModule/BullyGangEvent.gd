extends EventBase

func _init():
	id = "BullyGangEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.ApproachedYogaMats)
	es.addTrigger(self, Trigger.ApproachedWeightsBench)

func react(_triggerID, _args):
	if(getModuleFlag("GymModule", "Gym_BullyGangPayed")):
		return false
		
	if(RNG.chance(50)):
		return false
	
	runScene("BullyGangScene")
	setModuleFlag("GymModule", "Gym_BullyGangPayed", true)
	return true

func getPriority():
	return 10
