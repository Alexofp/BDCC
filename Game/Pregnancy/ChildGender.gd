extends Object
class_name ChildGender

const Male = "male"
const Female = "female"
const Shemale = "shemale"
const Herm = "herm"
const Peachboy = "peachboy"

static func getVisibleName(gender):
	return gender.capitalize()

static func generate():
	var variants = [
		[Male, 50],
		[Female, 50],
		[Shemale, 10],
		[Herm, 10],
		[Peachboy, 10],
	]
	
	return RNG.pickWeightedPairs(variants)
