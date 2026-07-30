extends EventBase

func _init():
	id = "DomM1LostToNpcEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.LostCaughtOffLimitsFight)

func react(_triggerID, _args):
	if(!GM.main.MS.isDoingMission("Mission1")):
		return false
	
	runScene("DomM1LostNpcFight")
	return true

func getPriority():
	return 10
