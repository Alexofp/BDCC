extends Reference
class_name EncounterSettings

var preferKnownEncounters:bool = false
var genderWeights = {}
var disabledGoalsForSubPC = []

func isGoalDisabledForSubPC(goalID):
	if(disabledGoalsForSubPC.has(goalID)):
		return true
	return false

func disableGoalForSubPC(goalID):
	if(disabledGoalsForSubPC.has(goalID)):
		return
	disabledGoalsForSubPC.append(goalID)

func enableGoalForSubPC(goalID):
	if(disabledGoalsForSubPC.has(goalID)):
		disabledGoalsForSubPC.erase(goalID)

func getGenderWeight(gender):
	if(!genderWeights.has(gender)):
		return NpcGender.getDefaultWeight(gender)
	return genderWeights[gender]

func setGenderWeight(gender, weight):
	if(weight < 0.0):
		genderWeights.erase(gender)
		return
	genderWeights[gender] = weight

func togglePreferKnownEcnounters():
	preferKnownEncounters = !preferKnownEncounters

func doesPreferKnownEncounters() -> bool:
	return preferKnownEncounters

func generateGender():
	var stuff = []
	for gender in NpcGender.getAll():
		var weight = getGenderWeight(gender)
		
		stuff.append([gender, weight])
	var pickedGender = RNG.pickWeightedPairs(stuff)
	if(pickedGender == null):
		return RNG.pick([NpcGender.Male, NpcGender.Female])
	return pickedGender
	
func saveData():
	var data = {
		"preferKnownEncounters": preferKnownEncounters,
		"genderWeights": genderWeights,
		"disabledGoalsForSubPC": disabledGoalsForSubPC,
	}
	return data

func loadData(data):
	preferKnownEncounters = SAVE.loadVar(data, "preferKnownEncounters", false)
	genderWeights = SAVE.loadVar(data, "genderWeights", {})
	disabledGoalsForSubPC = SAVE.loadVar(data, "disabledGoalsForSubPC", [])
