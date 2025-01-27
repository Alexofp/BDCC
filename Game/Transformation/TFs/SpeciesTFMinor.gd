extends "res://Game/Transformation/TFs/SpeciesTF.gd"

func _init():
	id = "SpeciesTFMinor"
	
	pointsOnUnlock = 15

func getName() -> String:
	return "Creates a hybrid"

func getPillName() -> String:
	return "Hybridizer"

func getUnlockData() -> Dictionary:
	return {
		eliza = "Interesting. This pill contains a DNA of some species. But not enough to override everything.. I think this pill will create a.. hybrid of sorts. A blend of two species. Isn't that cool? I think I will call it.. 'Hybridizer'",
	}

func getTFCheckTags() -> Dictionary:
	return {
		"species": true,
	}

func getPillFluidsRequired() -> Dictionary:
	return {
		"Milk": 2000.0,
		"GirlCum": 1000.0,
		"Cum": 200.0,
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
