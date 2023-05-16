extends BodypartHair

func _init():
	visibleName = "ferri"
	id = "ferrihair"

	maleWeight = 0.1
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/FerriHair/FerriHair.tscn"

func getTraits():
	return {
		PartTrait.HairOvereye: true,
	}
