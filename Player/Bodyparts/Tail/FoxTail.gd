extends BodypartTail

func _init():
	visibleName = "fox tail"
	id = "foxtail"

func getCompatibleSpecies():
	return [Species.Canine]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Tail/FoxTail/FoxTail.tscn"

func getTraits():
	return {
		PartTrait.TailFlexible: true,
	}
