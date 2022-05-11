extends Object
class_name InmateType

enum {
	General,
	HighSec,
	SexDeviant,
}

static func getOfficialName(type):
	if(type == General):
		return "general"
	if(type == HighSec):
		return "high-security"
	if(type == SexDeviant):
		return "sexual-deviant"
	
	return "Error"

static func getColorName(type):
	if(type == General):
		return "orange"
	if(type == HighSec):
		return "red"
	if(type == SexDeviant):
		return "lilac"
	
	return "Error"
