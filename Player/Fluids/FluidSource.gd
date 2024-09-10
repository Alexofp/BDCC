extends Object
class_name FluidSource

enum {
	Penis,
	Vagina,
	Strapon,
	Breasts,
	Pissing,
}

const Names = [
	"Penis",
	"Vagina",
	"Strapon",
	"Breasts",
	"Pissing",
]

static func nameToSource(theName):
	return Names.find(theName)
