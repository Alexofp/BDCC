extends Object
class_name InmateType

enum {
	General,
	HighSec,
	SexDeviant,
	Unknown,
}

const names = [
	"General",
	"HighSec",
	"SexDeviant",
	"Unknown",
]

static func getAll():
	return [General, HighSec, SexDeviant, Unknown]

static func getAllWithNames():
	var result := []
	for _i in range(names.size()):
		result.append([_i, names[_i]])
	return result

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
	if(type == Unknown):
		return "pink"
	
	return "Error"
