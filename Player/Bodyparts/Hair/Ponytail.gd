extends BodypartHair

func _init():
	visibleName = "ponytail"
	id = "ponytailhair"

	maleWeight = 1.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/PonytailHair/PonytailHair.tscn"

func getTraits():
	return {
		PartTrait.HairPonytail: true,
	}
