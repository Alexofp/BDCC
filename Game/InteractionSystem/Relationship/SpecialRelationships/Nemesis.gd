extends SpecialRelationshipBase

var gonnaAmbush:bool = false
var reason:int = NemesisReason.Generic
var anger:float = 0.0

const SocialEventTypeToNemesisReason = {
	SocialEventType.BeganGettingEnslaved: NemesisReason.EnslavementAttmept,
	SocialEventType.GotScammed: NemesisReason.Scammed,
	SocialEventType.GotImpregnated: NemesisReason.Impregnation,
	SocialEventType.LostFight: NemesisReason.Fight,
	SocialEventType.AwfulSex: NemesisReason.AwfulSex,
	SocialEventType.PunishSex: NemesisReason.PunishedSex,
	SocialEventType.PunishStocks: NemesisReason.PunishedStocks,
	SocialEventType.PunishSlutwall: NemesisReason.PunishedSlutwall,
	SocialEventType.EscapedSlavery: NemesisReason.EscapedSlavery,
	SocialEventType.ForcedUnconscious: NemesisReason.ForcedUnconscious,
	SocialEventType.GotWounded: NemesisReason.Wounded,
}
const SocialEventMinimalAffection = { #default is 1.0
	SocialEventType.LostFight: -0.5,
	SocialEventType.GotScammed: -0.3,
	SocialEventType.GotImpregnated: 0.3,
	SocialEventType.AwfulSex: -0.2,
	SocialEventType.PunishSex: -0.6,
	SocialEventType.ForcedUnconscious: -0.6,
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
		print("[NEMESIS debug] RAW NEMESIS CHANCE: AFFECTION TOO HIGH")
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
	elif(_eventID == SocialEventType.ForcedUnconscious):
		var _fetish:float = fetish(Fetish.UnconsciousSex)
		_fetish = clamp(_fetish+0.5, -1.0, 1.0)
		nemesisChance *= (1.0 - _fetish)
	elif(_eventID == SocialEventType.GotWounded):
		var woundedAmount:int = _args[0] if _args.size() > 0 else 1
		
		var _fetish:float = fetish(Fetish.Masochism)
		_fetish = clamp(_fetish+0.25, -1.0, 1.0)
		nemesisChance *= (1.0 - _fetish)
		nemesisChance *= 1.0 + Util.maxi(woundedAmount-1, 0)
	
	print("[NEMESIS debug] RAW NEMESIS CHANCE: "+str(nemesisChance))
	
	if(nemesisChance > 70.0):
		nemesisChance = 100.0
	elif(nemesisChance < 30.0):
		nemesisChance = 0.0
	if(RNG.chance(nemesisChance)):
		var _theReason:int = SocialEventTypeToNemesisReason[_eventID] if SocialEventTypeToNemesisReason.has(_eventID) else NemesisReason.Generic
		return [true, [_theReason]]
	return [false]

func onSocialEvent(_charActor:String, _charTarget:String, _eventID:int, _args:Array):
	var eventBadness:float = SocialEventType.HATE_MULT[_eventID] if SocialEventType.HATE_MULT.has(_eventID) else 0.0
	
	if(eventBadness > 0.0):
		anger += eventBadness*0.1

func onStart(_args:Array):
	reason = _args[0] if _args.size() > 0 else NemesisReason.Generic
	showMessage(getChar().getName()+" became your [b][color=red]Nemesis[/color][/b]!")

func onEnd():
	showMessage(getChar().getName()+" is no longer your Nemesis!")

func onNewDay():
	anger += 0.1 + personality(PersonalityStat.Mean)*0.05
	
	var ambushChance:float = anger * 100.0
	ambushChance = clamp(ambushChance, 5.0, 50.0)
	
	gonnaAmbush = RNG.chance(ambushChance)
	if(gonnaAmbush):
		anger *= 0.2
		print("[NEMESIS debug] AMBUSH WILL HAPPEN TODAY")

func getCooldown() -> int:
	return 10

func processInteractionActionGenericScore(_scoreType:String, _value:float) -> float:
	if(_scoreType == "fight"):
		return _value*3.0
	elif(_scoreType == "punish"):
		return _value*5.0
	elif(_scoreType == "punishMean"):
		return _value*5.0
	elif(_scoreType == "sexDom"):
		return _value*3.0
	elif(_scoreType == "sexSub"):
		return _value*0.2
	elif(_scoreType == "hatefuck"):
		return _value*3.0
	elif(_scoreType == "resist"):
		return _value*1.5
	elif(_scoreType == "help"):
		return _value*0.1
	elif(_scoreType == "sexUse"):
		return _value*2.0
	elif(_scoreType == "attack"):
		return _value*3.0
	elif(_scoreType == "agreeSexWithSlut"):
		return _value*1.0
	elif(_scoreType == "talk"):
		return _value*0.01
	elif(_scoreType == "flirt"):
		return _value*0.01
	
	return _value

func getReason() -> int:
	return reason

func saveData() -> Dictionary:
	var data := .saveData()
	
	data["gonnaAmbush"] = gonnaAmbush
	data["reason"] = reason
	data["anger"] = anger
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	gonnaAmbush = SAVE.loadVar(_data, "gonnaAmbush", false)
	reason = SAVE.loadVar(_data, "reason", NemesisReason.Generic)
	anger = SAVE.loadVar(_data, "anger", 0.0)
