extends BodypartHair

func _init():
	visibleName = "messy 2"
	id = "messyhair2"

	maleWeight = 1.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/MessyHair2/MessyHair2.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
