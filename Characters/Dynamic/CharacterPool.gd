extends Object
class_name CharacterPool

const Guards = "Guards"
const Nurses = "Nurses"
const Inmates = "Inmates"
const Engineers = "Engineers"
const Slaves = "Slaves"

static func getPrisonPopulationPools():
	return [Guards, Nurses, Inmates, Engineers]

static func getPrisonStaffPools():
	return [Guards, Nurses, Engineers]

static func getEnslavedPools():
	return [Slaves]

static func getAllPools():
	return [Guards, Nurses, Inmates, Engineers, Slaves]
