extends BodypartHair

func _init():
	visibleName = "Short 15"
	id = "SongHair30"

	maleWeight = 1.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH30(Short15)/SH30.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
