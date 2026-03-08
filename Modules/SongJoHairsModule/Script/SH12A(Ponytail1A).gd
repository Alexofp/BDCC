extends BodypartHair

func _init():
	visibleName = "Ponytail 1A"
	id = "SongHair12a"

	maleWeight = 0.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH12A(Ponytail1A)/SH12A.tscn"

func getTraits():
	return {
		PartTrait.HairPonytail: true,
	}
