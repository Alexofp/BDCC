extends BodypartHair

func _init():
	visibleName = "Cool 3B"
	id = "SongHair7b"

	maleWeight = 1.0
	femaleWeight = 0.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH7B(Cool3B)/SH7B.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
