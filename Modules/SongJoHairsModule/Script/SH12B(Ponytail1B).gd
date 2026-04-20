extends BodypartHair

func _init():
	visibleName = "Ponytail 1B"
	id = "SongHair12B"

	maleWeight = 0.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH12B(Ponytail1B)/SH12B.tscn"

func getTraits():
	return {
		PartTrait.HairPonytail: true,
	}
