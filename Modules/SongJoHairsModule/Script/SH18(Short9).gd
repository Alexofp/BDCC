extends BodypartHair

func _init():
	visibleName = "Short 9"
	id = "SongHair18"

	maleWeight = 0.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH18(Short9)/SH18.tscn"

func getTraits():
	return {
		PartTrait.HairPonytail: true,
	}
