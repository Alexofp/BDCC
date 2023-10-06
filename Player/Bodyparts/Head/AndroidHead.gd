extends BodypartHead

func _init():
	visibleName = "android head"
	id = "androidhead"

func getCompatibleSpecies():
	return [] # for special npcs

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Head/AndroidHead/AndroidHead.tscn"

func getHeadLength():
	return 0.0
