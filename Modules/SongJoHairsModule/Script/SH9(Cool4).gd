extends BodypartHair

func _init():
	visibleName = "Cool 4"
	id = "SongHair9"

	maleWeight = 1.0
	femaleWeight = 0.1

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH9(Cool4)/SH9.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
