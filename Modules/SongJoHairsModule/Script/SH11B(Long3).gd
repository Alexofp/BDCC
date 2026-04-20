extends BodypartHair

func _init():
	visibleName = "Long 3"
	id = "SongHair11b"

	maleWeight = 0.1
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH11B(Long3)/SH11B.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
