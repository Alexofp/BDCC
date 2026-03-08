extends BodypartHair

func _init():
	visibleName = "Short 11"
	id = "SongHair20"

	maleWeight = 1.0
	femaleWeight = 0.5

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH20(Short11)/SH20.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
