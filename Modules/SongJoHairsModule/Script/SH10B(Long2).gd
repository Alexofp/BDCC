extends BodypartHair

func _init():
	visibleName = "Long 2"
	id = "SongHair10b"

	maleWeight = 0.1
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH10B(Long2)/SH10B.tscn"

func getTraits():
	return {
		PartTrait.HairLong: true,
	}
