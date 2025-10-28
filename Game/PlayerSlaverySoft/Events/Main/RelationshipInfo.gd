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
	
	addButton("Close", "You've seen enough", "endEvent")
	if(theNpcOwner):
		if(theNpcOwner.canChooseApproachDays()):
			addButton("Frequency", "Set how often should your owner approach you", "setState", ["approachMenu"])
		else:
			addDisabledButton("Frequency", "Your dynamic hasn't progressed far enough..")

func approachMenu():
	addButton("Back", "Enough choosing", "setState", ["start"])
	var theNpcOwner := getNpcOwner()
	if(!theNpcOwner):
		return
	
	saynn("You're allowed to choose how often {npc.name} will approach you.")
	
	var theCurrentFreq:int = theNpcOwner.nextApproachOverride
	if(theCurrentFreq <= 0):
		saynn("Currently, your owner decides how often to approach you.")
	else:
		saynn("Currently, your owner will approach you every "+str(theCurrentFreq)+" day"+("s" if theCurrentFreq != 1 else "")+".")
	
	var possible:Array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 20, 30]
	for _days in possible:
		if(_days <= 0):
			addButton("Up to owner", "Let the owner decide how often to approach you", "setDays", [_days])
		else:
			addButton(str(_days)+" day"+("s" if _days != 1 else ""), "Choose this frequency", "setDays", [_days])

func approachMenu_do(_id:String, _args:Array):
	if(_id == "setDays"):
		var theNpcOwner := getNpcOwner()
		if(theNpcOwner):
			theNpcOwner.nextApproachOverride = _args[0] if _args.size() > 0 else 0
			if(theNpcOwner.nextApproachOverride > 0): # Adjusting the next approach day to fit
				var newDaysApproach:int = GM.main.getDays() + theNpcOwner.nextApproachOverride
				if(theNpcOwner.nextApproachDay > newDaysApproach):
					theNpcOwner.nextApproachDay = newDaysApproach
		setState("approachMenu")
		
func howMuchTimeToPass(_actionID:String, _args:Array) -> int:
	return 0
