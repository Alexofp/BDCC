extends BodypartPenis

func _init():
	visibleName = "knotted penis"
	id = "caninepenis"
	pickedGColor = Color.red
	pickedBColor = Color.darkred

func getCompatibleSpecies():
	return [Species.Any]

func getLewdAdjective():
	return RNG.pick(["knotted", "canine-shaped", "canine"])

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Penis/CaninePenis/CaninePenis.tscn"

func getTraits():
	return {
		PartTrait.PenisKnot: true,
	}

func getVulgarName() -> String:
	return "knotted canine cock"
