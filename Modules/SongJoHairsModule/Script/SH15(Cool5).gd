extends BodypartHair

func _init():
	visibleName = "Cool 5"
	id = "SongHair15"

	maleWeight = 1.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH15(Cool5)/SH15.tscn"

func getTraits():
	return {
		PartTrait.HairPonytail: true,
	}
