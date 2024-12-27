extends BodypartPenis

func _init():
	visibleName = "barbed penis"
	id = "felinepenis"
	pickedGColor = Color.red
	pickedBColor = Color.darkred

func getCompatibleSpecies():
	return [Species.Any]

func getLewdAdjective():
	return RNG.pick(["barbed", "feline-shaped", "feline"])

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Penis/FelinePenis/FelinePenis.tscn"

func getTraits():
	return {
		PartTrait.PenisBarbs: true,
	}

func getVulgarName() -> String:
	return "barbed feline cock"
