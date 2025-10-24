extends SpecialRelationshipBase

var npcOwner:NpcOwnerBase

func _init():
	id = "SoftSlavery" # Soft means you can still do stuff in the prison

func getVisibleName() -> String:
	return "Soft slavery"

func getCategoryName() -> String:
	return "Owner"

func getMapTag() -> String:
	return "O"

func getCategoryColor() -> Color:
	return Color.darkorchid

func getExtraCategoryText() -> String:
	if(npcOwner):
		return npcOwner.getExtraCategoryText()
	return ""

func checkSocialEventShouldStartActor(_charActor:String, _charTarget:String, _eventID:int, _args:Array) -> Array:
	return [false]

func checkSocialEventShouldStartTarget(_charActor:String, _charTarget:String, _eventID:int, _args:Array) -> Array:
	return [false]

func onSocialEvent(_charActor:String, _charTarget:String, _eventID:int, _args:Array):
	pass

func onStart(_args:Array):
	var theChar := getChar()
	if(theChar.hasEnslaveQuest()):
		theChar.setEnslaveQuest(null)
	
	var theNpcTypeID:String = ""
	if(_args.size() > 0):
		theNpcTypeID = _args[0]
	else:
		var currentPriority:int = -9999
		var currentPossibleList:Array = []
		
		for ownerTypeID in GlobalRegistry.getNpcOwnerTypes():
			var theOwnerType = GlobalRegistry.getNpcOwnerTypeRef(ownerTypeID)
			var thePrio:int = theOwnerType.getStartPriority(theChar)
			
			if(thePrio > currentPriority):
				currentPriority = thePrio
				currentPossibleList = [ownerTypeID]
			elif(thePrio == currentPriority):
				currentPossibleList.append(ownerTypeID)
		
		theNpcTypeID = RNG.pick(currentPossibleList) if !currentPossibleList.empty() else "Normal"
	npcOwner = GlobalRegistry.createNpcOwnerType(theNpcTypeID)
	npcOwner.setRelationship(self)
	npcOwner.onStart()
	
	showMessage(theChar.getName()+" became your [b][color=red]Owner[/color][/b]!")

func onEnd():
	showMessage(getChar().getName()+" is no longer your Owner!")

func onNewDay():
	if(npcOwner):
		npcOwner.onNewDay()
	else:
		stopMe()

func getCooldown() -> int:
	return 0

func processInteractionActionGenericScore(_scoreType:String, _value:float) -> float:
	return _value

func canEnslaveReason(_isKidnap:bool) -> Array:
	return [false, "You can't enslave your owner! That'd be strange!"]

func canTalkWithPlayer() -> bool: # Owners 'talk' with the player through npc owner events
	return false

func saveData() -> Dictionary:
	var data := .saveData()
	
	if(npcOwner):
		data["ownerType"] = npcOwner.id
		data["npcOwner"] = npcOwner.saveData()
	#data["gonnaAmbush"] = gonnaAmbush
	#data["reason"] = reason
	#data["anger"] = anger
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	var theOwnerType:String = SAVE.loadVar(_data, "ownerType", "")
	if(theOwnerType.empty() || !GlobalRegistry.getNpcOwnerTypeRef(theOwnerType)):
		return
	npcOwner = GlobalRegistry.createNpcOwnerType(theOwnerType)
	npcOwner.setRelationship(self)
	npcOwner.loadData(SAVE.loadVar(_data, "npcOwner", {}))
	#gonnaAmbush = SAVE.loadVar(_data, "gonnaAmbush", false)
	#reason = SAVE.loadVar(_data, "reason", NemesisReason.Generic)
	#anger = SAVE.loadVar(_data, "anger", 0.0)
