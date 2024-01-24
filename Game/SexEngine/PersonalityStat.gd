extends Object
class_name PersonalityStat

const Brat = "Brat"
const Mean = "Mean"
const Subby = "Subby"
const Impatient = "Impatient"
const Naive = "Naive"
const Coward = "Coward"

static func getAll():
	return [Brat, Mean, Subby, Impatient, Naive, Coward]

static func statExists(stat):
	return (stat in getAll())

static func getVisibleName(stat):
	return str(stat)

static func getVisibleDesc(stat, value):
	var texts = ["Error"]
	
	match(stat):
		Brat:
			texts = ["Opposite of a brat", "Opposite of a brat", "Not bratty", "Not bratty", "Not bratty", "A bit bratty", "Bratty", "Very bratty", "The Brat"]
		Mean:
			texts = ["Incredibly kind", "Very kind", "Kind", "Somewhat kind", "Slightly mean", "Mean", "Very mean", "Incredibly mean"]
		Subby:
			texts = ["Super dominant", "Dominant", "Somewhat dominant", "Switch", "Slightly subby", "Subby", "Very subby"]
		Impatient:
			texts = ["Super patient", "Patient", "Kinda patient", "Kinda impatient", "Impatient", "Very impatient"]
		Naive:
			texts = ["Very perceptive", "Perceptive", "Slightly perceptive", "Slightly naive", "Naive", "Super naive"]
		Coward:
			texts = ["Super brave", "Very brave", "Brave", "Slightly brave", "Slightly cowardly", "A coward", "Very cowardly", "Incredible cowardly"]
		
	var indx = Util.mini(int(floor((clamp(value, -1.0, 1.0)+1.0) / 2.0 * texts.size())), texts.size()-1)
	
	return texts[indx]
