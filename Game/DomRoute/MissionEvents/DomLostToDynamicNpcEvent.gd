extends EventBase

func _init():
	id = "DomLostToDynamicNpcEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.LostOrSurrenderedToDynamicNPC)

func react(_triggerID, _args):
	var _npcID:String = _args[0]
	var _charType:String = _args[1]
	
	if(_charType == CharacterType.Nurse && GM.main.MS.isDoingMission("Mission3")):
		runScene("DomM3LostNpcFight")
		return true
	
	return false

func getPriority():
	return 10
