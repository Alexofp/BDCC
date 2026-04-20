extends BodypartHair

func _init():
	visibleName = "Ponytail 5"
	id = "SongHair27"

	maleWeight = 0.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH27(Ponytail5)/SH27.tscn"

func getTraits():
	return {
		PartTrait.HairPonytail: true,
	}
