extends Reference
class_name EncounterSettings

var preferKnownEncounters:bool = false
var genderWeights = {}
var disabledGoalsForSubPC = []
var speciesWeights = {}
var goalWeights = {}
var tfWeights:Dictionary = {}

func getGoalWeight(goalID, defaultValue = 1.0):
	if(goalWeights.has(goalID)):
		return goalWeights[goalID]
	return defaultValue

func setGoalWeight(goalID, value):
	goalWeights[goalID] = value

func resetGoalWeight(goalID):
	if(goalWeights.has(goalID)):
		goalWeights.erase(goalID)

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

func getSpeciesWeight(speciesID):
	if(!speciesWeights.has(speciesID)):
		var species:Species = GlobalRegistry.getSpecies(speciesID)
		if(species == null):
			return 0.0
		return species.npcGenerationWeight()
	return speciesWeights[speciesID]

func setSpeciesWeight(speciesID, weight):
	if(weight < 0.0):
		speciesWeights.erase(speciesID)
		return
	speciesWeights[speciesID] = weight

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
	
func generateGenderFromAllowed(npcGenders):
	var stuff = []
	for gender in npcGenders:
		var weight = getGenderWeight(gender)
		
		stuff.append([gender, weight])
	var pickedGender = RNG.pickWeightedPairs(stuff)
	if(pickedGender == null):
		pickedGender = RNG.pick(npcGenders)
	if(pickedGender == null):
		return RNG.pick([NpcGender.Male, NpcGender.Female])
	return pickedGender
	
func generateSpecies() -> String:
	var allSpecies = GlobalRegistry.getAllSpecies()
	var possible = []
	for speciesID in allSpecies:
		var weight = GM.main.getEncounterSettings().getSpeciesWeight(speciesID)
		if(weight != null && weight > 0.0):
			possible.append([speciesID, weight])
	if(possible.empty()):
		return ""
	return RNG.pickWeightedPairs(possible)
	
func generateSpeciesBlacklist(blacklist:Array) -> String:
	var allSpecies = GlobalRegistry.getAllSpecies()
	var possible = []
	for speciesID in allSpecies:
		if(blacklist.has(speciesID)):
			continue
		var weight = GM.main.getEncounterSettings().getSpeciesWeight(speciesID)
		if(weight != null && weight > 0.0):
			possible.append([speciesID, weight])
	if(possible.empty()):
		return ""
	return RNG.pickWeightedPairs(possible)
	
func getTFWeight(tfID:String, defaultValue:float = 1.0) -> float:
	if(!tfWeights.has(tfID)):
		return defaultValue
	return tfWeights[tfID]
	
func setTFWeight(tfID:String, value:float):
	tfWeights[tfID] = value

func resetTFWeight(tfID:String):
	if(tfWeights.has(tfID)):
		tfWeights.erase(tfID)
	
func saveData():
	var data = {
		"preferKnownEncounters": preferKnownEncounters,
		"genderWeights": genderWeights,
		"disabledGoalsForSubPC": disabledGoalsForSubPC,
		"speciesWeights": speciesWeights,
		"goalWeights": goalWeights,
		"tfWeights": tfWeights,
	}
	return data

func loadData(data):
	preferKnownEncounters = SAVE.loadVar(data, "preferKnownEncounters", false)
	genderWeights = SAVE.loadVar(data, "genderWeights", {})
	disabledGoalsForSubPC = SAVE.loadVar(data, "disabledGoalsForSubPC", [])
	speciesWeights = SAVE.loadVar(data, "speciesWeights", {})
	goalWeights = SAVE.loadVar(data, "goalWeights", {})
	tfWeights = SAVE.loadVar(data, "tfWeights", {})
