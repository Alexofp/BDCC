extends BodypartHair

func _init():
	visibleName = "Short 12A"
	id = "SongHair24a"

	maleWeight = 0.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH24(Short12A)/SH24A.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
