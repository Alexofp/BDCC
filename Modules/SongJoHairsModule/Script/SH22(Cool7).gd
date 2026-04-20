extends BodypartHair

func _init():
	visibleName = "Cool 7"
	id = "SongHair22"

	maleWeight = 1.0
	femaleWeight = 0.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH22(Cool7)/SH22.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
