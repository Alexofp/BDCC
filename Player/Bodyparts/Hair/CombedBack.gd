extends BodypartHair

func _init():
	visibleName = "combed back"
	id = "combedbackhair"

	maleWeight = 1.0
	femaleWeight = 0.0

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/CombedBackHair/CombedBackHair.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
