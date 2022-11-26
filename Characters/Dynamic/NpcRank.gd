extends Object
class_name NpcRank

const Spacer = "Spacer"
const SpaceCadet = "SpaceCadet"

const Inspector = "Inspector"
const ChiefInspector = "ChiefInspector"
const Sergeant = "Sergeant"

const PettyOfficer = "PettyOfficer"
const ChiefPettyOfficer = "ChiefPettyOfficer"

const Lieutenant = "Lieutenant"
const Executor = "Executor"

static func getVisibleName(rankID):
	if(rankID == SpaceCadet):
		return "Space Cadet"
	if(rankID == ChiefInspector):
		return "Chief Inspector"
	if(rankID == PettyOfficer):
		return "Petty Officer"
	if(rankID == ChiefPettyOfficer):
		return "Chief Petty Officer"

	return str(rankID)
