extends BodypartHair

func _init():
	visibleName = "Long 1"
	id = "SongHair4"

	maleWeight = 0.1
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH4(Long1)/SH4.tscn"

func getTraits():
	return {
		PartTrait.HairLong: true,
	}
