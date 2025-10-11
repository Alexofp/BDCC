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
	var theOwner := getNpcOwner()
	if(!theOwner):
		return false
	
	var thePunishAmount:int = theOwner.getPunishAmount()
	var theTag := E_PUNISH_WEAK
	if(thePunishAmount <= 1):
		theTag = E_PUNISH_WEAK
	elif(thePunishAmount == 2):
		theTag = E_PUNISH_STRONG
	else:
		theTag = E_PUNISH_GET_RID_OF
	
	if(checkSubEvent(theTag, "", [], true)):
		theOwner.onPunish()
		return true
	return false
