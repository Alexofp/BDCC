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
	"Lust (passive)",
	"Pain (passive)",
	"Stamina (passive)",
	"Arousal (passive)",
	
	"Pain Gain",
	"Lust Gain",
	"Arousal Gain",
	"Orgasm",
	"Hole Stretched Painfully",
	"Fight Defeat",
	"Fight Win",
]

static func getName(_trigger:int) -> String:
	if(_trigger < 0 || _trigger >= NAMES.size()):
		return "UNKNOWN:"+str(_trigger)
	return NAMES[_trigger]

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
