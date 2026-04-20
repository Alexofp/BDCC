extends BodypartHair

func _init():
	visibleName = "Short 13"
	id = "SongHair25"

	maleWeight = 0.5
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH25(Short13)/SH25.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
