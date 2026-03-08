extends BodypartHair

func _init():
	visibleName = "Cool 2"
	id = "SongHair6"

	maleWeight = 1.0
	femaleWeight = 0.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH6(Cool2)/SH6.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
