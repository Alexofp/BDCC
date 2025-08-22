extends SpecialRelationshipBase

var gonnaAmbush:bool = true
var reason:int = NemesisReason.Generic

const SocialEventTypeToNemesisReason = {
	SocialEventType.BeganGettingEnslaved: NemesisReason.EnslavementAttmept,
	SocialEventType.GotScammed: NemesisReason.Scammed,
	SocialEventType.GotImpregnated: NemesisReason.Impregnation,
	SocialEventType.LostFight: NemesisReason.Fight,
}
const SocialEventMinimalAffection = { #default is 1.0
	SocialEventType.LostFight: -0.5,
	SocialEventType.GotScammed: -0.3,
	SocialEventType.GotImpregnated: 0.3,
}

func _init():
	id = "Nemesis"

func getVisibleName() -> String:
	return "Nemesis"

func getCategoryColor() -> Color:
	return Color.red

func checkSocialEventShouldStartActor(_charActor:String, _charTarget:String, _eventID:int, _args:Array) -> Array:
	return [false]

func checkSocialEventShouldStartTarget(_charActor:String, _charTarget:String, _eventID:int, _args:Array) -> Array:
	var eventBadness:float = SocialEventType.HATE_MULT[_eventID] if SocialEventType.HATE_MULT.has(_eventID) else 0.0
	if(eventBadness <= 0.0):
		return [false]
	var _affectionRaw:float = affection(_charActor)
	var _minAffection:float = SocialEventMinimalAffection[_eventID] if SocialEventMinimalAffection.has(_eventID) else 1.0
	if(_affectionRaw > _minAffection):
		return [false]
	
	var _affectionSlide:float = SocialEventType.AFFECTION_BONUS[_eventID] if SocialEventType.AFFECTION_BONUS.has(_eventID) else 0.0
	
	var _theAffection:float = clamp(_affectionRaw + _affectionSlide, -1.0, 1.0)
	var _theMean:float = personality(PersonalityStat.Mean)
	var _theSub:float = personality(PersonalityStat.Subby)
	
	var nemesisChance:float = eventBadness * 20.0
	
	nemesisChance *= (1.0 - _theAffection)
	nemesisChance *= (1.0 + _theMean*0.5)
	nemesisChance *= (1.0 - _theSub*0.5)
	
	if(_eventID == SocialEventType.GotImpregnated):
		var _breedFetish:float = fetish(Fetish.BeingBred)
		_breedFetish = clamp(_breedFetish+0.5, -1.0, 1.0)
		nemesisChance *= (1.0 - _breedFetish)
	
	if(nemesisChance > 70.0):
		nemesisChance = 100.0
	elif(nemesisChance < 30.0):
		nemesisChance = 0.0
	if(RNG.chance(nemesisChance)):
		var _theReason:int = SocialEventTypeToNemesisReason[_eventID] if SocialEventTypeToNemesisReason.has(_eventID) else NemesisReason.Generic
		return [true, [_theReason]]
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




