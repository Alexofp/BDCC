extends Object
class_name ChildGender

const Male = "male"
const Female = "female"
const Shemale = "shemale"
const Herm = "herm"
const Peachboy = "peachboy"

static func getVisibleName(gender):
	return gender.capitalize()

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
