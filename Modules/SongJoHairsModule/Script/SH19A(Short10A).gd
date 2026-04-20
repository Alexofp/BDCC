extends BodypartHair

func _init():
	visibleName = "Short 10A"
	id = "SongHair19A"

	maleWeight = 0.1
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH19A(Short10A)/SH19A.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
