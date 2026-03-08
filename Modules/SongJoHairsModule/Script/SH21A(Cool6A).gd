extends BodypartHair

func _init():
	visibleName = "Cool 6A"
	id = "SongHair21a"

	maleWeight = 1.0
	femaleWeight = 0.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH21A(Cool6A)/SH21A.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
