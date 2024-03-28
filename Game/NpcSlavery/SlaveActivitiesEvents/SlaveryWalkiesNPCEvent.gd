extends EventBase

func _init():
	id = "SlaveryWalkiesNPCEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoomWithSlave)



func react(_triggerID, _args):
	if(getFlag("NpcSlaveryModule.pupEventCooldown", 0) > 0):
		increaseFlag("NpcSlaveryModule.pupEventCooldown", -1)
	elif(_args.size() > 3 && _args[3] == "walkies"):
		if(RNG.chance(5)):
			runScene("SlaveryPetWalkiesAskPat", [_args[2]])
			setFlag("NpcSlaveryModule.pupEventCooldown", 10)
			return true
	return false
	
func getPriority():
	return 1
