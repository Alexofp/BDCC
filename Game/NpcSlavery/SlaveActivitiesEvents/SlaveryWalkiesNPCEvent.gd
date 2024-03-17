extends EventBase

func _init():
	id = "SlaveryWalkiesNPCEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoomWithSlave)

func react(_triggerID, _args):
	if(_args.size() > 3 && _args[3] == "walkies"):
		if(RNG.chance(3)):
			runScene("SlaveryPetWalkiesAskPat", [_args[2]])
			return true
	return false
	
func getPriority():
	return 1
