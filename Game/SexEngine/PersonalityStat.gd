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

static func getVisibleName(stat):
	return str(stat)
