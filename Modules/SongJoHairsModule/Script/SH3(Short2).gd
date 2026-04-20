extends BodypartHair

func _init():
	visibleName = "Short 2"
	id = "Songhair3"

	maleWeight = 1.0
	femaleWeight = 0.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH3(Short2)/SH3.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
