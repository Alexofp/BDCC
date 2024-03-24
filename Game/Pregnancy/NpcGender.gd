extends Object
class_name NpcGender

const Male = "male"
const Female = "female"
const Shemale = "shemale"
const Herm = "herm"
const Peachboy = "peachboy"

static func getAll():
	return [Male, Female, Shemale, Herm, Peachboy]

static func getAllWithPenis():
	return [Male, Shemale, Herm]

static func getAllWithVagina():
	return [Female, Herm, Peachboy]

static func getVisibleName(gender):
	return OPTIONS.getGenderOverrideName(gender, getDefaultVisibleName(gender))

static func getDefaultVisibleName(gender):
	return gender.capitalize()

static func getOptionsDesc(gender):
	if(gender == Male):
		return "Penis"
	if(gender == Female):
		return "Breasts,Vagina"
	if(gender == Shemale):
		return "Breasts,Penis"
	if(gender == Herm):
		return "Breasts,Penis,Vagina"
	if(gender == Peachboy):
		return "Vagina"
	
	return "???"

static func getVisibleNameColored(gender):
	var theName = getVisibleName(gender)
	var theColor = getColorString(gender)
	
	return "[color="+str(theColor)+"]"+str(theName)+"[/color]"

static func getGenderExplanation(gender):
	if(gender == Shemale):
		return "Female with a penis but no pussy"
	if(gender == Herm):
		return "Female with a penis and a pussy"
	if(gender == Peachboy):
		return "Male with a pussy and no penis"
	return null

static func getColorString(gender):
	if(gender in [Male, Peachboy]):
		return "#5696EA"
	if(gender in [Female]):
		return "#FF837A"
	if(gender in [Shemale, Herm]):
		return "#BA82FF"
	if(gender in []):
		return "#77D86C"
	return "#FF0000"

static func generate():
	var variants = [
		[Male, 50],
		[Female, 50],
		[Shemale, 10],
		[Herm, 10],
		[Peachboy, 10],
	]
	
	return RNG.pickWeightedPairs(variants)

static func toNormalGender(gender):
	if(gender in [Male, Peachboy]):
		return Gender.Male
	if(gender in [Female]):
		return Gender.Female
	if(gender in [Shemale, Herm]):
		return Gender.Androgynous
	return Gender.Male

# Used for converting genders for dynamic npcs
static func fromNormalGender(thegender):
	if(thegender == Gender.Male):
		return Male
	if(thegender == Gender.Female):
		return Female
	if(thegender == Gender.Androgynous):
		return Herm
	return Female

static func getDefaultWeight(gender):
	if(gender in [Male, Female]):
		return 1.0
	if(gender in [Herm]):
		return 0.3
	if(gender in [Shemale, Peachboy]):
		return 0.1
	
	return 0.0
