extends BodypartHair

func _init():
	visibleName = "Short 7"
	id = "SongHair14"

	maleWeight = 0.1
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH14(Short7)/SH14.tscn"

func getTraits():
	return {
		PartTrait.HairOvereye: true,
	}
