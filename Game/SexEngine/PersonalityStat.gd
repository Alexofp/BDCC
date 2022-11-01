extends Object
class_name PersonalityStat

const Brat = "Brat"
const Mean = "Mean"
const Subby = "Subby"
const Impatient = "Impatient"
const Openminded = "Openminded"
const Naive = "Naive"

static func getAll():
	return [Brat, Mean, Subby, Impatient, Openminded, Naive]

static func getVisibleName(stat):
	return str(stat)
