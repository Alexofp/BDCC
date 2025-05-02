extends BodypartHair

func _init():
	visibleName = "Kid tails"
	id = "kidlathair"

	maleWeight = 0.1
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/KidlatHair/KidlatHair.tscn"

func getTraits():
	return {
		PartTrait.HairOvereye: true,
	}
