extends BodypartTail

func _init():
	visibleName = "fennec tail"
	id = "fennectail"

func getCompatibleSpecies():
	return [Species.Canine]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Tail/FennecTail/FennecTail.tscn"

func getTraits():
	return {
		PartTrait.TailFlexible: true,
	}
