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

static func getVisibleName(poolID: String):
	if (poolID == Guards):
		return "Guards"
	if(poolID == Nurses):
		return "Nurses"
	if(poolID == Inmates):
		return "Inmates"
	if(poolID == Engineers):
		return "Engineers"
	if(poolID == Slaves):
		return "Slaves"
	if(poolID == MentalWard):
		return "Mental Ward"
	return "Error"


