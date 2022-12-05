extends BodypartLeg

func _init():
	visibleName = "hoofs"
	id = "hoofs"

func getCompatibleSpecies():
	return [Species.Any]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Legs/Hoofs/Hoofs.tscn"

func getTraits():
	return {
		PartTrait.LegsHoofs: true,
	}
