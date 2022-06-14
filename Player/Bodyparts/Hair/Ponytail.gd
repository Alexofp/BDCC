extends BodypartHair

func _init():
	visibleName = "ponytail"
	id = "ponytailhair"
	dollType = "Ponytail"

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/PonytailHair/PonytailHair.tscn"
