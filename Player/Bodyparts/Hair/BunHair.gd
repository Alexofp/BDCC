extends BodypartHair

func _init():
	visibleName = "bun"
	id = "bunhair"

	maleWeight = 0.1
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/BunHair/BunHair.tscn"

func getTraits():
	return {
		#artTrait.HairPonytail: true,
	}
