extends BodypartHair

func _init():
	visibleName = "cool"
	id = "coolhair"

	maleWeight = 1.0
	femaleWeight = 0.0

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/CoolHair/CoolHair.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
