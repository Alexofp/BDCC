extends EventBase

func _init():
	id = "DomCaughtOffLimitsEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.CaughtOffLimitsByDynamicNPC)

func run(_triggerID, _args):
	var _npcID:String = _args[0]
	var _charType:String = _args[1]
	
	if(GM.main.MS.isDoingMission("Mission4")):
		addButton("Avy", "Let Avy handle this", "m4avy", [_npcID])


func getPriority():
	return 10

func onButton(_method, _args):
	if(_method == "m4avy"):
		GM.main.IS.stopInteractionsForPawnID("pc")
		runScene("DomM4s2LetAvyFightNurse", [_args[0]])
