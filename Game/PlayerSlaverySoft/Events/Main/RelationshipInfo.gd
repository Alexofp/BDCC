extends NpcOwnerEventBase

func _init():
	id = "RelationshipInfo"

func onStart(_args:Array):
	setSubResult(SUB_CONTINUE)

func start():
	playStand()
	saynn("Slavery Relationship info:")
	var theNpcOwner := getNpcOwner()
	if(theNpcOwner):
		saynn(Util.join(theNpcOwner.getRelationshipFullInfo(), "\n"))
	
	addContinue("endEvent")
	
func howMuchTimeToPass(_actionID:String, _args:Array) -> int:
	return 0
