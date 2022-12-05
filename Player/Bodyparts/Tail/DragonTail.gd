extends BodypartTail

func _init():
	visibleName = "dragon tail"
	id = "dragontail"

func getCompatibleSpecies():
	return [Species.Dragon]

func getLewdSizeAdjective():
	return RNG.pick(["long"])

func getLewdAdjective():
	return RNG.pick(["scaly", "dragon"])

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Tail/DragonTail/DragonTail.tscn"

func getTraits():
	return {
		PartTrait.TailFlexible: true,
	}
