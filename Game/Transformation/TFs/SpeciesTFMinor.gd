extends "res://Game/Transformation/TFs/SpeciesTF.gd"

func _init():
	id = "SpeciesTFMinor"

func getName() -> String:
	return "Creates a hybrid"

func getPillName() -> String:
	return "Hybridizer"

func getTFCheckTags() -> Dictionary:
	return {
		"species": true,
	}

func getSlotsToTransform() -> Array:
	return [
		BodypartSlot.Ears,
		BodypartSlot.Horns,
		BodypartSlot.Tail,
		BodypartSlot.Penis,
		BodypartSlot.Legs,
	]

func allowsRemovingParts() -> bool:
	return false

func getPillOptions() -> Dictionary:
	var speciesArray:Array = []
	for speciesID in GlobalRegistry.getAllPlayableSpecies():
		speciesArray.append([speciesID, GlobalRegistry.getSpecies(speciesID).getVisibleName()])
	var result:Dictionary = {
		"species": {
			name = "Species",
			desc = "What species should the drug transform you into.",
			value = Species.Canine,
			values = speciesArray,
		},
	}
	
	return result
