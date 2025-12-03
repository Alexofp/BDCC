extends NpcOwnerEventBase

func _init():
	id = "ApproachOrTalk"

func onStart(_args:Array):
	var theNpcOwner := getNpcOwner()
	if(!theNpcOwner):
		return
	
	var shouldGetApproached:bool = theNpcOwner.shouldOwnerApproachPC()
	
	if(shouldGetApproached):
		var theEventData:Array = theNpcOwner.getApproachEvent()
		if(!theEventData.empty()):
			runEvent("", theEventData[0], theEventData[1] if theEventData.size() > 1 else [])
			return
	
	runEvent("", "Talk")
	
