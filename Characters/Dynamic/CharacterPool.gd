extends Object
class_name CharacterPool

const Guards = "Guards"
const Nurses = "Nurses"
const Inmates = "Inmates"
const Engineers = "Engineers"
const Slaves = "Slaves"
const MentalWard = "Mental Ward"

static func getPrisonPopulationPools():
	return [Guards, Nurses, Inmates, Engineers]

static func getPrisonStaffPools():
	return [Guards, Nurses, Engineers]

static func getEnslavedPools():
	return [Slaves]

static func getAllPools():
	return [Guards, Nurses, Inmates, Engineers, Slaves, MentalWard]

static func characterTypeToPool(charType):
	if(charType == CharacterType.Guard):
		return Guards
	if(charType == CharacterType.Nurse):
		return Nurses
	if(charType == CharacterType.Inmate):
		return Inmates
	if(charType == CharacterType.Engineer):
		return Engineers
	return null
