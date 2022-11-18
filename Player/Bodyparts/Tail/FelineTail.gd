extends BodypartTail

func _init():
	visibleName = "feline tail"
	id = "felinetail"

func getCompatibleSpecies():
	return [Species.Feline]

func getLewdSizeAdjective():
	return RNG.pick(["long"])

func getLewdAdjective():
	return RNG.pick(["feline", "fluffy"])

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Tail/FelineTail/FelineTail.tscn"

func getTraits():
	return {
		PartTrait.TailFlexible: true,
	}
