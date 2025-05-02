extends Object
class_name PartTrait

enum {
	# Penis
	PenisKnot,
	PenisBarbs,
	PenisRidges,
	PenisFlare,
	
	# Horns
	HornsGraspable,
	HornsSingle,
	
	# Tail
	TailFlexible,
	
	# Legs
	LegsDigi,
	LegsPlanti,
	LegsHoofs,
	
	# Arms
	ArmsBuff,
	
	# Hair
	HairBald,
	HairPonytail,
	HairOvereye,
	HairShort,
	HairLong,
	
	# Breasts
	BreastsMale,
	BreastsFemale,
	
	# Anus
	AnusWomb,
	
	TRAITCOUNT,
}

const traitNames = [
	# Penis
	"PenisKnot",
	"PenisBarbs",
	"PenisRidges",
	"PenisFlare",
	
	# Horns
	"HornsGraspable",
	"HornsSingle",
	
	# Tail
	"TailFlexible",
	
	# Legs
	"LegsDigi",
	"LegsPlanti",
	"LegsHoofs",
	
	# Arms
	"ArmsBuff",
	
	# Hair
	"HairBald",
	"HairPonytail",
	"HairOvereye",
	"HairShort",
	"HairLong",
	
	# Breasts
	"BreastsMale",
	"BreastsFemale",
	
	# Anus
	"AnusWomb",
]

static func textToTrait(trait):
	return traitNames.find(trait)
