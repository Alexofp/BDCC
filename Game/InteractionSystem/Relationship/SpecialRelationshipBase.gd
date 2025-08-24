extends Reference
class_name SpecialRelationshipBase

var id:String = ""
var charID:String = ""

func getVisibleName() -> String:
	return "SOMEONE"

func getCategoryName() -> String:
	return getVisibleName()

func getMapTag() -> String:
	return getVisibleName()[0]

func getCategoryColor() -> Color:
	return Color.white

# Gets called when we are NOT in a special relationship. We are the actor
func checkSocialEventShouldStartActor(_charActor:String, _charTarget:String, _eventID:int, _args:Array) -> Array:
	return [false]

# Gets called when we are NOT in a special relationship. We are the target
func checkSocialEventShouldStartTarget(_charActor:String, _charTarget:String, _eventID:int, _args:Array) -> Array:
	return [false]

func onStart(_args:Array):
	#showMessage("MEOW MEOW STARTED")
	pass

func onEnd():
	#showMessage("MEOW MEOW ENDED")
	pass

func onSocialEvent(_charActor:String, _charTarget:String, _eventID:int, _args:Array):
	pass

func hoursPassed(_hoursPassed:int):
	pass

func processInteractionActionGenericScore(_scoreType:String, _value:float) -> float:
	return _value

func onNewDay():
	pass

func getCooldown() -> int:
	# days
	return 3

func stopMe():
	var theRelationship = GM.main.RS.getSpecialRelationship(charID)
	if(theRelationship == self):
		GM.main.RS.stopSpecialRelationship(charID)

func showMessage(_text:String):
	GM.main.addMessage(_text)

func hasSpecialRelationship(_charID:String) -> bool:
	return GM.main.RS.hasSpecialRelationship(_charID)

func getAffection(_char1:String, _char2:String) -> float:
	return GM.main.RS.getAffection(_char1, _char2)

func getLust(_char1:String, _char2:String) -> float:
	return GM.main.RS.getLust(_char1, _char2)

func getChar() -> BaseCharacter:
	return GlobalRegistry.getCharacter(charID)

func fetish(_fetishID:String) -> float:
	var theChar := getChar()
	if(!theChar):
		return 0.0
	var theFetishHolder:FetishHolder = theChar.getFetishHolder()
	if(!theFetishHolder):
		return 0.0
	return theFetishHolder.getFetishValue(_fetishID)

func personality(_pers:String) -> float:
	var theChar := getChar()
	if(!theChar):
		return 0.0
	var thePersonality:Personality = theChar.getPersonality()
	if(!thePersonality):
		return 0.0
	return thePersonality.getStat(_pers)

func affection(_otherCharID:String) -> float:
	return getAffection(charID, _otherCharID)

func saveData() -> Dictionary:
	return {
		id = id,
		charID = charID,
	}

func loadData(_data:Dictionary):
	id = SAVE.loadVar(_data, "id", "")
	charID = SAVE.loadVar(_data, "charID", "")
