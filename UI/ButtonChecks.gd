extends Object
class_name ButtonChecks

enum {
	NotLate,
	NotGagged,
	NotArmsRestrained,
	NotLegsRestrained,
}

static func getReasonText(reason):
	if(reason == NotLate):
		return "It's way too late to do this"
	if(reason == NotGagged):
		return "You can't do this while gagged"
	if(reason == NotArmsRestrained):
		return "You can't do this while your arms are restrained"
	if(reason == NotLegsRestrained):
		return "You can't do this while your legs are restrained"
	return "Error?"

static func check(checks: Array):
	for reason in checks:
		if(reason == NotLate):
			if(GM.main.isVeryLate()):
				return reason
		if(reason == NotGagged):
			if(GM.pc.isGagged()):
				return reason
		if(reason == NotArmsRestrained):
			if(GM.pc.hasBoundArms()):
				return reason
		if(reason == NotLegsRestrained):
			if(GM.pc.hasBoundLegs()):
				return reason
	return null
