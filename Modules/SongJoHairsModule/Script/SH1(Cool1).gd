extends BodypartHair

func _init():
	visibleName = "Cool 1"
	id = "SongHair1"

	maleWeight = 1.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH1(Cool1)/SH1.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
