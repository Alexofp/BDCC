extends BodypartHair

func _init():
	visibleName = "Long 6B"
	id = "SongHair31b"

	maleWeight = 0.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH31(Long6B)/SH31B.tscn"

func getTraits():
	return {
		PartTrait.HairLong: true,
	}
