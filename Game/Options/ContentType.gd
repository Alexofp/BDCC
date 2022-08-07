extends Object
class_name ContentType

const RiskyCondoms = "RiskyCondoms"
const Watersports = "Watersports"

static func getVisibleName(contentType):
	if(contentType == RiskyCondoms):
		return "Risky Condoms"
	
	return contentType.capitalize()

static func getDescription(contentType):
	if(contentType == RiskyCondoms):
		return "If enabled, condoms have a chance to break on use. If disabled - they will never break."
	if(contentType == Watersports):
		return "Content that includes usage of pee in any way."
	
	return "No description provided"

static func getAll():
	return [RiskyCondoms, Watersports]

static func isDisabledByDefault(contentType):
	if(contentType == Watersports):
		return true
	
	return false
