extends BodypartTail

func _init():
	visibleName = "horse tail"
	id = "horsetail"

func getCompatibleSpecies():
	return [Species.Equine]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Tail/HorseTail/HorseTail.tscn"

func getTraits():
	return {
		PartTrait.TailFlexible: true,
	}
