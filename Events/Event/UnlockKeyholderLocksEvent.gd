extends EventBase

func _init():
	id = "UnlockKeyholderLocksEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.DefeatedDynamicNPC)

func run(_triggerID, _args):
	var npcID = _args[0]
	#var character:DynamicCharacter = getCharacter(npcID)
	
	if(GM.pc.hasKeyholderLocksFrom(npcID)):
		addButton("Unique key", "Unlock your smart-locked restraints that were locked by this person", "dounlock", [npcID])

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "dounlock"):
		var npcID = _args[0]
		var _howMany = GM.pc.unlockAllKeyholderLocksFrom(npcID)
		
		if(_howMany > 0):
			addMessage("The key unlocked "+str(_howMany)+" restraint"+("s" if _howMany != 1 else ""))
