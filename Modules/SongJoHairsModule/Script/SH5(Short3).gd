extends BodypartHair

func _init():
	visibleName = "Short 3"
	id = "SongHair5"

	maleWeight = 0.1
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH5(Short3)/SH5.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
