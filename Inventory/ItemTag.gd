extends Object
class_name ItemTag

enum {
	Illegal,
	Restraint,
}

static func getName(tag):
	if(tag == Illegal):
		return "Illegal"
	if(tag == Restraint):
		return "Restraint"
	return "error"
