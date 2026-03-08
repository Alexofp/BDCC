extends BodypartHair

func _init():
	visibleName = "Short 4"
	id = "SongHair8"

	maleWeight = 1.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH8(Short4)/SH8.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
