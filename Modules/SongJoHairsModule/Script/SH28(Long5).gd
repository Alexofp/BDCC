extends BodypartHair

func _init():
	visibleName = "Long 5"
	id = "SongHair28"

	maleWeight = 0.5
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH28(Long5)/SH28.tscn"

func getTraits():
	return {
		PartTrait.HairLong: true,
	}
