extends Object
class_name RepStat

const Whore = "Whore"
# Easier for people to agree to fuck you
# Can earn more as a slut
# At high level unlocks the pricy slut prostitution option

const Alpha = "Alpha"
# Easier for others to agree to get fucked by you
# Can earn more as a service dom slut and also unlocks that option

const Inmates = "Inmates"
# Affection with inmates raises faster/slower

const Staff = "Staff"
# Affection with staff raises faster/slower

static func getAllWithNames():
	var result:Array = []
	
	for statID in GlobalRegistry.getRepStats():
		var repStat = GlobalRegistry.getRepStat(statID)
		result.append([statID, repStat.getVisibleName()])
	
	return result

static func getAll():
	return GlobalRegistry.getRepStats().keys()
