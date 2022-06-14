extends BodypartHair

func _init():
	visibleName = "bald"
	id = "baldhair"
	dollType = "Bald"
	
func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/BaldHair/BaldHair.tscn"
