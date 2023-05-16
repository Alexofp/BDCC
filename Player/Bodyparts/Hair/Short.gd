extends BodypartHair

func _init():
	visibleName = "short"
	id = "shorthair"

	maleWeight = 1.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/ShortHair/ShortHair.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
