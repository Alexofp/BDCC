extends BodypartHair

func _init():
	visibleName = "over eye"
	id = "overeyehair"

	maleWeight = 0.1
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/OvereyeHair/OvereyeHair.tscn"

func getTraits():
	return {
		PartTrait.HairOvereye: true,
	}
