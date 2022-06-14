extends BodypartHair

func _init():
	visibleName = "simple"
	id = "simplehair"
	dollType = "Simple"

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/SimpleHair/SimpleHair.tscn"
