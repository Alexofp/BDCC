extends BodypartTail

func _init():
	visibleName = "canine tail"
	id = "caninetail"

func getCompatibleSpecies():
	return [Species.Canine]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Tail/CanineTail/CanineTail.tscn"

func getTraits():
	return {
		PartTrait.TailFlexible: true,
	}
