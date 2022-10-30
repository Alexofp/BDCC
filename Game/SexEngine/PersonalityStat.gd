extends Object
class_name PersonalityStat

const Brattiness = "Brattiness"
const Evilness = "Evilness"
const Subbyness = "Subbyness"
const Impatience = "Impatience"
const Openmindness = "Openmindness"

static func getAll():
	return [Brattiness, Evilness, Subbyness, Impatience, Openmindness]

static func getVisibleName(stat):
	return str(stat)
