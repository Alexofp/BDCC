extends BodypartHair

func _init():
	visibleName = "Ponytail 4"
	id = "SongHair23"

	maleWeight = 0.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH23(Ponytail4)/SH23.tscn"

func getTraits():
	return {
		PartTrait.HairPonytail: true,
	}
