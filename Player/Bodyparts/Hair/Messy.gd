extends BodypartHair

func _init():
	visibleName = "messy"
	id = "messyhair"

	maleWeight = 1.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/MessyHair/MessyHair.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
