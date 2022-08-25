extends Object
class_name ContentType

const RiskyCondoms = "RiskyCondoms"
const Watersports = "Watersports"
const CumInflation = "CumInflation"

static func getVisibleName(contentType):
	if(contentType == RiskyCondoms):
		return "Risky Condoms"
	if(contentType == CumInflation):
		return "Cum Inflation"
	
	return contentType.capitalize()

static func getDescription(contentType):
	if(contentType == RiskyCondoms):
		return "If enabled, condoms have a chance to break on use. If disabled - they will never break."
	if(contentType == Watersports):
		return "Content that includes usage of pee in any way."
	if(contentType == CumInflation):
		return "Makes your belly look inflated if too many people cum inside you."
	
	return "No description provided"

static func getAll():
	return [RiskyCondoms, Watersports, CumInflation]

static func isDisabledByDefault(contentType):
	if(contentType == Watersports):
		return true
	
	return false
