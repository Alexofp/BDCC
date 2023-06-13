extends BodypartHair

func _init():
	visibleName = "tavi"
	id = "tavihair"

	maleWeight = 0.0
	femaleWeight = 0.1

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/TaviHair/TaviHair.tscn"

func getTraits():
	return {
		PartTrait.HairOvereye: true,
	}
