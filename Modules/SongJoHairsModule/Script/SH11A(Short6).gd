extends BodypartHair

func _init():
	visibleName = "Short 6"
	id = "SongHair11a"

	maleWeight = 0.5
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH11A(Short6)/SH11A.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
