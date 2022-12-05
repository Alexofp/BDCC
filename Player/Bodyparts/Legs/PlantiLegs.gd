extends BodypartLeg

func _init():
	visibleName = "planti legs"
	id = "plantilegs"

func getCompatibleSpecies():
	return [Species.Any]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Legs/HumanLegs/HumanLegs.tscn"

func getTraits():
	return {
		PartTrait.LegsPlanti: true,
	}
