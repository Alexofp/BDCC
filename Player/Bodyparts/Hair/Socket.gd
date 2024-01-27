extends BodypartHair

func _init():
	visibleName = "short 3"
	id = "sockethair"

	maleWeight = 1.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/SocketHair/SocketHair.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
