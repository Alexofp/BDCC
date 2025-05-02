extends BodypartTail

func _init():
	visibleName = "fluffy feline tail"
	id = "fluffyfelinetail"

func getCompatibleSpecies():
	return [Species.Feline]

func getLewdSizeAdjective():
	return RNG.pick(["long"])

func getLewdAdjective():
	return RNG.pick(["feline", "fluffy"])

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Tail/FluffyFelineTail/FluffyFelineTail.tscn"

func getTraits():
	return {
		PartTrait.TailFlexible: true,
	}
