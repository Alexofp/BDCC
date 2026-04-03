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
	HairVeryShort,
	
	# Breasts
	BreastsMale,
	BreastsFemale,
	
	# Anus
	AnusWomb,
	
	# Vagina/Anus
	LaysEggs,
	# Penis/strapon
	Ovipositor,
	
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
	"HairVeryShort",
	
	# Breasts
	"BreastsMale",
	"BreastsFemale",
	
	# Anus
	"AnusWomb",
	
	# Vagina/Anus
	"LaysEggs",
	"Ovipositor",
]

static func textToTrait(trait):
	return traitNames.find(trait)
