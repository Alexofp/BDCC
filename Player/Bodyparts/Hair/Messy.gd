extends BodypartHair

func _init():
	visibleName = "messy"
	id = "messyhair"
	dollType = "Messy"

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/MessyHair/MessyHair.tscn"
