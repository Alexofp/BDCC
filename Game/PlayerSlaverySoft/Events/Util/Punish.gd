extends NpcOwnerEventBase

func _init():
	id = "Punish"

func onStart(_args:Array):
	setState("start")
	
	if(checkProtect("You were about to be punished by your owner..")):
		return
	
	if(!checkRunPunish()):
		endEvent()

func start_eventResult(_event, _tag:String, _args:Array):
	if(_tag == "protect"):
		if(!checkRunPunish()):
			endEvent()
		return
	endEvent()

func checkRunPunish() -> bool:
	if(checkSubEvent(E_PUNISH, "", [], true)):
		var theOwner := getNpcOwner()
		if(theOwner):
			theOwner.onPunish()
		return true
	return false
