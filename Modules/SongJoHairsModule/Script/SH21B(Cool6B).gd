extends BodypartHair

func _init():
	visibleName = "Cool 6B"
	id = "SongHair21b"

	maleWeight = 1.0
	femaleWeight = 0.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH21B(Cool6B)/SH21B.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
