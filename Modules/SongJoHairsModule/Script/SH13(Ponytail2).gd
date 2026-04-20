extends BodypartHair

func _init():
	visibleName = "Ponytail 2"
	id = "SongHair13"
	
	maleWeight = 1.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Modules/SongJoHairsModule/Png/SH13(Ponytail2)/SH13.tscn"

func getTraits():
	return {
		PartTrait.HairPonytail: true,
	}
