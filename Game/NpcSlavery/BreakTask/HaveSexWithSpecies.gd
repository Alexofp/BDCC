extends NpcBreakTaskBase

var speciesID:String = ""

func _init():
	id = "HaveSexWithSpecies"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
	}

func getSlutlockWeight() -> float:
	return 1.0

func isPossibleFor(_npc, _isSlaveLevelup):
	return true

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = 1
	
	var allSpecies = GlobalRegistry.getAllSpecies()
	var possible = []
	for otherspeciesID in allSpecies:
		var weight = GM.main.getEncounterSettings().getSpeciesWeight(otherspeciesID)
		if(weight != null && weight > 0.0):
			possible.append([otherspeciesID, weight])
	
	var randomSpecies = RNG.pickWeightedPairs(possible)
	if(randomSpecies == null):
		randomSpecies = Species.Canine
	speciesID = randomSpecies

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() in [SexEvent.HolePenetrated, SexEvent.RubbedVaginas]):
		if(_event.getTargetChar() == _npc):
			if(speciesID in _event.getSourceChar().getSpecies()):
				advanceTask()
				return true
		elif(_event.getSourceChar() == _npc):
			if(speciesID in _event.getTargetChar().getSpecies()):
				advanceTask()
				return true
	return false

func getTaskString():
	var species = GlobalRegistry.getSpecies(speciesID)
	var speciesName = "Unknown"
	if(species != null):
		speciesName = species.getVisibleName()
	return "Have sex with "+str(speciesName)+" species"

func getTaskHint(_isSlaveLevelup):
	return "Find someone of the right species"

func saveData():
	var data = .saveData()
	data["speciesID"] = speciesID
	
	return data

func loadData(data):
	.loadData(data)
	
	speciesID = SAVE.loadVar(data, "speciesID", Species.Human)
