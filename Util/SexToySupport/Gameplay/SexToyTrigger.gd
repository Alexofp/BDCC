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
	OnThroatPenetrated,
	OnHolePenetrated,
	OnPenetratingSomeone,
	OnHoleStretchedPainfully,
	OnWounded,
	OnLoseConsciousness,
	OnFightDefeat,
	OnFightWin,
	OnGivingBirth,
	OnBondageLocked,
	
	TOTAL_AMOUNT,
}

const NAMES:Array = [
	["Lust (passive)", "The higher your character's lust is, the stronger the effects will be. Passive triggers repeat infinitely.", "The lower your character's lust is, the stronger the effects will be."],
	["Pain (passive)", "The higher your character's pain is, the stronger the effects will be. Passive triggers repeat infinitely.", "The lower your character's pain is, the stronger the effects will be."],
	["Exhaustion (passive)", "The lower your character's stamina is, the stronger the effects will be. Passive triggers repeat infinitely.", "The higher your character's stamina is, the stronger the effects will be."],
	["Arousal (passive)", "The higher your character's arousal is, the stronger the effects will be. Passive triggers repeat infinitely.", "The lower your character's arousal is, the stronger the effects will be."],
	
	["Pain Gain", "Trigger effects when your character receives pain."],
	["Lust Gain", "Trigger effects when your character receives lust."],
	["Arousal Gain", "Trigger effects when your character receives arousal."],
	["Orgasm", "Trigger effects when your character orgasms."],
	["Throat penetrated", "Trigger effects when your character's throat get penetrated. Only happens in sex engine."],
	["Hole penetrated", "Trigger effects when your character's vagina or anus (all but throat) get penetrated. Only happens in sex engine."],
	["Penetrating hole", "Trigger effects when your character penetrates someone's holes with their penis or strapon. Only happens in sex engine."],
	["Hole Stretched Painfully", "Trigger effects when one of your character's holes gets stretched painfully."],
	["Wounded", "Trigger effects when you get the 'Wounded' status effect."],
	["Lose Consciousness", "Trigger effects when you fully lose your consciousness during sex."],
	["Fight Defeat", "Trigger effects when your character loses a fight."],
	["Fight Win", "Trigger effects when your character wins a fight."],
	["Giving birth/Egglaying", "Trigger effects when your character gives birth or lays an egg."],
	["Bondage'd", "Trigger effects when your character wears a locked piece of bondage gear."],
]

static func getName(_trigger:int) -> String:
	if(_trigger < 0 || _trigger >= NAMES.size()):
		return "UNKNOWN:"+str(_trigger)
	return NAMES[_trigger][0]

static func getDesc(_trigger:int) -> String:
	if(_trigger < 0 || _trigger >= NAMES.size()):
		return "UNKNOWN:"+str(_trigger)
	if(!isPassive(_trigger)):
		return NAMES[_trigger][1]
	return NAMES[_trigger][1]

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

static func supportsScaleWithValue(_trigger:int) -> bool:
	if(_trigger == OnPainGain):
		return true
	if(_trigger == OnLustGain):
		return true
	if(_trigger == OnArousalGain):
		return true
	
	return false

static func supportsScaleWithValueTexts(_trigger:int) -> Array:
	if(_trigger == OnPainGain):
		return ["Scale with pain gain", "pain"]
	if(_trigger == OnLustGain):
		return ["Scale with lust gain", "lust"]
	if(_trigger == OnArousalGain):
		return ["Scale with arousal gain", "arousal %"]
	
	return []
