extends BodypartTail

func _init():
	visibleName = "demon tail"
	id = "demontail"

func getCompatibleSpecies():
	return [Species.Demon]

func getLewdSizeAdjective():
	return RNG.pick(["long"])

func getLewdAdjective():
	return RNG.pick(["pointy", "demon"])

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Tail/DemonTail/DemonTail.tscn"

func getTraits():
	return {
		PartTrait.TailFlexible: true,
	}
