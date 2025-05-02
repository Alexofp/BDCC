extends "res://Game/Transformation/TFs/SpeciesTF.gd"

func _init():
	id = "SpeciesTFMinor"
	
	canStack = false
	
	pointsOnUnlock = 15

func getName() -> String:
	return "Creates a hybrid"

func getPillName() -> String:
	return "Hybridizer"

func getUnlockData() -> Dictionary:
	return {
		eliza = "Interesting. This pill contains a DNA of some species. But not enough to override everything.. I think this pill will create a.. hybrid of sorts. A blend of two species. Isn't that cool? I think I will call it.. 'Hybridizer'",
		tryOptions = [
			{
				name = "Make Eliza eat it",
				desc = "Ask if she is brave enough to try her own product. This might be funny or sad, who knows.",
				sceneID = "ElizaDrugTestHybridScene",
			},
		],
	}

func getPillDatabaseDesc() -> String:
	return "This drug will make a hybrid out of you, morphing some of your body parts to ones of a different species. The drug will attempt to gradually morph these parts:\n- Ears\n- Horns\n- Tail\n- Penis\n- Legs\n\nThe first stage will happen after about 15 minutes. After that, the next ones will happen roughly every 10 hours. Each next stage will take longer than the last. This could be accelerated only by using the QuickShift drug.\n\nThis drug doesn’t have a set amount of stages. It will reach its final stage when there is nothing left to transform. It’s possible to modify the drug to pick the target species by using the advanced lab equipment."

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
