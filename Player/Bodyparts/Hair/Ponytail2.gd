extends BodypartHair

func _init():
	visibleName = "ponytail 2"
	id = "ponytailhair2"

	maleWeight = 0.1
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/PonytailHair2/PonytailHair2.tscn"

func getTraits():
	return {
		PartTrait.HairPonytail: true,
	}
