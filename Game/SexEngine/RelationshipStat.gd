extends Object
class_name RelationshipStat

const Relation = "Relation" 
const Respect = "Respect" 

static func getAll():
	return [Relation, Respect]

static func getVisibleName(stat):
	return str(stat)

static func getVisibleDesc(stat, value):
	var texts = ["Error"]
	
	match(stat):
		Relation:
			texts = ["Hateful", "Unfriendly", "Neutral", "Friendly", "Loving"]
		Respect:
			texts = ["Neglect", "Apathy", "Courtesy", "Credence", "Admiration"]
		
	var indx = Util.mini(int(floor((clamp(value, -1.0, 1.0)+1.0) / 2.0 * texts.size())), texts.size()-1)
	
	return texts[indx]
