extends BodypartHair

func _init():
	visibleName = "Short 1"
	id = "songhair2"

	maleWeight = 0.1
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH2(Short1)/SH2.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
