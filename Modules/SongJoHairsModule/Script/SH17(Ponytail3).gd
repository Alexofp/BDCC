extends BodypartHair

func _init():
	visibleName = "Ponytail 3"
	id = "SongHair17"

	maleWeight = 0.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH17(Ponytail3)/SH17.tscn"

func getTraits():
	return {
		PartTrait.HairPonytail: true,
	}
