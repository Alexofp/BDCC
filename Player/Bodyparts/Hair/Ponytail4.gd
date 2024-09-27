extends BodypartHair

func _init():
	visibleName = "ponytail 4"
	id = "ponytailhair4"

	maleWeight = 0.1
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/PonytailHair4/PonytailHair4.tscn"

func getTraits():
	return {
		PartTrait.HairPonytail: true,
	}
