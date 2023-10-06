extends BodypartHead

func _init():
	visibleName = "dragon head"
	id = "dragonhead"

func getCompatibleSpecies():
	return [Species.Dragon]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Head/DragonHead/DragonHead.tscn"

func getHeadLength():
	return 0.7
