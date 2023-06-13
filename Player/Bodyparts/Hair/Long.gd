extends BodypartHair

func _init():
	visibleName = "long"
	id = "longhair"

	maleWeight = 0.5
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/LongHair/LongHair.tscn"

func getTraits():
	return {
		PartTrait.HairLong: true,
	}
