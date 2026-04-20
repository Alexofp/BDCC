extends BodypartHair

func _init():
	visibleName = "Short 5"
	id = "SongHair10a"

	maleWeight = 0.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH10A(Short5)/SH10A.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
