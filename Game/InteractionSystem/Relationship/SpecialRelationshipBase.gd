extends Reference
class_name SpecialRelationshipBase

var id:String = ""
var charID:String = ""

func getVisibleName() -> String:
	return "SOMEONE"

func getCategoryName() -> String:
	return getVisibleName()

func getCategoryColor() -> Color:
	return Color.white

# Gets called when we are NOT in a special relationship
func checkSocialEventShouldStart(_charActor:String, _charTarget:String, _eventID:int, _args:Array) -> bool:
	return false

func onStart(_args:Array):
	showMessage("MEOW MEOW STARTED")

func onEnd():
	showMessage("MEOW MEOW ENDED")

func hoursPassed(_hoursPassed:int):
	pass

func onNewDay():
	pass

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

func saveData() -> Dictionary:
	return {
		charID = charID,
	}

func loadData(_data:Dictionary):
	charID = SAVE.loadVar(_data, "charID", "")
