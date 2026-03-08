extends BodypartHair

func _init():
	visibleName = "Cool 3A"
	id = "SongHair7a"

	maleWeight = 1.0
	femaleWeight = 0.1

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH7A(Cool3A)/SH7A.tscn"

func getTraits():
	return {
		PartTrait.HairPonytail: true,
	}
