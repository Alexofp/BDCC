extends BodypartHair

func _init():
	visibleName = "Long 6A"
	id = "SongHair31a"

	maleWeight = 0.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH31(Long6A)/SH31A.tscn"

func getTraits():
	return {
		PartTrait.HairLong: true,
	}
