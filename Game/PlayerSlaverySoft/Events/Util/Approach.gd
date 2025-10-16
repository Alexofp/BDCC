extends NpcOwnerEventBase

func _init():
	id = "Approach"

func onStart(_args:Array):
	setState("start")
	setSubResult(SUB_END)
	
	var approachSubEventID:String = "aMean"
	var theOwner := getNpcOwner()
	if(theOwner):
		approachSubEventID = theOwner.getApproachSubEventID()
	if(checkSubEvent(approachSubEventID, "", [], true)):
		pass
	else:
		assert(false, "Couldn't find any events")
		endEvent()

func start_eventResult(_event, _tag:String, _args:Array):
	endEvent()

func onEventEnd():
	var theNpcOwner := getNpcOwner()
	if(theNpcOwner):
		theNpcOwner.checkNextApproachDay()
