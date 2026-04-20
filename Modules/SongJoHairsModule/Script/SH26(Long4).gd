extends BodypartHair

func _init():
	visibleName = "Long 4"
	id = "SongHair26"

	maleWeight = 0.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH26(Long4)/SH26.tscn"

func getTraits():
	return {
		PartTrait.HairLong: true,
	}
