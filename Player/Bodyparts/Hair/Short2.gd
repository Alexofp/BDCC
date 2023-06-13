extends BodypartHair

func _init():
	visibleName = "short 2"
	id = "shorthair2"

	maleWeight = 0.5
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/ShortHair2/ShortHair2.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
