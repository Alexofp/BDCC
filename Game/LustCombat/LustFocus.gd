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

static func getButtonDesc(focus) -> String:
	if(focus == Body):
		return "Show off your body!"
	if(focus == Breasts):
		return "Flash your breasts!"
	if(focus == Butt):
		return "Present your rear to them"
	if(focus == Crotch):
		return "Present crotch and everything that's between your legs"
	
	return "Error?"
