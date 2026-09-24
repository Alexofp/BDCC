extends EventBase

func _init():
	id = "DomLostToNpcEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.LostCaughtOffLimitsFight)

func react(_triggerID, _args):
	var _npcID:String = _args[0]
	var _charType:String = _args[1]
	
	if(GM.main.MS.isDoingMission("Mission1")):
		runScene("DomM1LostNpcFight")
		return true
	return false

func getPriority():
	return 10
