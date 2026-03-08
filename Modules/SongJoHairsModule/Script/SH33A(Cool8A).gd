extends BodypartHair

func _init():
	visibleName = "Cool 8A"
	id = "SongHair33A"

	maleWeight = 0.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH33A(Cool8A)/SH33A.tscn"

func getTraits():
	return {
		PartTrait.Haircool: true,
	}
