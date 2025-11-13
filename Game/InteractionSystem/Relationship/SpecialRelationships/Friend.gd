extends SpecialRelationshipBase

func _init():
	id = "Friend"

func getVisibleName() -> String:
	return "Friend"

func getBigDescription() -> String:
	return "Friends are less likely to do something mean with you and are more likely to help you if you are stuck in a pickle. Friends might also occasionally try to protect you from your owners."

func getCategoryColor() -> Color:
	return Color.greenyellow

func canMeetThroughRelationshipMenu() -> bool:
	return true

func checkSocialEventShouldStartActor(_charActor:String, _charTarget:String, _eventID:int, _args:Array) -> Array:
	return checkSocialEventShouldStartTarget(_charTarget, _charActor, _eventID, _args)

func checkSocialEventShouldStartTarget(_charActor:String, _charTarget:String, _eventID:int, _args:Array) -> Array:
	if(_eventID != SocialEventType.AffectionChange):
		return [false]
	var _affectionRaw:float = affection(_charActor)
	if(_affectionRaw >= 0.5):
		return [true]
	return [false]

func onSocialEvent(_charActor:String, _charTarget:String, _eventID:int, _args:Array):
	var eventBadness:float = SocialEventType.HATE_MULT[_eventID] if SocialEventType.HATE_MULT.has(_eventID) else 0.0
	if(eventBadness >= 1.0):
		if(_eventID == SocialEventType.GotImpregnated && _charTarget == charID && fetish(Fetish.BeingBred) >= 0.0):
			return
		stopMe()
		return
	
	if(_eventID != SocialEventType.AffectionChange):
		return
	
	if(charID == _charActor):
		if(affection(_charTarget) < 0.4):
			stopMe()
	elif(charID == _charTarget):
		if(affection(_charActor) < 0.4):
			stopMe()

func onStart(_args:Array):
	showMessage(getChar().getName()+" became your [b][color=#"+Color.greenyellow.to_html(false)+"]Friend[/color][/b]!")

func onEnd():
	showMessage(getChar().getName()+" is no longer your Friend!")

func onNewDay():
	if(affection("pc") < 0.4):
		stopMe()

func getCooldown() -> int:
	return 20

func processInteractionActionGenericScore(_scoreType:String, _value:float) -> float:
	if(_scoreType == "fight"):
		return _value*0.1
	elif(_scoreType == "punish"):
		return _value*0.1
	elif(_scoreType == "punishMean"):
		return _value*0.1
	elif(_scoreType == "sexDom"):
		return _value*2.0
	elif(_scoreType == "sexSub"):
		return _value*2.0
	elif(_scoreType == "hatefuck"):
		return _value*0.5
	elif(_scoreType == "resist"):
		return _value*0.7
	elif(_scoreType == "help"):
		return _value*3.0
	elif(_scoreType == "sexUse"):
		return _value*0.1
	elif(_scoreType == "attack"):
		return _value*0.1
	elif(_scoreType == "agreeSexWithSlut"):
		return _value*2.5
	elif(_scoreType == "talk"):
		return _value*3.0
	elif(_scoreType == "flirt"):
		return _value*1.5
	
	return _value

func saveData() -> Dictionary:
	var data := .saveData()
	
	#data["gonnaAmbush"] = gonnaAmbush
	#data["reason"] = reason
	#data["anger"] = anger
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	#gonnaAmbush = SAVE.loadVar(_data, "gonnaAmbush", false)
	#reason = SAVE.loadVar(_data, "reason", NemesisReason.Generic)
	#anger = SAVE.loadVar(_data, "anger", 0.0)
