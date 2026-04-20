extends BodypartHair

func _init():
	visibleName = "Short 12B"
	id = "SongHair24b"

	maleWeight = 0.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH24(Short12B)/SH24B.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
