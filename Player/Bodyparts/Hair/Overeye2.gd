extends BodypartHair

func _init():
	visibleName = "over eye 2"
	id = "overeyehair2"

	maleWeight = 0.1
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/OvereyeHair2/OvereyeHair2.tscn"

func getTraits():
	return {
		PartTrait.HairOvereye: true,
	}
