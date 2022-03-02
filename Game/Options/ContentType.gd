extends Object
class_name ContentType

const Breeding = "Breeding"
const Watersports = "Watersports"

static func getVisibleName(contentType):
	return contentType.capitalize()

static func getAll():
	return [Breeding, Watersports]

static func isDisabledByDefault(contentType):
	if(contentType == Watersports):
		return true
	
	return false
