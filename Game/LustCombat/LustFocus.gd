extends Object
class_name LustFocus

const Body = "Body"
const Breasts = "Breasts"
const Butt = "Butt"
const Crotch = "Crotch"

static func getAll() -> Array:
	return [Body, Breasts, Butt, Crotch]

static func getButtonName(focus) -> String:
	if(focus == Body):
		return "Present body"
	if(focus == Breasts):
		return "Present breasts"
	if(focus == Butt):
		return "Present butt"
	if(focus == Crotch):
		return "Present crotch"
	
	return "Error?"
