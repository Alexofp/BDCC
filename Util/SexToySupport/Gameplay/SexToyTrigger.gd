extends Object
class_name SexToyTrigger

enum TYPE {
	Passive,
	Event,
}

enum {
	Lust,
	Pain,
	Stamina,
	Arousal,
	
	OnPainGain,
	OnLustGain,
	OnArousalGain,
	OnOrgasm,
	OnHoleStretchedPainfully,
	OnFightDefeat,
	OnFightWin,
	
	TOTAL_AMOUNT,
}

const NAMES:Array = [
	["Lust (passive)", "The higher your character's lust is, the stronger the effects will be.", "The lower your character's lust is, the stronger the effects will be."],
	["Pain (passive)", "The higher your character's pain is, the stronger the effects will be.", "The lower your character's pain is, the stronger the effects will be."],
	["Stamina (passive)", "The higher your character's stamina is, the stronger the effects will be.", "The lower your character's stamina is, the stronger the effects will be."],
	["Arousal (passive)", "The higher your character's arousal is, the stronger the effects will be.", "The lower your character's arousal is, the stronger the effects will be."],
	
	["Pain Gain", "Trigger effects when your character receives pain."],
	["Lust Gain", "Trigger effects when your character receives lust."],
	["Arousal Gain", "Trigger effects when your character receives arousal."],
	["Orgasm", "Trigger effects when your character orgasms."],
	["Hole Stretched Painfully", "Trigger effects when one of your character's holes gets stretched painfully."],
	["Fight Defeat", "Trigger effects when your character loses a fight."],
	["Fight Win", "Trigger effects when your character wins a fight."],
]

static func getName(_trigger:int) -> String:
	if(_trigger < 0 || _trigger >= NAMES.size()):
		return "UNKNOWN:"+str(_trigger)
	return NAMES[_trigger][0]

static func getDesc(_trigger:int, _invert:bool = false) -> String:
	if(_trigger < 0 || _trigger >= NAMES.size()):
		return "UNKNOWN:"+str(_trigger)
	if(!isPassive(_trigger)):
		return NAMES[_trigger][1]
	return NAMES[_trigger][1 if !_invert else 2]

static func isPassive(_trigger:int) -> bool:
	if(_trigger == Lust):
		return true
	if(_trigger == Pain):
		return true
	if(_trigger == Stamina):
		return true
	if(_trigger == Arousal):
		return true
	return false
