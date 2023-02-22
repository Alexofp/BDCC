extends Object
class_name CharacterPool

const Guards = "Guards"
const Nurses = "Nurses"
const Inmates = "Inmates"
const Engineers = "Engineers"

static func getPrisonPopulationPools():
	return [Guards, Nurses, Inmates, Engineers]

static func getPrisonStaffPools():
	return [Guards, Nurses, Engineers]
