extends BodypartHair

func _init():
	visibleName = "Short 10B"
	id = "SongHair19B"

	maleWeight = 1.0
	femaleWeight = 0.1

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH19B(Short10B)/SH19B.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
