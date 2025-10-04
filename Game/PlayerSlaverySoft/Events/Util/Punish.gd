extends NpcOwnerEventBase

func _init():
	id = "Punish"

func onStart(_args:Array):
	setState("start")
	
	if(checkSubEvent(E_PUNISH, "", [], true)):
		var theOwner := getNpcOwner()
		if(theOwner):
			theOwner.onPunish()
	else:
		endEvent()

func start_eventResult(_event, _tag:String, _args:Array):
	endEvent()
