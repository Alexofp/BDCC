extends SpecialRelationshipBase

func _init():
	id = "Nemesis"

func getVisibleName() -> String:
	return "Nemesis"

func getCategoryColor() -> Color:
	return Color.red

func checkSocialEventShouldStart(_charActor:String, _charTarget:String, _eventID:int, _args:Array) -> bool:
	#return true
	return false

func onStart(_args:Array):
	showMessage(getChar().getName()+" became your Nemesis!")
