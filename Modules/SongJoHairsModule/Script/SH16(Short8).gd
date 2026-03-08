extends BodypartHair

func _init():
	visibleName = "Short 8"
	id = "SongHair16"

	maleWeight = 1.0
	femaleWeight = 0.25

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH16(Short8)/SH16.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
