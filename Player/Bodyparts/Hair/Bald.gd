extends BodypartHair

func _init():
	visibleName = "bald"
	id = "baldhair"
	
	maleWeight = 0.1
	femaleWeight = 0.0

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/BaldHair/BaldHair.tscn"

func getTraits():
	return {
		PartTrait.HairBald: true,
	}
