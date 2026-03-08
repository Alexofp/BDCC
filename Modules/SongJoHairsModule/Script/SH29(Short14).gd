extends BodypartHair

func _init():
	visibleName = "Short 14"
	id = "SongHair29"

	maleWeight = 1.0
	femaleWeight = 0.2

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH29(Short14)/SH29.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
