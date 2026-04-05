extends Object
class_name SexToyGroup

enum {
	Main,
	Secondary,
	Extra1,
	Extra2,
}

const ALL:Array = [
	Main,
	Secondary,
	Extra1,
	Extra2,
]

const NAMES:Array = [
	"Main",
	"Secondary",
	"Extra1",
	"Extra2",
]

static func getName(_group:int) -> String:
	if(_group < 0 || _group >= NAMES.size()):
		return "Unknown:"+str(_group)
	return NAMES[_group]
