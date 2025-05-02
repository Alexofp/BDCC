extends Object
class_name ContentType

const RiskyCondoms = "RiskyCondoms"
const Watersports = "Watersports"
const CumInflation = "CumInflation"
const CumStealing = "CumStealing"
const ForcedPermanentTFs = "ForcedPermanentTFs"

static func getVisibleName(contentType):
	if(contentType == RiskyCondoms):
		return "Risky Condoms"
	if(contentType == CumInflation):
		return "Cum Inflation"
	if(contentType == CumStealing):
		return "Cum Stealing"
	if(contentType == ForcedPermanentTFs):
		return "Forced Permanent TFs"
	
	return contentType.capitalize()

static func getDescription(contentType):
	if(contentType == RiskyCondoms):
		return "If enabled, condoms have a chance to break on use. If disabled - they will never break."
	if(contentType == Watersports):
		return "Content that includes usage of pee in any way."
	if(contentType == CumInflation):
		return "Makes your belly look inflated if too many people cum inside you."
	if(contentType == CumStealing):
		return "Makes it so you can sometimes exchange cum with others during tribbing."
	if(contentType == ForcedPermanentTFs):
		return "If enabled, npcs will sometimes try to force-feed you a pill (MorphIn) that will make your transformations permanent. Turning this off does NOT disable tf content."
	
	return "No description provided"

static func getAll():
	return [RiskyCondoms, Watersports, CumInflation, CumStealing, ForcedPermanentTFs]

static func isDisabledByDefault(contentType):
	if(contentType == Watersports):
		return true
	if(contentType == ForcedPermanentTFs):
		return true
	
	return false
