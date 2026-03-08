extends BodypartHair

func _init():
	visibleName = "Cool8 B"
	id = "SongHair33B"

	maleWeight = 1.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH33B(Cool8B)/SH33B.tscn"

func getTraits():
	return {
		PartTrait.Haircool: true,
	}
