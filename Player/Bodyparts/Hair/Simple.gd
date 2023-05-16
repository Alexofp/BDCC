extends BodypartHair

func _init():
	visibleName = "simple"
	id = "simplehair"

	maleWeight = 1.0
	femaleWeight = 0.1

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/SimpleHair/SimpleHair.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
