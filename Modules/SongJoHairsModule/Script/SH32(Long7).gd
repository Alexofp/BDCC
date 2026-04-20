extends BodypartHair

func _init():
	visibleName = "Long 7"
	id = "SongHair32"

	maleWeight = 0.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH32(Long7)/SH32.tscn"

func getTraits():
	return {
		PartTrait.HairLong: true,
	}
