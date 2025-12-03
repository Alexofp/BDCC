extends Object
class_name NpcOwnerSexLimits

const LIMITS = {
	"condomsOnly": {
		name = "Condoms only",
		desc = "Your owner (and anyone else who is fucking you) must use condoms",
	},
	"noPullout": {
		name = "No pulling out",
		desc = "Your owner (and anyone else who is fucking you) must only cum inside",
	},
	"noRimming": {
		name = "No rimming",
		desc = "Any kind of rimming is disallowed!",
	},
	"noBondage": {
		name = "No bondage",
		desc = "Any kind of bondage is disallowed!",
	},
	"noFeetplay": {
		name = "No feet stuff",
		desc = "Any kind of feetplay is disallowed!",
	},
	"noJoiners": {
		name = "No joiners",
		desc = "Bystanders aren't allowed to join!",
	},
	"noMilking": {
		name = "No milking",
		desc = "You won't be milked in any way.",
	},
	"noBottom": {
		name = "No bottoming",
		desc = "You won't be forced to be on the receiving end.",
		bans = ["noTopping"],
	},
	"noTopping": {
		name = "No topping",
		desc = "You won't be forced to fuck others.",
		bans = ["noBottom"],
	},
}

static func getAgreeChance(_limitID:String, _ownerChar) -> float:
	var fetishHolder:FetishHolder = _ownerChar.getFetishHolder()
	
	if(_limitID == "condomsOnly"):
		return 70.0 + fetishHolder.getFetishValue(Fetish.Condoms)*30.0
	if(_limitID == "noPullout"):
		return 80.0 - fetishHolder.getFetishValue(Fetish.Breeding)*20.0
	if(_limitID == "noRimming"):
		return 70.0 - 0.5*(fetishHolder.getFetishValue(Fetish.RimmingGiving)+fetishHolder.getFetishValue(Fetish.RimmingReceiving))*30.0
	if(_limitID == "noBondage"):
		return 70.0 - fetishHolder.getFetishValue(Fetish.Rigging)*30.0
	if(_limitID == "noFeetplay"):
		return 70.0 - 0.5*(fetishHolder.getFetishValue(Fetish.FeetplayGiving)+fetishHolder.getFetishValue(Fetish.FeetplayReceiving))*30.0
	if(_limitID == "noMilking"):
		return 70.0 - 0.5*(fetishHolder.getFetishValue(Fetish.Lactation)+fetishHolder.getFetishValue(Fetish.SeedMilking))*30.0
	
	return 70.0
