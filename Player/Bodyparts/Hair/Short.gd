extends BodypartHair

func _init():
	visibleName = "short"
	id = "shorthair"
	dollType = "Simple"

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/ShortHair/ShortHair.tscn"
