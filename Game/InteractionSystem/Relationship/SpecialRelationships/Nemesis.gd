extends SpecialRelationshipBase

var gonnaAmbush:bool = true
var reason:int = NemesisReason.Generic

func _init():
	id = "Nemesis"

func getVisibleName() -> String:
	return "Nemesis"

func getCategoryColor() -> Color:
	return Color.red

func checkSocialEventShouldStart(_charActor:String, _charTarget:String, _eventID:int, _args:Array) -> Array:
	if(_eventID == SocialEventType.BeganGettingEnslaved):
		return [true, [NemesisReason.EnslavementAttmept]]
	if(_eventID == SocialEventType.GotScammed):
		return [true, [NemesisReason.Scammed]]
	if(_eventID == SocialEventType.GotImpregnated):
		return [true, [NemesisReason.Impregnation]]
	if(_eventID == SocialEventType.LostFight): #TODO: Implement SocialEventType.LostFight
		return [true, [NemesisReason.Fight]]
	#return [true, [NemesisReason.Generic]]
	return [false]

func onStart(_args:Array):
	reason = _args[0] if _args.size() > 0 else NemesisReason.Generic
	showMessage(getChar().getName()+" became your Nemesis!")

func onNewDay():
	#TODO: A cooldown?
	gonnaAmbush = RNG.chance(100)

func getReason() -> int:
	return reason

func saveData() -> Dictionary:
	var data := .saveData()
	
	data["gonnaAmbush"] = gonnaAmbush
	data["reason"] = reason
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	gonnaAmbush = SAVE.loadVar(_data, "gonnaAmbush", false)
	reason = SAVE.loadVar(_data, "reason", NemesisReason.Generic)
