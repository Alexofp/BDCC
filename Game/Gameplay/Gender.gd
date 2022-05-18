extends Object
class_name Gender

enum {
	Male,
	Female,
	Androgynous,
	Other,
}

static func genderToString(thegender):
	if(thegender == Male):
		return "male"
	if(thegender == Female):
		return "female"
	if(thegender == Androgynous):
		return "androgynous"
	if(thegender == Other):
		return "other"
	return "error?"

static func genderToPronouns(thegender):
	if(thegender == Male):
		return "He/his"
	if(thegender == Female):
		return "She/her"
	if(thegender == Androgynous):
		return "They/their"
	if(thegender == Other):
		return "It/its"
	return "error?"
